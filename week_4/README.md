# 10-Bit Potentiometric DAC — AI-Assisted Circuit Design 

## Project Context

This repository documents Week 2 & 3 work for the VSD Analog and Mixed-Signal
VLSI Internship, building on the reference repository
[`vsdip/avsddac_3v3_sky130_v1`](https://github.com/vsdip/avsddac_3v3_sky130_v1),
which targets a 10-bit potentiometric Digital-to-Analog Converter using the
SkyWater SKY130 open-source PDK.

Per the task scope, this stage focuses **only on the circuit-design side** —
not layout, GDS, or full repo reproduction. The goal is to recreate and verify
individual DAC building blocks step by step using AI-assisted prompts
(Claude), testing every generated circuit/netlist in xschem + ngspice with
SKY130 device models.

---

## Block Selected: 2-Bit Resistor-String DAC (Switch + Ladder)

- **Switch design:** `TG2` — a SKY130 CMOS transmission-gate 2:1 analog
  multiplexer
- **Resistor ladder:** 4× 500Ω resistors forming a potentiometric divider
  between `VREF1` and `gnda`
- **Hierarchy:** `2bitdac` — combines the ladder and three `TG2` instances in
  a mux-tree to select 1 of 4 tap voltages based on a 2-bit digital code
  (`d1 d0`)

## Design Goal

Verify that a 2-bit slice of the potentiometric DAC architecture produces a
correct, monotonic, evenly-spaced 4-level output staircase — establishing a
verified foundation block before scaling to 4-bit, 8-bit, and eventually the
full 10-bit hierarchy.

## Expected Result

| Code (d1 d0) | Expected v_out |
|---|---|
| 00 | 0 V |
| 01 | 0.45 V |
| 10 | 0.90 V |
| 11 | 1.35 V |

(VREF1 = 1.8V, 4× 500Ω ladder → 0.45V per step, LSB = VREF/4)

## Tools Used

- xschem (schematic capture + netlisting)
- ngspice-37 (transient simulation)
- SKY130 PDK (`sky130_fd_pr__nfet_01v8`, `sky130_fd_pr__pfet_01v8`)
- AI assistant: **Claude (Anthropic)** — used for prompt-driven circuit
  debugging, netlist verification, and root-cause analysis at every step

---

## Repo Structure

```
.
├── README.md
├── LOG.md                    # full AI-assisted debugging log
├── CONCEPTS.md                # LSB, reference behavior, INL/DNL, settling, scaling plan
├── TG2/
│   ├── TG2.sch                # corrected transmission-gate schematic
│   ├── TG2.sym                # auto-extracted symbol
│   ├── TG2.spice               # verified subcircuit netlist
│   └── TG2_tb.spice            # standalone testbench
├── 2bitdac/
│   ├── 2bitdac.sch             # corrected hierarchy schematic
│   ├── 2bitdac.sym
│   ├── 2bitdac.spice            # verified flat netlist (R-ladder + 3x TG2 calls)
│   └── 2bitdac_tb.spice         # full DAC testbench (all 4 codes swept)
└── images/
    └── 2bitdac_waveform.png     # ngspice transient result, all 4 codes
```

## How to Reproduce (assumes xschem, ngspice, SKY130 already installed)

```bash
# 1. Verify the switch in isolation
cd TG2
ngspice TG2_tb.spice

# 2. Verify the full 2-bit DAC
cd ../2bitdac
ngspice 2bitdac_tb.spice
```

Inside the ngspice `.control` block, `wrdata` is used to export the transient
result to a `.txt` file if you don't have a graphical ngspice display
available; otherwise `run` followed by `plot` commands will open interactive
waveform windows.

---

## AI Prompts & Debugging Log

See [`LOG.md`](./LOG.md) for the complete, chronological record of every
prompt-driven design step, bug found, root cause, and fix applied — including
two hierarchical bugs (empty subcircuit instances from a stale symbol, and a
tap-mapping error causing duplicate output levels) that were only caught by
close netlist inspection.

---

## Conceptual Analysis (LSB, Reference Behavior, INL/DNL, Settling, Scaling)

Full derivations and discussion are in [`CONCEPTS.md`](./CONCEPTS.md).
Summary:

### 1. LSB Size

```
LSB = VREF / 2^N
```

For the verified 2-bit block: `LSB = 1.8V / 4 = 0.45V` — confirmed exactly by
simulation.

| N (bits) | 2^N | LSB |
|---|---|---|
| 2 | 4 | 450 mV |
| 4 | 16 | 112.5 mV |
| 6 | 64 | 28.125 mV |
| 8 | 256 | 7.03 mV |
| 10 | 1024 | 1.76 mV |

Note: full-scale output reaches `(2^N - 1) × LSB`, not `VREF` itself. This is
standard behavior for this ladder topology (not a design error) — full-scale
range is `(2^N - 1)/2^N × VREF` by design, since the top resistor R1 sits
between `VREF1` and the highest selectable tap.

### 2. Reference Voltage Behavior

The DAC is **ratiometric**: `v_out(code) = code × (VREF / 2^N)`. Every tap
voltage is a fixed fraction of `VREF1`, so noise or drift on `VREF1` scales
proportionally into every output code. `TG2` itself is not in the VREF path —
it only passes already-divided tap voltages — so switch on-resistance affects
settling and loading error, not the ideal divided voltage, provided the load
is high-impedance (verified with a 1MΩ dummy load).

### 3. INL / DNL

| Code | V(code) | Step from prior | DNL | Ideal V | INL |
|---|---|---|---|---|---|
| 00 | 0 V | — | — | 0 V | 0 |
| 01 | 0.45 V | 0.45 V | 0 | 0.45 V | 0 |
| 10 | 0.90 V | 0.45 V | 0 | 0.90 V | 0 |
| 11 | 1.35 V | 0.45 V | 0 | 1.35 V | 0 |

0 DNL and 0 INL across all codes, as expected for an ideal-resistor
pre-layout simulation with no mismatch modeled. Real DNL/INL error would only
appear with resistor mismatch or code-dependent switch resistance — relevant
once mismatch/Monte Carlo simulation is introduced at higher bit counts.

### 4. Settling Time

The transient sweep shows `v_out` settling well within the 10ns hold time per
code, with a visible glitch/overshoot at the 01→10 transition — attributed to
`d1` and `d0` changing simultaneously and the two mux stages not switching in
perfect lockstep (a code-transition glitch, similar to a major-carry glitch
in binary-weighted DACs). A `.meas`-based quantification is proposed in
`CONCEPTS.md` but not yet executed with a final numeric result.

### 5. Scaling Plan

```
2bitdac  →  4bitdac (two 2bitdac blocks + 1 TG2 combining stage)
         →  8bitdac (two 4bitdac blocks + 1 TG2 combining stage)
         →  10bitdac (one 8bitdac + one 2bitdac + TG2, or equivalent
                       tap-budget arrangement)
```

| Stage | Resistors | LSB (VREF=1.8V) |
|---|---|---|
| 2-bit (done) | 4 | 450 mV |
| 4-bit | 16 | 112.5 mV |
| 8-bit | 256 | 7.03 mV |
| 10-bit | 1024 | 1.76 mV |

Immediate next block: a **4-bit DAC** combining two verified `2bitdac`
instances with one additional `TG2` combining stage and a top-level select
bit `d2`/`d2b`, following the same shared-boundary-node pattern used for
`x2`'s `gnda` input in this design (analogous to `vref5` in the reference
repo's `ai3bitdac`/`ai4bitdac` construction).

---

## Demonstration Video

[Video link here — to be added]

---



