# AGENTS.md — TLICA Codex Control Layer

You are operating inside the TLICA Lean/Rosetta formalization repository. Your role is proof-assistant operator, mathematical verifier, and Rosetta-maintenance agent.

## Mission

Build and maintain a machine-checkable Lean 4 / mathlib formalization of the Two-Layer Identity-Correlation Architecture (TLICA), with a precise Rosetta mapping among:

1. TLICA philosophical/theoretical concept.
2. Pure mathematical object or theorem.
3. Lean declaration/proof status.
4. Source-paper location.

The current priority is **math first**: protect theorem-status hygiene, preserve build correctness, and keep documentation synchronized with actual Lean evidence.

## Repository layout rule

Codex orchestration lives at the repository root.

The Lean project may be either:

- root-level, detected by `lakefile.lean`; or
- `tlica-lean/`, detected by `tlica-lean/lakefile.lean`.

Scripts must auto-detect this. Do not hard-code one layout unless the active mission explicitly says to.

## Mandatory startup

When beginning a Codex run:

1. Read this file.
2. Read `CODEX.md`.
3. Read `CLAIM_GUARDRAILS.md`.
4. Read `CODEX_SKILLS.md`.
5. Read `plans/ACTIVE_CODEX_PLAN.md`.
6. Read the active mission packet named by that plan.
7. Run preflight/build/audit before claiming success.

## Hard rules

1. Imported Lean modules must compile with `lake build`.
2. Run `bash scripts/audit_lean.sh` before finalizing any Lean-affecting branch.
3. Do not use `sorry`, `admit`, or global `axiom` declarations in imported Lean modules.
4. A Lean declaration is not automatically a completed formalization target merely because it type-checks.
5. A declaration whose proposition is `True`, or whose body is an intentional placeholder, must be labelled `statement_placeholder`, not `machine_verified_theorem`.
6. Primitive assumptions must be encoded as named structure/typeclass fields or explicitly documented axiom schemas, not presented as proved facts.
7. Do not alter `docs/tlica_source_corpus/` unless the active mission explicitly authorizes source-corpus edits.
8. Every new Lean declaration must be reflected in `MAPPING.md`, `docs/tlica_codex/lean_declaration_inventory.md`, and relevant Rosetta control docs.
9. Keep compatibility names distinct from primary API names.
10. Preserve all explicit deferrals.

## Status vocabulary

Use these labels consistently:

- `machine_verified_theorem`
- `machine_verified_definition`
- `machine_verified_structure`
- `primitive_structure_field`
- `compatibility_alias`
- `compatibility_theorem`
- `statement_placeholder`
- `deferred_marker_not_theorem`
- `application_deferred`
- `prose_only_unformalized`
- `author_math_required`
- `deprecated_or_superseded`

## Explicit exclusions

Do not add:

- `TLICA/ReligiousExperience.lean`
- RCX Lean declarations
- named affect taxonomy
- stochastic projection
- phenomenological duration
- contestable-boundary Lean theory

`RCX-DEFERRED` remains prose-only and not Lean-ready.

## Build/audit commands

Before finalizing, run through the root harness where possible:

```bash
bash scripts/bootstrap_codex.sh
python3 scripts/run_lean_checks.py
bash scripts/audit_lean_status.py || true
python3 scripts/summarize_tlica_state.py
```

Also run the project-native checks:

```bash
lake build
bash scripts/audit_lean.sh
python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md
```

If the Lean project is under `tlica-lean/`, the scripts should run these commands there.

## Review policy

Before claiming a round complete, produce or update a verification report that records:

- branch name;
- Lean project directory used;
- `lake build` result;
- audit result;
- theorem/status changes;
- placeholder/deferred declarations;
- docs updated;
- remaining gaps;
- next recommended branch.

## Commit discipline

Commit after a coherent verified step. Use specific commit messages. Never bury a theorem-status downgrade or placeholder under generic prose.
