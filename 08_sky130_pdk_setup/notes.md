# Block 8 — SKY130 PDK Setup

## Prompt used

**Tool:** Claude Sonnet 4.6

> "What is a PDK, and where do the SKY130 NMOS/PMOS device models live on a
> typical install? How do I confirm my install path?"

## Notes

A PDK (Process Design Kit) is the foundry-provided set of device models,
design rules, and layers that lets you design, simulate, and (eventually)
tape out a chip on a specific manufacturing process. SKY130 is SkyWater's
open-source 130nm PDK.

## Verified on my own machine

```bash
echo $PDK_ROOT
ls $PDK_ROOT/sky130A
```

Confirmed model file locations actually used by the repo's netlists:
```
/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym
/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym
```

This path was used directly in Block 3 to resolve the original repo's
hardcoded (and broken) device symbol paths — see
`../03_xschem_debug_TG2_sch/debug_log.md`.

## Terminal log

See `terminal_log.txt` in this folder for the raw `echo`/`ls` output as
captured during setup.
