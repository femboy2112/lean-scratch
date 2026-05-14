# CODEX_TASKS.md — TLICA Task Index

## Active mission

The active mission is specified by:

```text
plans/ACTIVE_CODEX_PLAN.md
```

Default active packet:

```text
plans/codex/2026-05-14_tlica_status_hygiene_packet.md
```

## Mission backlog

1. `2026-05-14_tlica_status_hygiene_packet.md`
   - Audit README/MAPPING/Rosetta/build evidence.
   - Correct stale status claims.
   - Do not change theorem statements.

2. `2026-05-14_tlica_round4_shell_refinement_packet.md`
   - Prepare shell-refinement obligations.
   - Replace vague placeholders only when a precise source-faithful statement is available.
   - Generate proof-obligation report.

3. `2026-05-14_tlica_shared_triangle_packet.md`
   - Formalize or audit the qualified `dInfShared` triangle target.
   - Do not disturb union/shared theorem families that already compile.

## Standard finalization checklist

- `lake build` succeeds.
- `bash scripts/audit_lean.sh` succeeds.
- declaration inventory refreshed if Lean changed.
- `MAPPING.md` updated if declaration/status changed.
- Rosetta coverage docs updated if declaration/status changed.
- report artifacts written under `reports/`.
