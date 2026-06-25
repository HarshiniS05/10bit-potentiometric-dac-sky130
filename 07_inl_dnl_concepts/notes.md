# Block 7 — INL and DNL Concepts

## Prompt used

**Tool:** Claude Sonnet 4.6

> "Explain DNL and INL for a DAC, give the formulas, and explain what a
> missing code means physically."

## Notes

**DNL (Differential Non-Linearity):**
```
DNL[k] = (V_OUT[k+1] - V_OUT[k]) / LSB_ideal - 1
```
Measures how much each individual output step deviates from the ideal 1 LSB
step. Ideal DNL = 0. If DNL reaches exactly -1 LSB, that step has zero
width — meaning two consecutive codes produce the same voltage. That's a
missing code, and it makes the DAC non-monotonic at that point.

**INL (Integral Non-Linearity):**
```
INL[k] = sum of DNL[0] through DNL[k]
```
Measures the cumulative deviation of the actual transfer curve from an ideal
straight line. Ideal INL = 0. Even if every individual DNL value is small,
errors can accumulate across many codes, so INL can be large even when no
single step looks alarming on its own.

## Screenshot to attach

A copy of the reference repo's `DNL_LSB.png` / `INL_LSB.png` plots (found at
`Prelayout/` root in the original repo), annotated with my own notes pointing
out where the curve crosses zero and where it deviates most.

## What's not yet done

I have not generated my own INL/DNL data from a self-built netlist yet — this
depends on Block 3/4 being resolved first so there's an actual working 2-bit
or 4-bit sweep to compute from, rather than reusing the reference repo's
pre-existing data.
