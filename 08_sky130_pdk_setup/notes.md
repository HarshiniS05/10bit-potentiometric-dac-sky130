# Block 8 — SKY130 PDK Setup

**Status:** Completed and Verified

## Objective

Understand the role of the SKY130 Process Design Kit (PDK) and verify the installation paths used by xschem and ngspice for the DAC design flow.

---

## Prompt Used

**Tool:** Claude Sonnet 4.6

> "What is a PDK, and where do the SKY130 NMOS/PMOS device models live on a typical install? How do I confirm my install path?"

---

## What is a PDK?

A Process Design Kit (PDK) is a collection of technology files, device models, symbol libraries, design rules, and simulation data required for integrated circuit design.

This project uses the SKY130 open-source 130 nm CMOS process provided through OpenPDKs.

---

## Environment Verification

The active PDK root directory was verified using:

```bash
echo $PDK_ROOT
```

### Output

```text
/usr/local/share/pdk
```

This confirms that the system environment is configured to use the OpenPDKs installation under `/usr/local/share/pdk`.

---

## SKY130 Installation Verification

The SKY130A installation directory was inspected using:

```bash
ls -la /usr/local/share/pdk/sky130A/
```

### Relevant Output

```text
.config
libs.ref
libs.tech
```

The presence of `libs.ref` and `libs.tech` confirms that the SKY130A PDK installation is available and properly structured.

---

## Device Library Verification

The transmission-gate design studied in Block 2 uses the SKY130 primitive devices:

* sky130_fd_pr__nfet_01v8
* sky130_fd_pr__pfet_01v8

The following command was executed:

```bash
ls $PDK_ROOT/sky130A/libs.tech/xschem/sky130_fd_pr/ | grep -i "nfet_01v8\|pfet_01v8"
```

### Output

```text
nfet_01v8.sym
pfet_01v8.sym
nfet_01v8.sch
pfet_01v8.sch
```

This confirms that both NMOS and PMOS schematic symbols required by the DAC transmission-gate switch are present in the installed SKY130 PDK.

---

## Repository Files Using These Devices

```text
TG2.sch
switch.spice
my_2bitdac.spice
```

These files rely on the SKY130 primitive devices verified above.

---

## Evidence Collected

Commands executed:

```bash
echo $PDK_ROOT

ls -la /usr/local/share/pdk/sky130A/

ls $PDK_ROOT/sky130A/libs.tech/xschem/sky130_fd_pr/ | grep -i "nfet_01v8\|pfet_01v8"
```

Observed results:

```text
/usr/local/share/pdk

.config
libs.ref
libs.tech

nfet_01v8.sym
pfet_01v8.sym
nfet_01v8.sch
pfet_01v8.sch
```

---

## Key Takeaway

The SKY130 OpenPDKs installation was successfully verified through direct filesystem inspection. The required xschem device symbols and schematic files for `nfet_01v8` and `pfet_01v8` are available and were used throughout the DAC schematic study and simulation flow.

