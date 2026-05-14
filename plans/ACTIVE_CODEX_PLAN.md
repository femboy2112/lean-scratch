# Active Codex Plan — TLICA

## Current checkpoint

Current canonical branch:

```text
main
```

Current mathematical checkpoint includes:

- durable TLICA-specific Codex control layer;
- Claude union-domain shell-bound sync;
- direct `ProjectMap α Act` / `ProjectedPCE` API migration;
- deterministic generated-trajectory helper API;
- machine-verified scalar, shared-domain, and union-domain shell-bound theorem families;
- no RCX formalization, no named affect taxonomy, no stochastic projection, and no phenomenological duration.

Completed branches now folded into `main` include:

```text
codex/tlica-claude-union-shell-sync-v0
codex/tlica-codex-control-layer-v0
codex/tlica-direct-projected-pce-api-v0
codex/tlica-generated-trajectory-api-v0
```

## Active packet

```text
plans/codex/2026-05-14_tlica_profile_space_helpers_packet.md
```

## Launch command

```text
$tlica-research-orchestrator go
```

## Immediate objective

Create and run the next Lean branch:

```text
codex/tlica-profile-space-helpers-v0
```

Purpose: add low-risk convenience lemmas for `ProfileSpace`, `edist_def`, and the pseudo-emetric/profile-distance API without changing the underlying distance definitions.

## Required first checks

Before new Lean work:

```bash
python3 scripts/check_codex_skills.py
bash scripts/bootstrap_codex.sh
lake build
bash scripts/audit_lean.sh
```

## Required final artifacts

- updated `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- updated `docs/tlica_codex/lean_declaration_inventory.md` if Lean changed
- updated Rosetta/MAPPING docs if declarations or status changed
- mission report under `reports/`

## Do not do in this active packet

- Do not change `ScalarProfile`, `zeroExtend`, `dInfUnion`, `dInfShared`, `ProfileSpace`, or the `PseudoEMetricSpace` instance.
- Do not add religious-experience / RCX Lean formalization.
- Do not add named affect taxonomy.
- Do not add stochastic projection.
- Do not add phenomenological duration.
- Do not add contestable-boundary Lean theory.
- Do not change source-corpus files unless explicitly authorized.
