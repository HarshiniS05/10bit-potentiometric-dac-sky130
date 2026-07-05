# Block 5 — VREF, LSB, and Output Step Calculation

## Objective

Understand how the reference voltages define the DAC output range and derive the output voltage equation for the 10-bit potentiometric DAC.

---

## Prompt Used

**Tool:** Claude Sonnet 4.6

> "Explain how VREFH and VREFL set the DAC's output range, and derive the output voltage formula for a 10-bit DAC."

---

## Reference Voltage Range

The resistor-string DAC uses two reference voltages:

* VREFH = 3.3 V
* VREFL = 0 V

These references define the minimum and maximum output voltages available from the DAC.

Therefore:

Output Range = VREFH − VREFL

= 3.3 V − 0 V

= 3.3 V

The DAC output can only exist within this range.

---

## Resolution and LSB Calculation

For a 10-bit DAC:

Number of output levels:

Levels = 2¹⁰ = 1024

The ideal Least Significant Bit (LSB) size is:

LSB = (VREFH − VREFL) / 2¹⁰

= 3.3 / 1024

≈ 3.22 mV

This means every increment in digital code ideally increases the analog output by approximately 3.22 mV.

---

## Output Voltage Equation

For a digital input code D:

VOUT = (D / 2¹⁰) × 3.3

where:

* D = decimal equivalent of the 10-bit input code
* 0 ≤ D ≤ 1023

---

## Verification Examples

| Digital Code | Calculation         | Expected Output |
| ------------ | ------------------- | --------------- |
| 0            | (0 / 1024) × 3.3    | 0 V             |
| 1            | (1 / 1024) × 3.3    | 3.22 mV         |
| 512          | (512 / 1024) × 3.3  | 1.65 V          |
| 1023         | (1023 / 1024) × 3.3 | 3.2968 V        |

---

## Verification Method

The equation was independently re-derived from the resistor-string architecture studied in Block 1.

Since 1024 equal resistors divide the 3.3 V reference into equal voltage increments, each tap corresponds to a fixed fraction of the total reference voltage.

Tap D therefore sits at:

D / 1024

of the total voltage range, leading directly to the output equation above.

This derivation was performed independently rather than accepted directly from the AI response.

---

## Evidence

Files consulted:

* 10bitdac.sch
* my_10bitdac.spice
* Block 1 resistor-string architecture notes

Verification approach:

* Manual derivation from resistor-divider principles
* Cross-checking against expected DAC transfer characteristics
* Validation of calculated output levels at multiple digital codes

---

## Key Takeaway

The DAC output voltage is completely determined by the reference voltage range and the selected resistor-string tap. The LSB size of approximately 3.22 mV establishes the smallest ideal voltage step achievable by this 10-bit design.

