# Block 3 — Prompt Log

Unlike other blocks, this one involved many short, iterative prompts rather
than one long prompt, since debugging is inherently interactive. Listed in
order, condensed to the core ask of each turn.

**Tool used throughout:** Claude Sonnet 4.6

1. "Help me rectify [xschem symbol-not-found errors], understand where we
   are stuck and why" — diagnosed the hardcoded-path problem and the
   library-path overwrite damage.
2. "Run grep to find what xschemrc actually contains before editing again" —
   pivoted from guessing at xschem's config syntax to reading the real file.
3. "Find the exact overlapping pin instances using grep, not visual
   clicking" — produced the `l2`/`l13`/`p1`/`p3` coordinate match.
4. "Check if l9 has any wire near its own coordinates before deleting it" —
   verified-before-delete methodology, avoided a blind deletion.
5. "Find what's at the far end of the dinb wire chain, then calculate M7's
   actual gate pin position from the symbol file" — moved from guessing
   coordinates to deriving them from the `.sym` pin definitions.

**Pattern I want to call out:** almost every step above was "verify with
grep/file-read before acting," not "trust the visual canvas." That's the
single biggest methodology shift in this block, and it's the main thing
worth carrying into Block 4 onward.
