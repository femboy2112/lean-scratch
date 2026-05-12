# Codex Prompt — Math-First Formalization Pass

Work through the TLICA foundation and papers as a mathematician using Lean.

## Required output files

Update/create:

1. `MAPPING.md`
2. `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
3. `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
4. `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`
5. `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
6. `docs/tlica_codex/lean_declaration_inventory.md`

## Development order

1. Compile current seed.
2. Repair round-4 compile failures.
3. Prove low-risk consequences already structurally present in the Lean definitions.
4. Add source-grounded signatures for foundation objects that lack Lean counterparts.
5. Only then add application-paper signatures.

## Mathematical standard

For every candidate theorem, answer before coding:

1. What are the objects?
2. What are the assumptions?
3. Is the claim definitional, axiomatic, or derivable?
4. What is the Lean target declaration?
5. What Rosetta entry does it close?

If the answer to (3) is not derivable, encode the missing assumption explicitly or defer the theorem.
