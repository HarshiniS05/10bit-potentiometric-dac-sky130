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

# Transmission Gate

A transmission gate is implemented using parallel NMOS and PMOS transistors driven by complementary control signals.

```text
          PMOS
IN ───────────── OUT
          │
         NMOS
```

Control Signals:

* NMOS Gate = Enable
* PMOS Gate = Enable (inverted)

Advantages:

* Rail-to-rail signal transmission
* Low ON resistance
* Bidirectional operation
* Reduced voltage degradation
* Improved linearity compared to a single MOS switch

The verified TG2 cell serves as the fundamental switching element throughout the hierarchical DAC design. Consistent pin ordering for TG2's `dinb`/`din` control pair — matching the true/complement select signal at every hierarchy level — is essential; a swapped pair at any level causes the affected DAC section's output to select the wrong half of its range on that bit's transition.

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

Each higher-resolution DAC reuses previously verified subcircuits, reducing design complexity and improving verification efficiency.

Benefits include:

* Modular design
* Easier debugging
* Reusable circuit blocks
* Simplified verification
* Faster development

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

The following modules have been implemented and verified at the pre-layout level:

* ✅ TG2
* ✅ 2-bit DAC
* ✅ 3-bit DAC
* ✅ 4-bit DAC
* ✅ 5-bit DAC
* ✅ 6-bit DAC
* ✅ 7-bit DAC
* ✅ 8-bit DAC
* 🔲 9-bit DAC — schematic complete; simulation/waveform verification pending

The hierarchical implementation of the **10-bit DAC** is currently under development and will build upon the verified 9-bit architecture once its simulation is complete.
