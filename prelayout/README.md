# Pre-layout Design of a 10-bit Potentiometric DAC using SKY130

## Introduction

This directory contains the pre-layout implementation of a hierarchical **10-bit potentiometric (resistor-string) Digital-to-Analog Converter (DAC)** designed using the **SKY130 Open PDK**. The objective is to construct a scalable, monotonic, and reusable DAC architecture by incrementally building higher-resolution DACs from verified lower-resolution blocks.

The design is captured using **Xschem**, simulated with **ngspice**, and organized hierarchically to simplify verification and improve reusability.

---

# Digital-to-Analog Converter (DAC)

A Digital-to-Analog Converter (DAC) converts a binary digital input into a proportional analog voltage or current. DACs are fundamental components in mixed-signal integrated circuits and are widely used in communication systems, instrumentation, control systems, audio electronics, and data acquisition.

For an N-bit DAC, the number of available output levels is:

[
2^N
]

The output voltage is ideally given by:

[
V_{OUT}=V_{REF}\times\frac{Code}{2^N-1}
]

where:

* **VREF** = Reference voltage
* **Code** = Decimal equivalent of the digital input
* **N** = Resolution of the DAC

---

# Potentiometric (Resistor-String) DAC

A potentiometric DAC, also known as a resistor-string DAC, generates analog voltages by dividing the reference voltage across a series string of identical resistors.

A resistor ladder is connected between **VREF** and **Ground**, producing equally spaced voltage taps. A decoder activates one transmission gate corresponding to the digital input code, connecting the selected tap to the output. Tap index increases with voltage, so that increasing digital code selects a higher voltage tap:

```text
VREF
 │
 R
 │── Tap (2^N−1)
 R
 │── Tap (2^N−2)
 .
 .
 .
 R
 │── Tap 1
 R
 │── Tap 0
 │
GND
```

Each resistor has an equal value, ensuring uniform voltage spacing across the ladder. `Tap 0` (nearest `GND`) corresponds to the lowest output code, and `Tap (2^N−1)` (nearest `VREF`) corresponds to the highest — this ordering is what guarantees the monotonic increase in output voltage as the code increases.

---

# Principle of Operation

The resistor string creates equally spaced voltage levels between the reference voltage and ground.

The digital input is decoded into a one-hot selection signal. Exactly one transmission gate turns ON, connecting one resistor tap to the output while all remaining switches remain OFF.

This architecture guarantees:

* One active signal path
* Uniform voltage steps
* Monotonic transfer characteristics
* No missing output codes

---

# Resolution

The resolution of a DAC represents the smallest change in output voltage corresponding to a one-bit increment of the digital input.

The Least Significant Bit (LSB) voltage is

[
LSB=\frac{V_{REF}}{2^N-1}
]

Example (VREF = 1.8 V):

| Resolution | LSB Size |
| ---------- | -------- |
| 2-bit      | 0.60 V   |
| 3-bit      | 0.257 V  |
| 4-bit      | 0.120 V  |
| 5-bit      | 58.06 mV |
| 6-bit      | 28.57 mV |
| 7-bit      | 14.17 mV |
| 8-bit      | 7.06 mV  |
| 9-bit      | 3.52 mV  |
| 10-bit     | 1.76 mV  |

Increasing the number of bits improves output resolution while reducing the voltage step size.

---

# Transmission Gate (TG2)

A transmission gate is implemented using parallel NMOS and PMOS transistors driven by complementary control signals.

```text
          PMOS
IN ───────────── OUT
          │
         NMOS
```

Control Signals:

* NMOS Gate = Enable (`din`)
* PMOS Gate = Enable, inverted (`dinb`)

Advantages:

* Rail-to-rail signal transmission
* Low ON resistance
* Bidirectional operation
* Reduced voltage degradation
* Improved linearity compared to a single MOS switch

`TG2` is a *double* transmission gate — one complementary pass-gate pair per input (`inp1`, `inp2`), sharing a single output (`vout`). This is what lets it act as a 2:1 mux: `inp1` is passed through when `din=1`, and `inp2` is passed through when `din=0`. It's the fundamental switching primitive reused throughout the entire hierarchy — both as the internal bit-select switches inside `2bitdac_v2`, and as the outer MSB mux at every higher bit-width level.

Consistent pin ordering for TG2's `dinb`/`din` pair — matching the true/complement select signal at every hierarchy level — is essential; a swapped pair at any level causes the affected DAC section's output to select the wrong half of its range on that bit's transition (see the 5-bit and 6-bit entries below for real examples of this).

| | |
|---|---|
| **Schematic** | ![TG2 schematic](week_4/TG2/images/TG2_sch.png) |
| **din/dinb control** | ![TG2 din/dinb control](week_4/TG2/images/TG2_din_dinb_control.png) |
| **Verified waveform** | ![TG2 waveform](week_4/TG2/images/TG2_full_waveform_clean.png) |

The verified waveform shows the output cleanly following whichever input (`inp1`/`inp2`) is selected by `din`/`dinb`, with a clean rail-to-rail transition and no glitching at the switch point.

---

# Hierarchical Design Methodology

Rather than designing the complete 10-bit DAC directly, the circuit is developed hierarchically.

```text
TG2
 ↓
2-bit DAC
 ↓
3-bit DAC
 ↓
4-bit DAC
 ↓
5-bit DAC
 ↓
6-bit DAC
 ↓
7-bit DAC
 ↓
8-bit DAC
 ↓
9-bit DAC
 ↓
10-bit DAC
```

Each N-bit DAC is built from two verified (N-1)-bit DAC blocks plus one `TG2` mux, with the new MSB as the mux select:

```
N-bit DAC
├── upper (N-1)-bit DAC   (vref_top → mid_node)
├── lower (N-1)-bit DAC   (mid_node → gnda)
└── TG2 mux               (selects upper_out / lower_out via MSB)
```

`mid_node` is shared as the bottom reference of the upper half and the top reference of the lower half, so the two (N-1)-bit resistor strings form one continuous series string end to end.

Each higher-resolution DAC reuses previously verified subcircuits, reducing design complexity and improving verification efficiency. Benefits include modular design, easier debugging, reusable circuit blocks, simplified verification, and faster development.

---

# DAC Stages — Schematics and Waveforms

Each stage below was verified with an ngspice testbench sweeping every code from `0` to `2^N-1`, holding each code for 100ns, with bit `k` toggling every `2^k × 100ns` (LSB fastest, MSB slowest — one clean transition splitting the run in half). A correctly working stage shows one continuous, monotonically rising staircase with `2^N` distinct flat steps from 0V to ~1.8V.

## 2-bit DAC

The base resistor-string block: four 500Ω resistors (`R1`–`R4`) in series between `vref_top` and `vref_bottom`, with two internal `TG2` instances selecting the tap pair and a third `TG2` making the final bit-select. This is the only block in the hierarchy containing real `R` elements — every higher bit-width block is pure composition of lower blocks plus one outer `TG2`.

| | |
|---|---|
| **Schematic** | ![2-bit DAC schematic](prelayout/images/2bitdac_schematic.png) |
| **Waveform** | ![2-bit DAC waveform](prelayout/images/2bitdac_waveform.png) |

Clean 4-level staircase, verified on first pass.

## 3-bit DAC

First hierarchical composition: two `2bitdac_v2` blocks plus one outer `TG2`, selected by the new MSB (`d2`).

| | |
|---|---|
| **Schematic** | ![3-bit DAC schematic](prelayout/images/3bitdac-schematic.png) |
| **Waveform** | ![3-bit DAC waveform](prelayout/images/3bitdac_waveform.png) |

**Bug found and fixed:** the testbench initially drove a reference source at a node named `VREF1`, while the actual flattened netlist's top-level reference pin was `vref_top` — two unrelated nodes. The resistor string had no DC reference at all and was floating, producing only millivolt-scale capacitive-coupling spikes at switching instants instead of a real staircase. Fixed by matching the testbench source to the netlist's real node name. The waveform above is the corrected, verified run.

## 4-bit DAC

Two `3bitdac_v2` blocks plus one outer `TG2`, selected by `d3`.

| | |
|---|---|
| **Schematic** | ![4-bit DAC schematic](prelayout/images/4bitdac_schematic.png) |
| **Waveform** | ![4-bit DAC waveform](prelayout/images/4bitdac_waveform.png) |

Clean 16-level staircase, verified on first pass — no pin-order or reference issues found in this stage.

## 5-bit DAC

Two `4bitdac_v2` blocks plus one outer `TG2`, selected by `d4`.

| | |
|---|---|
| **Schematic** | ![5-bit DAC schematic](prelayout/images/5bitdac_schematic.png) |
| **Waveform** | ![5-bit DAC waveform](prelayout/images/5bitdac_waveform.png) |

**Bug found and fixed:** the outer `TG2`'s `dinb`/`din` pins were connected as `d4 d4b` instead of `d4b d4`, reversing the mux's select logic. The staircase rose correctly through the first 16 codes, then dropped sharply back to 0V at the MSB transition instead of continuing to climb, before restarting a second, unconnected 16-level rise from 0V — visually, two back-to-back 4-bit staircases instead of one continuous 5-bit one. Fixed by swapping the wire connections at the `TG2` instance so `d4b` lands on `dinb` and `d4` lands on `din`. The waveform above is the corrected, verified run.

## 6-bit DAC

Two `5bitdac_v2` blocks plus one outer `TG2`, selected by `d5`.

| | |
|---|---|
| **Schematic** | ![6-bit DAC schematic](prelayout/images/6bitdac_schematic.png) |
| **Waveform** | ![6-bit DAC waveform](prelayout/images/6bitdac_waveform.png) |

**Bug found and fixed (two-stage):** the same `dinb`/`din` swap bug reappeared inside the reused `5bitdac_v2` block itself. The first fix attempt corrected the swap by reordering `5bitdac_v2`'s own external pin list — but the parent `6bitdac.sch`, which still called that block using the *old* pin order, silently reintroduced the same select-inversion at the connection boundary instead of fixing it. The real fix required updating both: the internal `TG2` wiring inside `5bitdac_v2`, *and* the `x1`/`x2` instance argument order in `6bitdac.sch` that calls it. Lesson carried forward into later stages: when a reusable block's external pin order changes, every parent instance calling it must be re-verified against the new order, not just the block itself.

## 7-bit DAC

Two `6bitdac_v2` blocks plus one outer `TG2`, selected by `d6`.

| | |
|---|---|
| **Schematic** | ![7-bit DAC schematic](prelayout/images/7bitdac_schematic.png) |
| **Waveform** | ![7-bit DAC waveform](prelayout/images/7bitdac-waveform.png) |

Full pin-order audit across all six nested hierarchy levels came back clean — no swap bug this time. One non-functional issue surfaced during simulation: ngspice's default behavior of archiving every internal node (every `tab_a/b/c`, `node_a/b`, `mid_node` at every recursion depth) came within ~100MB of the ~2.5GB internal data cap on the 128-code, 100ps-timestep run. Not a circuit bug, but noted for the memory fix applied starting with the 8-bit stage.

## 8-bit DAC

Two `7bitdac_v2` blocks plus one outer `TG2`, selected by `d7`.

| | |
|---|---|
| **Schematic** | ![8-bit DAC schematic](prelayout/images/8bitdac_schematic.png) |
| **Waveform** | ![8-bit DAC waveform](prelayout/images/8bitdac_waveform.png) |

Pin-order audit clean across all seven nested hierarchy levels. A `.save` directive was added to the testbench ahead of time (before running, based on the 7-bit memory warning) to store only the signals needed for verification (`v_out`, digital control lines, `mid_node`, `vref_top`) rather than every internal ladder node — cutting stored simulation data by roughly two orders of magnitude and keeping the 256-code run well within ngspice's memory limit.

## 9-bit DAC

Two `8bitdac_v2` blocks plus one outer `TG2`, selected by `d8`.

| | |
|---|---|
| **Schematic** | ![9-bit DAC schematic](prelayout/images/9bitdac_schematic.png) |
| **Waveform** | *pending — simulation and waveform verification not yet completed* |

Schematic capture is complete; `9bitdac_v2.sch`/`.sym` (needed to reuse this stage as a building block for the 10-bit DAC) have not yet been created. Simulation and waveform verification are the next step before proceeding to the 10-bit design.

---

# Monotonicity

A resistor-string DAC is inherently monotonic because increasing the digital input always selects a higher resistor tap.

This guarantees:

* Output voltage never decreases for an increasing input code.
* No missing codes.
* Smooth analog transfer characteristics.

These properties make resistor-string DACs suitable for precision measurement and instrumentation applications.

---

# Linearity

The performance of a DAC is evaluated using two important linearity metrics.

### Differential Non-Linearity (DNL)

DNL measures the deviation of each output step from the ideal LSB.

An ideal DAC has:

* DNL = 0 LSB

A monotonic DAC satisfies:

* DNL > -1 LSB

---

### Integral Non-Linearity (INL)

INL measures the deviation of the actual transfer characteristic from the ideal straight-line response.

Smaller INL values indicate higher accuracy.

---

# Pre-layout Design Flow

The complete design flow adopted in this project is:

```text
Circuit Specification
        ↓
Hierarchical Schematic Capture (Xschem)
        ↓
SPICE Netlist Generation
        ↓
Functional Simulation (ngspice)
        ↓
Output Verification
        ↓
Hierarchy Expansion
        ↓
Final 10-bit DAC
```

Each DAC stage is verified before being used as a building block for the next level.

---

# Software and Tools

* SKY130 Open PDK
* Xschem
* ngspice
* Git
* GitHub
* Linux (Ubuntu)

---

# Current Status

| Stage | Verified | Notes |
|---|---|---|
| TG2 | ✅ | Base switching primitive |
| 2-bit DAC | ✅ | Base resistor-string block |
| 3-bit DAC | ✅ | Floating-reference bug found and fixed |
| 4-bit DAC | ✅ | Clean on first pass |
| 5-bit DAC | ✅ | `dinb`/`din` swap found and fixed |
| 6-bit DAC | ✅ | Boundary-mismatch bug found and fixed after initial partial fix |
| 7-bit DAC | ✅ | Clean netlist audit; memory-limit warning during simulation |
| 8-bit DAC | ✅ | Clean netlist audit; `.save` applied proactively |
| 9-bit DAC | 🔲 | Schematic complete; simulation/waveform verification pending |
| 10-bit DAC | 🔲 | Next — reuse `9bitdac_v2` the same way each prior stage reused its predecessor |

The hierarchical implementation of the **10-bit DAC** is currently under development and will build upon the verified 9-bit architecture once its simulation is complete.
