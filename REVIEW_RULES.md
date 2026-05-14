# REVIEW_RULES.md — TLICA Codex Review Policy

## Review stance

Review every change as a mathematical/proof-status change first and a prose change second.

## Required checks

Before accepting a branch:

1. `lake build` succeeds.
2. `bash scripts/audit_lean.sh` succeeds.
3. `python3 scripts/extract_lean_decls.py` has refreshed the declaration inventory if Lean files changed.
4. `MAPPING.md` and Rosetta docs reflect any Lean declaration/status changes.
5. No deferred marker is reported as theorem coverage.
6. No compatibility alias is described as primitive.
7. No prohibited application layer was added.

## Review categories

Use these verdicts:

- `accept`
- `accept_with_reservations`
- `reject_until_build_green`
- `reject_status_overclaim`
- `author_math_required`

## Common defects

- stale `MAPPING.md` rows;
- build logs newer than documentation;
- theorem target replaced by `True` or `by trivial`;
- source-corpus edits made without authorization;
- proof scripts that change theorem statement to fit automation;
- new declarations absent from Rosetta inventory;
- compatibility layer used as if primary;
- RCX or named-affect formalization introduced prematurely.
