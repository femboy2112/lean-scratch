# Skill: tlica-lean-build-doctor

## Purpose

Run Lean builds, classify failures, and patch API/tactic drift without changing mathematics.

## Error categories

- API drift
- typeclass resolution
- tactic divergence
- substantive logical issue
- placeholder hygiene

## Procedure

1. Detect Lean project directory.
2. Run `python3 scripts/run_lean_checks.py`.
3. Classify any failure.
4. Patch only if the statement remains mathematically unchanged.
5. Report all changes and remaining blockers.
