# Block 7 — INL and DNL Concepts

## Objective

Understand the meaning of Differential Non-Linearity (DNL) and Integral Non-Linearity (INL) in DACs and interpret the significance of missing codes.

---

## Prompt Used

**Tool:** Claude Sonnet 4.6

> "Explain DNL and INL for a DAC, give the formulas, and explain what a missing code means physically."

---

## Differential Non-Linearity (DNL)

DNL measures the deviation of an actual DAC step size from the ideal 1-LSB step.

The DNL for code k is:

DNL[k] = (VOUT[k+1] − VOUT[k]) / LSBideal − 1

Interpretation:

* DNL = 0 → ideal step size
* DNL > 0 → larger-than-ideal step
* DNL < 0 → smaller-than-ideal step

---

## Missing Codes

A missing code occurs when two adjacent digital codes produce the same analog output voltage.

This corresponds to:

DNL = -1 LSB

At this point the step width becomes zero.

Missing codes reduce the effective resolution of the DAC and can lead to degraded transfer characteristics.

---

## Integral Non-Linearity (INL)

INL measures the accumulated deviation of the DAC transfer curve from an ideal straight line.

Conceptually:

INL[k] = Σ DNL[i]

for all codes up to k.

Interpretation:

* INL = 0 → ideal transfer characteristic
* Larger INL values indicate increasing deviation from linear behavior

Unlike DNL, which measures local step accuracy, INL measures global transfer accuracy.

---

## Relationship Between DNL and INL

| Parameter | Measures                                            |
| --------- | --------------------------------------------------- |
| DNL       | Accuracy of individual code-to-code steps           |
| INL       | Deviation of overall transfer curve from ideal line |

A DAC may have small DNL errors while still accumulating significant INL error over many codes.

---

## Reference Data

The original repository provides pre-layout characterization plots:

* DNL_LSB.png
* INL_LSB.png

These plots were reviewed to understand how DNL and INL vary across DAC codes.

---

## Evidence

Files reviewed:

```text
Prelayout/DNL_LSB.png
Prelayout/INL_LSB.png
Prelayout/Prelayout_dnl_inl_data.xlsx
```

Observations:

* DNL values remain close to zero across most codes.
* INL shows cumulative variation as expected.
* No obvious missing-code behavior is visible in the provided plots.

---

## Current Limitation

The DNL and INL results discussed here originate from the reference repository.

I have not yet generated independent DNL/INL measurements from a self-generated netlist or custom code sweep.

Future work includes:

1. Running DAC code sweeps using ngspice.
2. Exporting output voltages.
3. Computing DNL and INL from measured data.
4. Comparing results against the reference repository plots.

---

## Key Takeaway

DNL evaluates individual step accuracy, while INL evaluates overall transfer-line accuracy. Together they provide the primary measures of static linearity performance for a DAC.

