# Block 6 — Monotonicity and Settling Behaviour

## Prompt used

**Tool:** Claude Sonnet 4.6

> "Why is a resistor-string DAC structurally monotonic? Separately, explain
> what causes settling delay in this kind of DAC (RC effects, switch
> resistance)."

## Monotonicity — notes

A resistor-string DAC is monotonic by construction: resistors in the chain
only add voltage moving from VREFL to VREFH. A higher digital code always
selects a tap further along that same direction, so the output voltage can
never decrease as the code increases. This is a structural property of the
topology itself — it doesn't depend on resistor matching precision the way
some other DAC architectures do.

A "missing code" (a real risk in other DAC types) would mean two adjacent
digital codes produce the same output voltage. In this architecture, that
would require two different taps to have identical voltage, which can't
happen unless a resistor value is exactly zero.

## Settling behaviour — notes

When the digital code changes, the previously-selected switch opens and a
new one closes. The output doesn't change instantaneously because of:
- Non-zero switch ON-resistance (the transmission gate isn't an ideal
  short — it has finite resistance)
- Parasitic capacitance at the output node and along the resistor chain

Together these form an RC time constant that determines how long the output
takes to settle to its new value after a code transition.

## What's not yet done

I have not yet run an actual `.tran`/`.meas` simulation to measure a real
settling time number — this block is conceptual only so far, consistent
with the broader Block 3 dependency (no clean simulation has run yet).
