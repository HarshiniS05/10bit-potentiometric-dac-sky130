# Block 9 — Pre-layout Simulation Attempts

**Status: intentionally thin.** This block depends entirely on Block 3
(`TG2.sch` debugging) being resolved. There is no point running a full
`my_2bitdac.spice` or `my_10bitdac.spice` simulation while the underlying
switch subcircuit still has an unresolved undriven-node error — any output
waveform would be built on a broken foundation and wouldn't mean anything.

## What's actually in `sim_logs/` right now

Early attempts at running `ngspice my_2bitdac.spice` before the `TG2.sch`
problems were fully understood — kept as evidence of the failure mode, not
as a success.

## Prompt used (for setting up the simulation commands themselves)

**Tool:** Claude Sonnet 4.6

> "Give me the ngspice command to simulate my_2bitdac.spice from the
> Prelayout folder, and what output I should expect to see if it works."

## What "done" looks like for this block

1. `TG2.sch` fully resolved (Block 3 closed out)
2. `ngspice switch.spice` runs clean, with a waveform showing correct
   transmission gate pass-through behavior
3. `ngspice my_2bitdac.spice` runs clean, sweeping all 4 codes and producing
   4 distinct voltage levels matching Block 4's calculated table
4. A screenshot of that waveform saved here

None of the above is true yet. This file exists to make that gap explicit
rather than implying simulation success that hasn't happened.
