# Block 3 — Debug Log: TG2.sch (Transmission Gate Subcircuit)

**Status: IN PROGRESS — not fully resolved.** This file documents the full
timeline honestly, including the parts that are still open.

**Tool used throughout:** Claude Sonnet 4.6

---

## Stage 1 — Initial broken symbol references

**What happened:** Opening `2bitdac.sch` in xschem produced:
```
l_s_d(): Symbol not found: /home/harshitha/Desktop/xschem/xschem_library/TG2.sym
l_s_d(): Symbol not found: devices/lab_wire.sym
```

**Diagnosis:** The original repo author (a different contributor, "harshitha")
left an absolute path on her own machine hardcoded into the schematic. My
machine obviously doesn't have that folder.

**Screenshot:** `screenshots/01_initial_two_symbol_errors.png` *(if captured —
this was the very first error before any fix attempts)*

---

## Stage 2 — First fix attempt made things WORSE

**What happened:** Tried patching the path with `sed`, then rewrote
`xschemrc` using:
```
set XSCHEM_LIBRARY_PATH "/usr/share/xschem/xschem_library /home/harshini/avsddac_3v3_sky130_v1/Prelayout"
```

**Result:** This overwrote the variable instead of appending to xschem's
default search paths. Suddenly *everything* broke — even standard symbols
like `res.sym`, `ipin.sym`, `opin.sym`, `lab_wire.sym` that had nothing to do
with the original problem.

**Screenshot:** `screenshots/02_all_yellow_missing_symbols.png` — the canvas
showing dozens of "MISSING SYMBOL" yellow boxes after this broke

**Lesson (see observations.md):** The AI's first suggested fix here was
presented confidently but was wrong. Caught by actually reading the restored
default `xschemrc` file content line by line rather than trusting the next
suggested patch blindly.

---

## Stage 3 — Correct fix: append, don't replace

**Diagnosis (verified by reading the real `xschemrc` comments):** The default
file populates `XSCHEM_LIBRARY_PATH` automatically *only if the variable is
left untouched*. Any active `append` line short-circuits that auto-population,
so appending onto an otherwise-empty variable loses every default folder,
including `xschem_library/devices` where `res.sym` etc. live.

**Fix applied:**
```bash
# Uncommented the real default lines in xschemrc:
set XSCHEM_LIBRARY_PATH {}
append XSCHEM_LIBRARY_PATH :${XSCHEM_SHAREDIR}/xschem_library/devices
# Then added (colon-separated, matching the file's own convention):
append XSCHEM_LIBRARY_PATH :/home/harshini/avsddac_3v3_sky130_v1/Prelayout
```

**Verification:** Ran `xschem switch.sch` (a file with no hardcoded bad path)
as a clean control test — confirmed it should open without missing-symbol
errors if the path fix was correct.

---

## Stage 4 — Finding the real duplicate-pin problem with grep, not visually

**What happened:** Even after the path fix, `TG2.sch` (the actual switch
subcircuit) still reported:
```
Error: overlapped instance found: l2(lab_pin.sym) -> l13
Error: overlapped instance found: p1(ipin.sym) -> p3
```

**Method:** Instead of hunting visually on a crowded, overlapping-label
canvas, ran:
```bash
grep -n "lab_pin.sym\|ipin.sym" TG2.sch
```
This returned exact line numbers and coordinates:
```
144:C {ipin.sym} 354 -154 0 0 {name=p3 lab=inp2}
180:C {ipin.sym} 354 -154 0 0 {name=p1 lab=inp2}
177:C {lab_pin.sym} 210 -170 0 0 {name=l13 sig_type=std_logic lab=gnda}
179:C {lab_pin.sym} 210 -170 0 0 {name=l2 sig_type=std_logic lab=gnda}
```
Confirmed `l2`/`l13` and `p1`/`p3` sit at *identical* coordinates with
identical labels — true duplicates, not visual artifacts.

**Screenshot:** `screenshots/03_edit_properties_p3_inp2.png` — the Edit
Properties dialog confirming `p3` = `ipin.sym`, `name=p3 lab=inp2`

**Screenshot:** `screenshots/04_select_overlapped_instances.png` — xschem's
built-in Highlight → Select overlapped instances feature confirming 3
objects selected as genuinely overlapping

**Fix applied (after backing up first):**
```bash
cp TG2.sch TG2.sch.backup
sed -i '179d;144d' TG2.sch
```
Verified with a second grep that only `l13` and `p1` remained — confirmed
clean removal with no collateral damage.

---

## Stage 5 — Finding a SECOND, non-coincident duplicate (l9)

**What happened:** After fixing the exact-coordinate duplicates, the Info
window still showed:
```
Error: undriven node: dinb
```

**Method:** Searched for every `dinb` reference:
```bash
grep -n "net=dinb\|lab=dinb" TG2.sch
```
Found two separate `dinb` label instances at *different* coordinates:
```
142: C {lab_pin.sym} 420 -295 ... {name=l6 ... lab=dinb}   <- near real wires
174: C {lab_pin.sym} 185 -250 ... {name=l9 ... lab=dinb}   <- isolated
```
Cross-checked `l9`'s coordinates against every wire (`N` line) in the file:
```bash
grep -n "185\|-250" TG2.sch | grep "^[0-9]*:N "
```
Returned only unrelated wires (`vout`, `dd`) — confirming `l9` was a floating,
disconnected duplicate that xschem's automatic overlap-detector did NOT catch
(because its coordinates didn't exactly match `l6`'s).

**Fix applied:**
```bash
cp TG2.sch TG2.sch.backup2
sed -i '174d' TG2.sch
```
Verified with `sed -n '170,180p' TG2.sch` that no dangling/malformed lines
were left behind by the deletion.

---

## Stage 6 — dinb STILL undriven after l9 removal (unresolved at time of writing)

**What happened:** Re-ran the netlist after the `l9` fix. Fresh Info window
(confirmed not stale by checking system clock against terminal command order):
```
Warning: open net: vdd
Warning: open net: inp1
Warning: open net: inp2
Error: undriven node: dinb
Error: undriven node: #net6
Error: undriven node: #net8
```
`dinb` is **still** reported as undriven, even with the duplicate gone.

**Method — traced the wire chain precisely:**
```
27: N 420 -295 430 -295 {lab=dinb}
38: N 425 -295 425 -200 {lab=dinb}
28: N 415 -200 435 -200 {lab=dinb}   <- where does this end?
```
Checked what component sits at the far end (`415-435, -200`):
```bash
grep -n "^C {.*pfet_01v8\|^C {.*nfet_01v8" TG2.sch
```
Found **M7** (pfet_01v8) placed at `455 -200` — closest candidate by
coordinate and circuit logic (PMOS needs the complementary/inverted control
signal in a transmission gate, which is what `dinb` represents).

**Calculated M7's actual gate pin position** from the symbol file:
```bash
grep -n "name=G" .../pfet_01v8.sym
# returned: B 5 -22.5 -2.5 -17.5 2.5 {name=G dir=in}
```
Gate pin offset ≈ (-20, 0) relative to instance origin.
M7 instance origin = (455, -200), rotation/flip = 0 0 (no transform).
**Calculated absolute gate position ≈ (435, -200)**

This matches wire 28's endpoint `(435, -200)` *exactly*.

**Screenshot:** `screenshots/05_zoomed_M7_dinb_region.png` — zoomed canvas
view showing the magenta `dinb` wire and dot near M7's gate

**Status at time of writing:** The coordinates match on paper, but the Info
window still reports `dinb` as undriven. Next step (not yet completed): read
the actual generated SPICE netlist (`simulation/TG2.spice`) directly to see
literally what net name xschem assigned to M7's gate pin, rather than
continuing to infer from schematic coordinates and wire colors.

**Screenshot:** `screenshots/06_final_info_window_unresolved.png` — most
recent Info window at time of writing, showing the issue is still open

---

## Honest summary

Resolved: broken library path, two confirmed-duplicate pin pairs (`l2`/`p3`),
one floating mislabeled duplicate (`l9`).

Not yet resolved: `dinb` undriven node, `vdd`/`inp1`/`inp2` open nets (these
were never expected to be fixed by the duplicate-cleanup work — they need
actual wires drawn, not file edits).

This block stays open into the next work session. Block 4 and Block 9 are
blocked on this being resolved.
