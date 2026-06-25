# Block 6 — Monotonicity and Settling Behaviour

## Objective

Understand why resistor-string DACs are inherently monotonic and identify the physical mechanisms responsible for output settling time.

---

## Prompt Used

**Tool:** Claude Sonnet 4.6

> "Why is a resistor-string DAC structurally monotonic? Separately, explain what causes settling delay in this kind of DAC (RC effects, switch resistance)."

---

## Monotonicity

A resistor-string DAC is monotonic by construction.

The resistor ladder forms a sequence of increasing voltage taps between VREFL and VREFH.

As the digital code increases, the selected tap moves in only one direction along the resistor chain.

Therefore:

Higher Code → Higher Tap Voltage

As a result, the output voltage cannot decrease when the input code increases.

This property comes directly from the architecture and does not rely on precise resistor matching.

---

## Why Monotonicity Matters

Monotonicity guarantees predictable behavior during code transitions.

This is especially important in:

* Data converters
* Sensor interfaces
* Control systems
* Precision analog signal generation

A monotonic DAC ensures that increasing a digital command never causes an unexpected decrease in output voltage.

---

## Missing Codes

A missing code occurs when two adjacent digital codes produce the same output voltage.

This corresponds to:

DNL = -1 LSB

In practical DACs, missing codes are undesirable because they reduce resolution and introduce transfer-function discontinuities.

If DNL becomes less than -1 LSB, missing codes can occur and monotonicity may be compromised.

---

## Settling Behaviour

When the digital input changes:

1. The currently active transmission gate turns OFF.
2. A new transmission gate turns ON.
3. The output node transitions to a different resistor-string tap voltage.

The output voltage does not change instantaneously because real circuits contain resistance and capacitance.

---

## Sources of Settling Delay

### 1. Switch ON Resistance

The transmission gate is not an ideal short circuit.

Both the NMOS and PMOS devices contribute finite ON resistance.

This resistance slows charging and discharging of the output node.

### 2. Parasitic Capacitance

Capacitance exists at:

* Switch terminals
* Metal interconnects
* Device junctions
* Output node

These capacitances store charge and resist instantaneous voltage changes.

---

## RC Time Constant

The combination of switch resistance and parasitic capacitance forms an RC network.

The settling behavior is therefore governed by:

τ = R × C

where:

* R = effective switch resistance
* C = total node capacitance

Larger resistance or capacitance results in longer settling times.

---

## Waveform Observation

A transient simulation of the 2-bit DAC was executed using ngspice.

### Commands Used

```bash
cd /home/harshini/avsddac_3v3_sky130_v1/Prelayout/

ngspice my_2bitdac.spice

hardcopy dac_staircase.ps x1_out_v x1_d1 x1_d0
```

### Observed Behaviour

* Digital control signals transition through multiple code combinations.
* The analog output follows a staircase response.
* Output voltage increases monotonically with code.
* No unexpected inversions or voltage reversals were observed.

---

## Evidence

Generated files:

* dac_staircase.ps
* Pictures/2bit_waveform.PNG

Supporting files:

* switch.spice
* my_2bitdac.spice

---

## Current Limitation

A transient waveform has been generated and inspected.

However, a formal settling-time measurement using:

```spice
.meas
```

commands has not yet been performed.

Therefore, this block currently verifies qualitative settling behaviour rather than a quantified settling-time specification.

---

## Key Takeaway

The resistor-string architecture guarantees monotonic output behaviour, while practical settling time is determined by the RC network formed by transmission-gate resistance and circuit parasitics. The observed staircase waveform confirms the expected monotonic operation of the DAC.

