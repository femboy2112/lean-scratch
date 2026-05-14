# CODEX.md — TLICA Active Operating Instructions

## Role

You are a Codex agent working on the TLICA Lean/Rosetta formalization. Treat the repository as a proof-engineering project with philosophical source alignment. The deliverable is theorem-status clarity plus machine-checkable Lean where feasible.

## Mandatory reading order

1. `AGENTS.md`
2. `CODEX.md`
3. `CLAIM_GUARDRAILS.md`
4. `CODEX_SKILLS.md`
5. `plans/ACTIVE_CODEX_PLAN.md`
6. The active mission packet named in `plans/ACTIVE_CODEX_PLAN.md`

## Current active workflow

Run the active mission packet. The default first mission is status hygiene: compare Lean/build evidence against README/MAPPING/Rosetta claims and repair stale documentation without changing theorem statements.

## Layout detection

Before running Lean commands, detect the Lean project directory:

```bash
if [ -f lakefile.lean ]; then LEAN_DIR=.; elif [ -f tlica-lean/lakefile.lean ]; then LEAN_DIR=tlica-lean; else echo 'No lakefile.lean found' && exit 2; fi
```

All scripts in this repository should use the same rule.

## Preferred execution pattern

1. Preflight: detect Lean dir, print branch/status, run build or read latest logs.
2. Proof-boundary audit: scan for `sorry`, `admit`, global `axiom`, `: True` placeholders, and stale status language.
3. Mission execution: patch only the files named by the active mission unless a dependency requires a small supporting change.
4. Validation: run build/audit scripts.
5. Reporting: write Markdown and JSON report artifacts under `reports/`.
6. Mapping: update `MAPPING.md`, declaration inventory, and Rosetta docs if any Lean/status claim changes.
7. Commit/push only after a coherent verified step.

## Hard stops

Stop and report rather than guessing if:

- a theorem statement appears mathematically false;
- a proof requires a new source commitment not present in the active packet;
- the source documents disagree about a definition;
- a task would formalize RCX, named affect taxonomy, stochastic projection, phenomenological duration, or contestable-boundary theory without explicit authorization.

## Output requirement

Every mission must end with a report containing:

- branch name;
- Lean dir;
- build result;
- audit result;
- files changed;
- theorem-status changes;
- placeholder/deferred items found;
- mapping/Rosetta updates;
- next recommended branch.
