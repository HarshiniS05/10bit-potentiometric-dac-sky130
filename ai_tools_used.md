# AI Tools Used — Running Log

This file tracks every AI tool/model used across all blocks, what it was
asked, and — critically — where it got something wrong that I had to catch
and correct myself. This is the evidence of "verified, not just generated."

| Date | Block | AI tool/model | What it got right | What it got wrong / had to verify myself |
|------|-------|---------------|--------------------|-------------------------------------------|
| Week 2, Day 1 | 01 | Claude Sonnet 4.6 | LSB formula, resolution math | — |
| Week 2, Day 2 | 02 | Claude Sonnet 4.6 | Transmission gate NMOS+PMOS rationale | — |
| Week 2, Day 3 | 03 | Claude Sonnet 4.6 | Diagnosed broken `xschemrc` correctly on 2nd attempt | **1st attempt was wrong**: suggested overwriting `XSCHEM_LIBRARY_PATH` with `append`, which replaced rather than added to the default path. This broke `res.sym`, `ipin.sym`, `lab_wire.sym` — symbols that were working *before* the "fix." Caught by re-reading the actual default `xschemrc` file content directly. |
| Week 2, Day 3 | 03 | Claude Sonnet 4.6 | Helped trace duplicate `l2`/`p3` pins by exact coordinate match via grep | Initial guidance assumed a "two-pin overlap" matching what a different (possibly fabricated) AI-generated walkthrough claimed, including oddly specific coordinates ("around 210 -170") that weren't verifiable from screenshots — treated with skepticism and re-derived from `grep` output instead of trusted at face value. |
| Week 2, Day 3 | 03 | Claude Sonnet 4.6 | Found the floating `l9` duplicate (same label, different coords, not caught by xschem's auto-overlap-detect) | — |
| Week 2, Day 4 | 03 | Claude Sonnet 4.6 | Calculated M7 gate pin absolute position from symbol file pin offset + instance placement | Still unresolved at time of writing whether this actually fixes the `dinb` undriven error — netlist-level confirmation (`cat TG2.spice`) was the next step, not yet completed |

## How to keep this file useful

Every time a prompt result is used **without modification**, note that
explicitly ("no correction needed") rather than leaving the column blank —
a blank cell could mean "nothing to report" or "forgot to check," and only
one of those is good practice.
