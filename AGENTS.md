# AGENTS.md — TLICA Lean / Rosetta Instructions

You are working in the TLICA formalization repository. Your task is mathematical formalization, not prose polishing.

## Objective

Create a machine-checkable Lean foundation for the TLICA Rosetta stone:

1. Pure philosophical object or claim.
2. Pure mathematical object or theorem.
3. Explicit mapping between them.
4. Lean declaration and proof status where feasible.

The current priority is **math first**: formalize the mathematical structures and prove internal consequences before expanding the philosophical exposition.

## Hard rules

1. Imported Lean modules must compile with `lake build`.
2. Do not use `sorry`, `admit`, or `by aesop?` placeholders in imported modules.
3. If a claim is primitive in the theory, encode it as a named structure field, typeclass field, or documented axiom schema. Do not present it as proved.
4. If a proof depends on an assumption, name that assumption and map it to its source reference.
5. Do not alter files in `docs/tlica_source_corpus/` except by explicit user request.
6. Every new Lean declaration must be added to `MAPPING.md` and to `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`.
7. Preserve the distinction between:
   - machine-verified theorem,
   - definition/signature,
   - primitive axiom/field,
   - theorem skeleton not imported into the build,
   - application-calibrated item deferred.

## Build/audit commands

Run these before committing:

```bash
lake exe cache get
lake build
bash scripts/audit_lean.sh
python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md
```

## Main local documents

- `CODEX_START_HERE.md` — execution prompt.
- `MAPPING.md` — Lean declaration map.
- `docs/tlica_rosetta/rosetta_stone_v0_2.md` — current Rosetta stone.
- `docs/tlica_rosetta/ROSETTA_MATH_SCHEMA.md` — ledger schema.
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md` — update this as you formalize.
- `docs/tlica_math_tasks/MATH_FIRST_TARGET_PLAN.md` — target ordering.
- `docs/tlica_math_tasks/rigorous_edition_v0_3_2/` — foundation formal apparatus.
- `docs/tlica_math_tasks/working_papers/` — profile-comparison and orphan-cluster math papers.
- `docs/tlica_source_corpus/` — original source corpus.

## Commit discipline

Commit after a coherent verified step. Use a message such as:

```bash
git add .
git commit -m "Formalize TLICA math Rosetta baseline"
git push -u origin codex/tlica-math-rosetta-v0
```
