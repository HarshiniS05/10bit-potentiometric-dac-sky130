# AI-Assisted Circuit-Block Study — 10-bit Potentiometric DAC (SKY130)

This repo documents Week 2 & 3 work continuing from the reference repository
[vsdip/avsddac_3v3_sky130_v1](https://github.com/vsdip/avsddac_3v3_sky130_v1).
The focus here is **circuit-level understanding and verification**, not final
layout or GDS. Every block below was studied using AI-assisted prompts, then
verified by hand against the actual repo files, schematic captures, or
ngspice/xschem output.

## How this repo is organized

Each numbered folder is one circuit-level study block. Inside each folder:
- `prompt_log.md` — the exact AI prompts used, the tool/model name, and a note
  on what was kept vs. corrected from the AI's response
- `notes.md` — my own understanding in my own words, verified against the
  repo or against a real simulation/schematic
- supporting files (netlists, logs, screenshots) as relevant to that block

## Block index

| # | Folder | Status | What it covers |
|---|--------|--------|-----------------|
| 1 | `01_dac_basics_and_resistor_string` | Done | DAC fundamentals, LSB, resistor-string math |
| 2 | `02_switch_transmission_gate` | Done | NMOS+PMOS transmission gate switch design |
| 3 | `03_xschem_debug_TG2_sch` | In progress | Full debug timeline of TG2.sch — the richest block |
| 4 | `04_2bit_dac_and_scaling_rule` | Blocked on #3 | 2-bit DAC, N-bit = 2×(N-1)-bit + 1 switch rule |
| 5 | `05_vref_lsb_and_step_calc` | Done | VREFH/VREFL, LSB, output voltage formula |
| 6 | `06_monotonicity_and_settling` | Done | Why resistor-string is structurally monotonic, RC settling |
| 7 | `07_inl_dnl_concepts` | Done | DNL/INL formulas, missing-code interpretation |
| 8 | `08_sky130_pdk_setup` | Done | PDK_ROOT, nfet/pfet_01v8 model locations |
| 9 | `09_prelayout_simulation_attempts` | Thin — depends on #3 | ngspice runs, logs, any waveform captured |

`ai_tools_used.md` and `observations.md` (repo root) are running logs updated
across every block, not tied to one folder.

## Important honesty note on status

Block 3 (`03_xschem_debug_TG2_sch`) is **not fully resolved yet**. The repo's
`TG2.sch` (the transmission-gate subcircuit underlying the 2-bit DAC and all
higher blocks) had several real problems — broken library paths, duplicate
pin instances, and an unresolved `dinb` undriven-node error that was still
being traced (down to calculating M7's gate pin offset from the symbol file)
at the time of writing. Because of this, Block 4 and Block 9 are intentionally
thin — they depend on Block 3 being clean before a real 2-bit DAC simulation
can run. This dependency is stated here rather than papered over.

## How to run any netlist once Block 3 is resolved

```bash
cd /home/harshini/avsddac_3v3_sky130_v1/Prelayout
xschem TG2.sch          # open and inspect the switch subcircuit
# Netlist button or Shift+I inside xschem to generate SPICE
ngspice my_2bitdac.spice
```
