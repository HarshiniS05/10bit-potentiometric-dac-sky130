# Block 4 — 2-bit DAC Architecture and Scaling Rule

## Status

**Completed and verified through schematic study, SPICE netlist inspection, and ngspice waveform analysis.**

---

## Objective

The objective of this study block was to understand the operation of a 2-bit potentiometric DAC and verify how the architecture scales hierarchically toward the final 10-bit implementation.

The 2-bit DAC serves as the smallest complete implementation of the resistor-string architecture used throughout this project.

---

## Prompt Used

> How does resistor-string plus switches form a 2-bit DAC, and what is the recursive rule for scaling from 2-bit up to 10-bit?

---

## Architecture Overview

The 2-bit DAC consists of:

* A resistor string generating discrete voltage taps
* Transmission-gate switches used as analog selectors
* Two digital control inputs (`D1`, `D0`)
* One analog output node

The resistor string divides the reference voltage range into equally spaced levels. The switch network routes one of these voltage taps to the output according to the applied digital code.

The schematic used for this study is:

```text
2bitdac.sch
```

Supporting image:

```text
Pictures/2bit_schematic.PNG
```

---

## Theoretical Output Levels

For a 2-bit DAC:

Number of output levels:

2² = 4

Assuming:

* VREFH = 3.3 V
* VREFL = 0 V

The ideal output voltages are:

| Digital Code | Expected Output |
| ------------ | --------------- |
| 00           | 0 V             |
| 01           | 0.825 V         |
| 10           | 1.65 V          |
| 11           | 2.475 V         |

These values represent quarter-scale divisions of the reference voltage range.

---

## Scaling Rule

The hierarchical architecture follows the recursive relationship:

N-bit DAC = Two (N−1)-bit DAC blocks + One additional switch

The rule was verified by examining:

```text
my_3bitdac.spice
my_10bitdac.spice
```

Inspection of the hierarchy confirms that each higher-bit DAC is built from two lower-bit DAC subcircuits and an additional switching stage.

This approach enables scalable construction from 2-bit to 10-bit resolution while preserving the same operating principle.

---

## Simulation Procedure

The following commands were executed from the Prelayout directory:

```bash
cd /home/harshini/avsddac_3v3_sky130_v1/Prelayout/

ngspice my_2bitdac.spice

hardcopy dac_staircase.ps x1_out_v x1_d1 x1_d0

quit

evince dac_staircase.ps &
```

### Purpose of Commands

| Command                                        | Purpose                       |
| ---------------------------------------------- | ----------------------------- |
| ngspice my_2bitdac.spice                       | Run transient simulation      |
| hardcopy dac_staircase.ps x1_out_v x1_d1 x1_d0 | Export waveform to PostScript |
| quit                                           | Exit ngspice                  |
| evince dac_staircase.ps &                      | Open waveform viewer          |

---

## Waveform Verification

The simulation successfully generated a waveform showing:

* Digital input signal `x1_d1`
* Digital input signal `x1_d0`
* Analog output signal `x1_out_v`

Supporting evidence:

```text
dac_staircase.ps
Screenshots/2bit_waveform.PNG

```

The output waveform exhibits the expected staircase behaviour characteristic of a resistor-string DAC.

---

## Observed Output Levels

Approximate output voltages measured from the waveform:

| Digital State | Output Voltage (Approx.) |
| ------------- | ------------------------ |
| 00            | 2.4 V                    |
| 01            | 1.5 V                    |
| 10            | 0.55 V                   |
| 11            | 0.1 V                    |

These values correspond to the voltage taps selected by the switch network implemented in the simulation netlist.

---

## Analysis

The waveform confirms:

1. Correct operation of the transmission-gate switch network.
2. Successful selection of discrete resistor-string voltage taps.
3. Monotonic analog output behaviour.
4. Proper interaction between digital control signals and analog output generation.

No missing levels or non-monotonic transitions were observed in the captured waveform.

---

## Evidence

### Files Studied

```text
2bitdac.sch
my_2bitdac.spice
my_3bitdac.spice
my_10bitdac.spice
```

### Generated Evidence

```text
dac_staircase.ps
screnshots/2bit_schematic.PNG
screnshots/2bit_waveform.PNG
```

### Commands Executed

```bash
ngspice my_2bitdac.spice
hardcopy dac_staircase.ps x1_out_v x1_d1 x1_d0
evince dac_staircase.ps &
```

---

![](screenshots/22bit_schematic.png)
![](screenshots/2bit_waveform.png)

## Conclusion

The 2-bit DAC architecture was successfully studied and verified through both schematic inspection and transient simulation.

The generated waveform demonstrates correct resistor-string DAC operation and validates the switching methodology used throughout the hierarchical design. The same architectural principle is recursively extended to construct the higher-resolution DAC implementations culminating in the 10-bit potentiometric DAC studied in this project.

