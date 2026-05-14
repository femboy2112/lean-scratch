# CODEX_SKILLS.md — TLICA Project Skills

This repo exposes project-scoped Codex skills. Use them in this order unless the active mission says otherwise.

## 1. `$tlica-research-orchestrator`

Purpose: master controller for active mission packets.

Use for:

```text
$tlica-research-orchestrator go
$tlica-research-orchestrator plan next formalization round
$tlica-research-orchestrator decompose shell refinement into Lean tasks
```

Required behavior:

1. Read `AGENTS.md`.
2. Read `CODEX.md`.
3. Read `CLAIM_GUARDRAILS.md`.
4. Read `plans/ACTIVE_CODEX_PLAN.md`.
5. Read the active mission packet.
6. Run preflight.
7. Dispatch or simulate specialist roles.
8. Produce `reports/<timestamp>_<target>_orchestration.md/json`.
9. Run proof-boundary audit before finalizing.

## 2. `$tlica-lean-build-doctor`

Purpose: build, classify Lean failures, and patch proof/API drift only.

Categories:

| Category | Meaning | Allowed action |
|---|---|---|
| API drift | renamed import/lemma/signature | patch import or invocation |
| typeclass resolution | missing instance/decidability | add minimal local instance/hypothesis |
| tactic divergence | tactic no longer closes true goal | refactor proof |
| substantive issue | statement not derivable | stop and report |
| placeholder hygiene | `True`, `trivial`, unused status | label, do not overclaim |

## 3. `$tlica-proof-boundary-auditor`

Purpose: protect theorem-status labels.

Run before calling anything machine-verified.

Detects:

- `sorry`
- `admit`
- global `axiom`
- theorem targets of type `True`
- `_deferred : Prop := True`
- stale MAPPING/README status claims
- compatibility aliases described as primitives

## 4. `$tlica-formalization-mapper`

Purpose: maintain the declaration-to-source-to-Rosetta bridge.

Duties:

- Extract Lean declarations.
- Compare declarations with `MAPPING.md`.
- Compare current mapping with latest build/type-check evidence.
- Mark each target as encoded, machine verified, placeholder, awaiting compile, not encoded, or author-math-required.

## 5. `$tlica-profile-comparison-lab`

Purpose: local mathematical lab for profile-comparison / shell-refinement work.

Use for:

- shell endpoint theorem design;
- dInfUnion/dInfShared comparison lemmas;
- shell-stability predicates;
- qualified shared-triangle tasks;
- theorem-target decomposition before Lean proof work.

## Invocation rule

If a user asks for broad work, start with `$tlica-research-orchestrator`. If a build is red, route to `$tlica-lean-build-doctor`. If a status claim is uncertain, route to `$tlica-proof-boundary-auditor` before editing prose.
