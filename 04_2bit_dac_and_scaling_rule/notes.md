# Block 4 — 2-bit DAC and Scaling Rule

**Status: blocked on Block 3.** `2bitdac.sch` depends on `TG2.sym`/`TG2.sch`
being fully clean before its own netlist can be trusted. The content below
is the conceptual understanding, prepared ahead of the actual verified
simulation.

## Prompt used

**Tool:** Claude Sonnet 4.6

> "How does resistor string plus switches form a 2-bit DAC, and what is the
> recursive rule for scaling from 2-bit up to 10-bit?"

## Notes — verified against my_2bitdac.spice structure (read-only, not yet simulated)

A 2-bit DAC uses 3 switch instances and 3 resistors, giving 4 output levels:

| Code | Output |
|------|--------|
| 00   | 0 V     |
| 01   | 0.825 V |
| 10   | 1.65 V  |
| 11   | 2.475 V |

## The scaling rule

N-bit DAC = two (N-1)-bit DAC subcircuits + one additional switch.

Verified by reading (not yet simulating) `my_3bitdac.spice` and
`my_10bitdac.spice` — `my_10bitdac.spice` instantiates exactly two 9-bit
subcircuits and one switch, confirming the rule holds at the top of the
hierarchy too.

## What's still needed before this block is "done"

Once Block 3's `TG2.sch` issues are resolved, the actual plan is:
1. Generate a clean netlist for `2bitdac.sch`
2. Run `ngspice my_2bitdac.spice`
3. Sweep all 4 codes and confirm the 4 voltage levels above match simulation,
   not just the calculated table

This is intentionally left as a TODO rather than claimed as complete.
