# Observations — Running Log

My own commentary, separate from the AI tools log. This is where I record
what I actually understood, what surprised me, and where my own assumptions
were wrong — not just where the AI was wrong.

## Week 2

- The recursive hierarchy (N-bit = 2×(N-1)-bit + 1 switch) is easy to state
  but I didn't fully appreciate *why* it matters until I tried to imagine
  writing a flat 1024-switch netlist by hand. The block-by-block structure
  isn't just neat organization — it's the only way this is debuggable at all.
- I initially assumed a "broken schematic" would show as a single obvious
  error. In practice, `TG2.sch` had multiple independent problems layered on
  top of each other (broken library path + duplicate pins + a genuinely
  unwired net), and fixing one revealed the next rather than solving
  everything at once. This is a more realistic picture of real debugging
  than what the Week 1 report made it sound like.

## Week 3 (in progress)

- Learned that `grep`-ing the raw `.sch` file for exact coordinates is far
  more reliable than visually inspecting a crowded xschem canvas, especially
  once multiple symbols are stacked on top of each other and their text
  labels overlap. Visual debugging alone was actively misleading me a few
  times (e.g. assuming a wire "looked connected" when the Info window still
  reported it as undriven).
- The most useful single lesson from this block: when an AI-provided fix is
  described as "definitive," that's a flag to verify it more carefully, not
  less. The `xschemrc` rewrite that broke `devices/` symbols was presented
  confidently and still made things worse.
- Not yet resolved: whether the `dinb` net issue on `TG2.sch` is fully fixed.
  Documenting this honestly rather than claiming the block is done.
