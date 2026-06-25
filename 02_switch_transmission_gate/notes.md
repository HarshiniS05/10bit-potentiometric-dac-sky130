# Block 2 — Notes: Transmission Gate Switch Design

## The problem with a single transistor

- A lone NMOS conducts well when passing logic '0', but as the signal
  approaches VDD - Vth (~1.3V for this process), the gate-source overdrive
  collapses and the NMOS stops conducting cleanly — it clips high voltages.
- A lone PMOS has the mirror-image problem: it clips voltages near 0V.

Neither alone can pass the full 0V-3.3V analog range this DAC needs.

## The transmission gate solution

Put an NMOS (`sky130_fd_pr__nfet_01v8`) and a PMOS (`sky130_fd_pr__pfet_01v8`)
in parallel, with complementary gate control via an inverter:

- Control signal C = 1 → NMOS gate sees 1.8V (ON), PMOS gate sees 0V via
  the inverter (ON) → both conduct simultaneously across the full range
- Control signal C = 0 → both transistors OFF → high impedance, no path

This is confirmed directly in the repo's `Prelayout/switch.spice` and the
`TG2.sch` schematic (studied in detail in Block 3).

## My own takeaway

The elegance here is that neither transistor needs to individually handle
the full range — they cover each other's weak region. This is a pattern
worth remembering beyond just this DAC project.
