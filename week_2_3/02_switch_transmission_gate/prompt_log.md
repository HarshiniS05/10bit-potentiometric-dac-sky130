# Block 2 — Prompt Log

**Tool used:** Claude Sonnet 4.6

**Prompt used:**
> "Explain why a single NMOS transistor can't pass a full 0-3.3V analog
> range, why a single PMOS has the opposite problem, and how a CMOS
> transmission gate (NMOS + PMOS in parallel with complementary gate
> control) solves this. Reference SKY130 device names
> sky130_fd_pr__nfet_01v8 and sky130_fd_pr__pfet_01v8."

**What was kept:** The core explanation of why NMOS clips near VDD and PMOS
clips near 0V due to threshold voltage drop, and why putting them in
parallel with an inverter-driven complementary gate signal solves this.

**What was verified myself:** Opened `Prelayout/switch.spice` (later
`TG2.sch` in xschem) directly and confirmed the actual device names used
match `sky130_fd_pr__nfet_01v8` / `sky130_fd_pr__pfet_01v8` as the AI
described, rather than taking the device naming on faith.
