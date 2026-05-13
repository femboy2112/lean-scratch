# CODEX START HERE — TLICA Math-First Lean / Rosetta Pass

You are Codex working locally in the `femboy2112/lean-scratch` repository on branch:

```text
codex/tlica-math-rosetta-v0
```

## Mission

Work through the TLICA foundation and papers to create the math-first layer of the Rosetta stone:

1. **Pure math layer:** typed mathematical objects, definitions, assumptions, theorem statements, and proved consequences.
2. **Lean layer:** declarations and proofs for every feasible object/claim.
3. **Mapping layer:** exact relation from TLICA theoretical primitives to math objects and Lean declarations.

The philosophical prose layer comes later. Do not optimize for exposition first. Optimize for formal structure, proof obligations, and machine-verifiable closure.

## Immediate commands

Run:

```bash
git status --short
lake exe cache get
lake build 2>&1 | tee build_logs/lake_build_initial.log
bash scripts/audit_lean.sh | tee build_logs/audit_initial.log
python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md
```

## If `lake build` fails

Use `docs/tlica_codex/COMPILE_FIX_PROTOCOL.md`.

Classify every failure:

- Category 1: mathlib API drift.
- Category 2: typeclass/import/scope issue.
- Category 3: tactic divergence.
- Category 4: substantive logical issue.

Apply Category 1-3 fixes mechanically. For Category 4, do not silently weaken the theorem. Either repair the mathematical statement with a named hypothesis, move the theorem to a non-imported TODO file, or write an escalation note.

After each fix:

```bash
lake build 2>&1 | tee build_logs/lake_build_after_fix_N.log
```

## After baseline compile is green

Update or create these files:

1. `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
2. `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
3. `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
4. `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`
5. `MAPPING.md`

Then expand formalization in this order:

1. Foundation objects already in the rigorous edition.
2. Profile-comparison apparatus.
3. Orphan-cluster objects: MSI, preservation ranking, projection, PCE, PtCns, Modes A/B/C, I/not-I boundary.
4. Application-paper signatures only after foundation objects are stable.

## Proof policy

A TLICA claim can enter Lean in one of four forms:

1. **Definition:** mathematical construction with no proof burden.
2. **Structure/typeclass field:** primitive theoretical commitment or calibration parameter.
3. **Theorem/lemma with proof:** consequence of definitions and stated assumptions.
4. **Non-imported TODO theorem skeleton:** important target not yet build-safe.

Do not encode a philosophical assertion as a theorem unless its assumptions are present in the Lean context.

## Required final branch state

Before pushing:

```bash
lake build
bash scripts/audit_lean.sh
python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md
git status --short
```

Then:

```bash
git add .
git commit -m "Advance TLICA math-first Lean Rosetta"
git push -u origin codex/tlica-math-rosetta-v0
```

## Required final report

Write `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md` with exactly these sections:

1. Build status.
2. Files changed.
3. Lean declarations added/modified.
4. Rosetta entries added/modified.
5. Open mathematical issues requiring user/ChatGPT review.
