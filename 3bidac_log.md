# 3-Bit DAC — Hierarchical Scale-Up (Addendum to LOG.md)

## Objective

Scale the verified 2-bit resistor-string DAC block up to 3 bits, reusing the
existing `2bitdac_v2` and `TG2` blocks as subcircuits rather than re-deriving
a 7-switch mux tree from individual transistors.

## Architecture

```
3bitdac
├── X1: 2bitdac_v2   (VREF1 -> mid_node)   -- upper half, 4 taps
├── X2: 2bitdac_v2   (mid_node -> gnda)    -- lower half, 4 taps
└── X3: TG2                                -- combining stage, selected by d2/d2b
```

No boundary resistor adjustment was needed: each `2bitdac_v2` instance
already contains 4 full 500Ω resistors internally, so two in series simply
give 8 uniform 500Ω segments end to end.

## Required modification: 2bitdac_v2

The original `2bitdac` used `gnda` for two different roles at once — the
bottom of the resistor ladder, and the bulk/substrate reference for every
NMOS inside its TG2 instances. Chaining two ladders requires the *upper*
block's ladder bottom to sit at 0.9V (the midpoint), not 0V — but tying
transistor bulks to a non-zero voltage would incorrectly bias every switch
in that block.

**Fix:** exposed the ladder bottom as its own port, `vref_bottom`, separate
from `gnda` (which stays true 0V everywhere, used only for transistor bulk
reference). For standalone use, `vref_bottom` is simply tied to `gnda`,
reproducing the original 2-bit behavior exactly.

## Bug found and fixed: incorrect TG2 port order

While generating the SPICE files for this scale-up, the `TG2` subcircuit
header was written using an assumed "conventional" port order
(`din inp1 inp2 vdd vout gnda dinb`) instead of the actual verified,
xschem-generated port order (`gnda vout inp2 inp1 dinb din vdd`).

**Symptom:** first simulation attempt gave `xdac.mid_node = 1.28V` (expected
0.9V) and `v_out = 1.77V` at code 000 (expected 0V) — a clear sign of
scrambled pin connections, not a resistor or logic error.

**Root cause:** SPICE matches subcircuit ports by position, not name. Since
the transistor-level connections inside TG2 reference ports by name (so they
were unaffected), only the `.subckt TG2` header's declared port *order*
needed correcting to match the real, previously-verified interface.

**Fix:** corrected the header to `.subckt TG2 gnda vout inp2 inp1 dinb din vdd`,
matching the interface already confirmed working in the 2-bit block earlier
in this project. Re-ran the simulation — `mid_node` settled to exactly 0.9V
and `v_out` at code 000 settled to ~35nV (floating-point noise, effectively
0V), confirming the fix.

This is the same failure mode documented in reference material shared for
this project: *"the AI assumed a conventional interface instead of
preserving the symbol-generated interface."* Noted here directly as an
example of a real, self-caught error during this session.

## Testbench iteration: aligning digital transitions

An initial testbench using independent `PULSE` sources with staggered edges
(each bit's transition offset by ~1ns from the others) produced a technically
correct but visually noisy waveform — brief, real intermediate codes
appeared between each intended code, since the bits didn't all change at
exactly the same instant.

**Fix:** rewrote the testbench using explicit `PWL` breakpoints for all
three bits (and their complements), with every transition landing at the
exact same time boundary (every 10ns) and using an identical 100ps edge
window across all bits. This produces a clean staircase with a single
transition per code change, rather than multiple.

## Final Verified Result

Testbench: `3bitdac_tb_clean.spice`, all 8 codes swept, 10ns each, 80ns total,
VREF1 = 1.8V.

| Time window | Code (d2 d1 d0) | v_out (measured) |
|---|---|---|
| 0–10ns  | 000 | 0 V |
| 10–20ns | 001 | 0.225 V |
| 20–30ns | 010 | 0.45 V |
| 30–40ns | 011 | 0.675 V |
| 40–50ns | 100 | 0.90 V |
| 50–60ns | 101 | 1.125 V |
| 60–70ns | 110 | 1.35 V |
| 70–80ns | 111 | 1.575 V |

![3bitdac waveform](./3bitdac/images/3bitdac_waveform.png)
*Clean 8-level ascending staircase, 0.225V steps, matching LSB = VREF/8
exactly.*

All 8 levels present, correctly ordered, uniform step size confirmed —
matches theoretical LSB (`1.8V / 8 = 0.225V`) exactly.

### Settling / glitch observation

A visible dip is present at the 39–40ns transition (code 011 → 100), where
`v_out` briefly drops below its final 0.9V level before settling. This is
the **major-code transition** — all three bits flip simultaneously — and
the glitch persists even with perfectly aligned control-signal edges
(confirmed by ruling out testbench timing as the cause via the PWL fix
above). This confirms the glitch is a genuine switch-level settling effect:
with more TG2 stages now in series (up to 3, versus 1 at the 2-bit level),
the different signal paths do not all finish switching at precisely the same
instant, causing a brief, real intermediate voltage before final settling.
This effect is expected to become more pronounced at higher bit counts (4,
8, 10-bit), where major-carry transitions pass through even more
simultaneously-switching stages.

## Lessons Learned (additional, beyond 2-bit block)

1. When reusing a verified subcircuit inside a new hierarchy, any port that
   served two roles at once in the standalone version (here: `gnda` as both
   ladder-bottom and transistor-bulk-ground) needs to be split into separate
   ports before chaining — otherwise a correct standalone block can produce
   a subtly wrong hierarchical result.
2. Manually re-declaring a subcircuit's port order from memory or convention
   is risky — even when the internal circuit is unchanged, a reordered
   `.subckt` header silently scrambles every connection at instantiation,
   since SPICE resolves subcircuit ports by position. Always verify against
   the actual previously-confirmed interface, not an assumed standard one.
3. A digital testbench that produces "technically correct but momentarily
   confusing" waveforms (real transient codes between intended ones) is not
   a DAC bug — it can be purely a testbench edge-alignment artifact, and is
   worth ruling out with a controlled, perfectly-aligned-edge test before
   attributing an odd transient to the DUT itself.
