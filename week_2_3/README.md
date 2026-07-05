# AI-Assisted Study of a 10-Bit Potentiometric DAC in SKY130

## Overview

This repository documents an AI-assisted engineering study of a 10-bit resistor-string (potentiometric) DAC implemented using the SKY130 open-source PDK.

The work is based on the reference implementation from:

- VSD Open-Source Analog Mixed-Signal Design Program
- SKY130 Open PDK Ecosystem
- Xschem + Ngspice Simulation Flow

The objective of this repository is not to create a new DAC architecture, but to understand, verify, simulate, and document the complete hierarchy of a resistor-string DAC from the transmission-gate level up to the 10-bit top-level implementation.

---

# Learning Objectives

This study focuses on:

- DAC fundamentals
- Resistor-string architecture
- Transmission-gate switch operation
- Hierarchical DAC scaling
- LSB and output-voltage calculations
- Monotonicity and settling behaviour
- DNL and INL concepts
- SKY130 PDK environment setup
- Xschem schematic analysis
- Ngspice pre-layout simulation

---

# Repository Structure

```text
10bit-potentiometric-dac-sky130/

├── 01_dac_basics_and_resistor_string/
├── 02_switch_transmission_gate/
├── 03_xschem_debug_TG2_sch/
├── 04_2bit_dac_and_scaling_rule/
├── 05_vref_lsb_and_step_calc/
├── 06_monotonicity_and_settling/
├── 07_inl_dnl_concepts/
├── 08_sky130_pdk_setup/
├── 09_prelayout_simulation_attempts/
│
├── ai_tools_used.md
├── observations.md
└── README.md
```

---

# Block Summary

| Block | Topic | Status |
|---------|---------|---------|
| 01 | DAC Basics & Resistor String | Completed |
| 02 | Transmission Gate Study | Completed |
| 03 | TG2 Schematic Debug & Analysis | Completed |
| 04 | 2-Bit DAC & Hierarchical Scaling | Completed |
| 05 | VREF, LSB & Output Calculation | Completed |
| 06 | Monotonicity & Settling Behaviour | Completed |
| 07 | INL & DNL Concepts | Completed |
| 08 | SKY130 PDK Setup & Verification | Completed |
| 09 | Pre-Layout Simulation & Waveform Analysis | Completed |

---

# Software Environment

## Design Entry

- Xschem

## Circuit Simulation

- Ngspice

## Process Design Kit

- SKY130A Open PDK

## Operating System

- Ubuntu Linux (VMWare)

---

# Verified SKY130 Installation

PDK root verified on the local machine:

```bash
echo $PDK_ROOT
```

Output:

```text
/usr/local/share/pdk
```

Device symbols verified:

```bash
ls $PDK_ROOT/sky130A/libs.tech/xschem/sky130_fd_pr/ \
| grep -i "nfet_01v8\|pfet_01v8"
```

Output:

```text
nfet_01v8.sym
pfet_01v8.sym
nfet_01v8.sch
pfet_01v8.sch
```

---

# Simulation Evidence

A 2-bit DAC pre-layout simulation was successfully executed using Ngspice.

Simulation commands:

```bash
cd /home/harshini/avsddac_3v3_sky130_v1/Prelayout/

ngspice my_2bitdac.spice

hardcopy dac_staircase.ps x1_out_v x1_d1 x1_d0

quit

evince dac_staircase.ps &
```

The generated waveform confirms staircase DAC behaviour corresponding to the applied digital input codes.

Evidence files:

```text
dac_staircase.ps
Pictures/2bit_waveform.PNG
```

---

# Key Technical Findings

## Resistor-String DAC

- Monotonic by construction
- No decoder-induced missing codes
- Simple architecture
- Scales hierarchically

## Transmission Gate

- Uses parallel NMOS and PMOS devices
- Provides low ON resistance
- Passes both logic high and logic low efficiently

## DAC Scaling Rule

The hierarchy follows:

```text
N-bit DAC
=
Two (N−1)-bit DAC blocks
+
One transmission-gate switch
```

Verified by inspection of:

```text
my_3bitdac.spice
my_10bitdac.spice
```

---

# AI-Assisted Workflow

AI tools were used as learning assistants to:

- Explain DAC concepts
- Explain transmission-gate operation
- Explain DNL/INL theory
- Explain SKY130 PDK structure
- Assist debugging workflows

All explanations were manually verified against:

- Repository schematics
- Generated netlists
- SKY130 PDK files
- Ngspice simulation outputs

AI responses were never accepted without verification.

---

# References

1. SKY130 Open PDK
2. Xschem Documentation
3. Ngspice Documentation
4. VSD Analog Mixed-Signal Design Program
5. Original avsddac_3v3_sky130_v1 Repository

---


