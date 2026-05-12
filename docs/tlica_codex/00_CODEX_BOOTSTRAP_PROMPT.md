# Codex Bootstrap Prompt — TLICA Math-First Lean/Rosetta

You are Codex working in a local checkout of `femboy2112/lean-scratch` on branch `codex/tlica-math-rosetta-v0`.

Read these files first:

1. `AGENTS.md`
2. `CODEX_START_HERE.md`
3. `docs/tlica_math_tasks/MATH_FIRST_TARGET_PLAN.md`
4. `docs/tlica_rosetta/ROSETTA_MATH_SCHEMA.md`
5. `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
6. `MAPPING.md`

Then execute Phase 0 from `CODEX_START_HERE.md`.

Primary goal: make the Lean seed compile, then advance the math-first Rosetta stone by adding or refining Lean declarations and proof obligations. Maintain the three-way invariant:

```text
TLICA referent ↔ pure math object ↔ Lean declaration/proof status
```

Do not use `sorry` or `admit` in imported modules. Do not silently weaken theorems. If a theorem is not derivable, classify it as a Category 4 issue and document the repair path.

At the end, commit and push to:

```text
codex/tlica-math-rosetta-v0
```
