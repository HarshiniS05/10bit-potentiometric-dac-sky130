# Block 1 — Prompt Log

**Tool used:** Claude Sonnet 4.6

**Prompt used:**
> "Explain DAC basics: what is a DAC, what is resolution, what is LSB, and
> calculate the output voltage for codes 0, 1, 512, and 1023 on a 10-bit
> DAC with VREFH=3.3V, VREFL=0V."

**What was kept:** The LSB formula (VREF / 2^N) and the four worked
examples — verified by recalculating each one by hand independently.

**What was corrected/verified myself:**
- Re-derived LSB = 3.3 / 1024 = 3.222... mV by hand, confirmed AI's rounding
  to 3.22 mV is acceptable for this resolution.
- Re-checked code 1023 → (1023/1024) × 3.3 = 3.2968 V by hand, matches.
