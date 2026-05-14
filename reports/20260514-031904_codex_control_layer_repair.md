# Codex Control Layer Repair

- Branch: `codex/tlica-direct-projected-pce-api-v0`
- Lean project directory: `.`
- HEAD at verification: `58ea4d90b3842928a165fa01f870090b6686b9eb`

## Repairs Applied

- Added YAML frontmatter with `name` and `description` to all five project skills under `.agents/skills/`.
- Rewrote all six `.codex/agents/*.toml` files to use the current Codex role schema:
  - retained `name`;
  - replaced unsupported role metadata fields with `developer_instructions`;
  - kept role guidance, allowed scope, and forbidden scope as prose.
- Strengthened `scripts/check_codex_skills.py` so bootstrap now validates:
  - required skill frontmatter;
  - supported agent TOML keys;
  - non-empty `developer_instructions`;
  - agent `name` matching the file stem.

## Verification

- `python3 scripts/check_codex_skills.py`: pass.
- `bash scripts/bootstrap_codex.sh`: pass; `LEAN_DIR=.`.
- `codex debug prompt-input "agent config validation"`: pass after sandbox escalation for normal Codex local-state writes; project skills appeared in the generated prompt context and no new malformed-agent or skill-frontmatter errors were emitted.
- `python3 scripts/run_lean_checks.py`: pass; wrote `reports/20260514-031628_lean_checks.md/json`.
- `lake build`: pass with existing linter warnings only.
- `python3 scripts/audit_lean_status.py`: pass; wrote `reports/20260514-031813_lean_status_audit.md/json`.
- `bash scripts/audit_lean.sh`: pass; no sorry/admit/global axiom in imported Lean files.
- `python3 scripts/summarize_tlica_state.py`: pass; wrote `reports/20260514-031813_tlica_state.md/json`.
- `python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md`: pass; no inventory diff.

## Theorem And Status Changes

- Lean declarations changed: none.
- Theorem statements changed: none.
- Status-document claim changes: none.
- Declaration inventory changed: no diff after regeneration.

## Placeholder And Deferred Inventory

The Lean status audit found no `sorry`, no `admit`, no global `axiom`, and no `True` theorem placeholders. It found the existing eight deferred markers:

- `TLICA/DifferentiatedAffect.lean:354` — `namedAffectTaxonomy_deferred : Prop := True`
- `TLICA/DifferentiatedAffect.lean:358` — `loveConstitutiveExtension_deferred : Prop := True`
- `TLICA/DifferentiatedAffect.lean:362` — `substrateAffectPathway_deferred : Prop := True`
- `TLICA/DifferentiatedAffect.lean:366` — `sourceOpacityAffect_deferred : Prop := True`
- `TLICA/ProfileComparison/ShellRefinement.lean:344` — `shellStratifiedBound_deferred : Prop := True`
- `TLICA/TemporalTrajectory.lean:200` — `stochasticTrajectory_deferred : Prop := True`
- `TLICA/TemporalTrajectory.lean:204` — `phenomenologicalDuration_deferred : Prop := True`
- `TLICA/TemporalTrajectory.lean:208` — `temporalContinuityMetric_deferred : Prop := True`

## Remaining Gaps

- The deferred markers above remain intentionally deferred and were not changed.
- `lake build` still emits pre-existing linter warnings about duplicated namespaces and a few unused variables.

## Next Recommended Branch

- Continue on `codex/tlica-direct-projected-pce-api-v0` for the direct `ProjectMap α Act` / `ProjectedPCE` API migration once this control-layer repair is committed.
