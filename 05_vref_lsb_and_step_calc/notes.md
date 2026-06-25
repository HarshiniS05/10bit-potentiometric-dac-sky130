# Block 5 — VREF, LSB, Output Step Calculation

## Prompt used

**Tool:** Claude Sonnet 4.6

> "Explain how VREFH and VREFL set the DAC's output range, and derive the
> output voltage formula for a 10-bit DAC."

## Notes

- VREFH = 3.3 V, VREFL = 0 V (per the repo's IP specification)
- Output range = VREFH - VREFL = 3.3 V
- Output formula: V_OUT = (D / 2^N) × VREFH, where D is the decimal value of
  the digital input code
- LSB = VREFH / 2^N = 3.3 / 1024 ≈ 3.22 mV

## Verified by hand

Re-derived the formula from the resistor-string picture directly (Block 1)
rather than accepting it as a given: each resistor in the 1024-resistor
chain drops an equal fraction of the total 3.3V, so tap D sits at exactly
D/1024 of the way from VREFL to VREFH. This is the same formula, arrived at
independently, which is the verification.
