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

## Current checkpoint

Latest mathematical checkpoint before this scaffold:

```text
codex/tlica-claude-union-shell-sync-v0
```

That checkpoint includes machine-verified scalar, shared-domain, and union-domain shell-bound theorem families.

## Immediate queue

1. `2026-05-14_tlica_status_hygiene_packet.md`
   - Validate this Codex control layer.
   - Audit MAPPING/Rosetta/build evidence against the latest union-shell checkpoint.
   - Correct stale status claims only.
   - Do not change theorem statements.

2. `codex/tlica-direct-projected-pce-api-v0`
   - Next Lean branch after hygiene.
   - Migrate active modules toward primary `ProjectMap α Act` / `ProjectedPCE` names where proof-stable.
   - Keep compatibility layer for old branch continuity.

## Mission backlog

3. `2026-05-14_tlica_round4_shell_refinement_packet.md`
   - Only use if shell-bound documentation or future shell obligations need refinement.
   - Current scalar/shared/union shell theorem families are already machine verified at the checkpoint.

4. `2026-05-14_tlica_shared_triangle_packet.md`
   - Audit whether the qualified `dInfShared` triangle target is already covered by `dInfShared_triangle_of_bridge`.
   - If already covered, update docs only.
   - Do not disturb union/shared theorem families that already compile.

## Standard finalization checklist

- `lake build` succeeds.
- `bash scripts/audit_lean.sh` succeeds.
- declaration inventory refreshed if Lean changed.
- `MAPPING.md` updated if declaration/status changed.
- Rosetta coverage docs updated if declaration/status changed.
- report artifacts written under `reports/`.
