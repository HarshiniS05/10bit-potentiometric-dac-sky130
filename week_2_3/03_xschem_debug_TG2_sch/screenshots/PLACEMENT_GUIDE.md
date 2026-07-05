# Screenshot Placement Guide for Block 3

Place the actual PNG/JPG files in this `screenshots/` folder using the exact
filenames below. These names are already referenced by path in
`../debug_log.md`, so keeping the names consistent means the log's
screenshot references resolve correctly.

| Filename | Which screenshot from the conversation | Why it's included |
|----------|------------------------------------------|---------------------|
| `01_initial_two_symbol_errors.png` | The very first xschem error showing only 2 missing symbols (TG2.sym + lab_wire.sym) | Shows the original, narrow problem before any fix was attempted |
| `02_all_yellow_missing_symbols.png` | The canvas full of "MISSING SYMBOL" yellow boxes after the first xschemrc rewrite broke things | Shows the regression — proof that the first fix attempt made things worse, not better |
| `03_edit_properties_p3_inp2.png` | The Edit Properties dialog showing `name=p3 lab=inp2`, path `.../devices` | Confirms the exact duplicate pin identity before deletion |
| `04_select_overlapped_instances.png` | The canvas after Highlight → Select overlapped instances, status bar showing "selected: 3" | Shows the built-in xschem tool correctly isolating the overlap pair, used as cross-check before deleting |
| `05_zoomed_M7_dinb_region.png` | The zoomed-in canvas showing the magenta dinb wire/dot near M7's gate | Visual cross-check against the calculated coordinate match (435, -200) |
| `06_final_info_window_unresolved.png` | The most recent Info window, still showing `Error: undriven node: dinb` | Honest evidence that this block was NOT fully resolved at time of writing |

## Why these six and not more

There were more screenshots taken during the actual debugging session than
these six. These were selected because together they show the *arc* of the
debugging — broken, made worse, correctly diagnosed, fixed (partially), and
honestly left open — rather than every single intermediate click. A reviewer
should be able to follow the story from these six alone.

## If you have additional screenshots worth keeping

Anything showing the eventual resolution of the `dinb` issue (once that
investigation concludes) should be added as `07_dinb_resolved.png` or
similar, with a corresponding update to `debug_log.md`'s "Stage 6" section
changing its status from unresolved to resolved.
