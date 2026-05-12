# Lean Verification Report

## 1. Branch scope

- Base branch: `codex/tlica-shell-boundary-conventions-v0`
- Current branch: `codex/tlica-profile-shell-bound-corollary-v0`

This branch packages the scalar seven-shell theorem into shared-domain
profile-level shell-stability corollaries. It also adds low-risk endpoint-bound
helper lemmas, direct projected-profile/future-content bridge aliases, a
one-step branch union-distance naming bridge, a union-domain shell-bound audit,
and the next-frontier planning document.

It does not add religious-experience formalization, named affect taxonomy,
stochastic projection, phenomenological duration, or new contestable-boundary
Lean theory.

## 2. Inherited branch verification

Commands run before branching:

- `git fetch --all`: succeeded.
- `git checkout codex/tlica-shell-boundary-conventions-v0`: succeeded.
- `git pull`: already up to date.
- `lake build`: succeeded, with existing warning-only lints.
- `bash scripts/audit_lean.sh`: succeeded.

## 3. Completed phases

- Phase 1: inspected `TLICA/ProfileComparison/ShellRefinement.lean` and the
  shell/Rosetta audit docs; confirmed `ShellIndex7`, `shellOf7`,
  `shellLowerEndpoint`, `shellUpperEndpoint`, `fullShellStratifiedBound`, and
  `shellStableDistanceBound_of_pointwise`.
- Phase 2: added `shellEndpointBound` and
  `fullShellStratifiedBound_endpointBound`.
- Phase 3: added the uniform shared-domain theorem
  `dInfShared_le_shellEndpointBound`.
- Phase 4: added the variable-shell shared-domain theorem
  `dInfShared_le_of_pointwise_shellEndpointBound`.
- Phase 5: did not add a `dInfUnion` theorem; documented the union-domain
  zero-extension hypothesis issue.
- Phase 6: updated the compatibility comment for
  `shellStratifiedBound_deferred`.
- Phase 7 and Phase 11: added
  `dInfShared_le_sameInteriorShellEndpointBound`.
- Phase 12: added `shellEndpointBound_nonneg`,
  `shellEndpointBound_self_cogito`, and `shellEndpointBound_symm`.
- Phase 13: added the preferred zero-extension API theorem
  `dInfShared_le_shellEndpointBound_zeroExtend`.
- Phase 14: updated `SHELL_BOUNDARY_CONVENTION_AUDIT.md` with the union-domain
  shell-bound audit.
- Phase 15: added direct projected-profile/future-content aliases in
  `TLICA/FreeWill.lean` and `TLICA/TemporalTrajectory.lean`.
- Phase 16: added `oneStepBranchUnionDistance` and
  `oneStepBranchUnionDistance_eq_dInfUnion`; the direct alias to
  `branchUnionDistance` is deferred because importing `DifferentiatedAffect`
  into temporal would create a module cycle.
- Phase 17: added `docs/tlica_rosetta/NEXT_LEAN_FRONTIER.md`.
- Phases 8, 18, and 19: updated mapping, ledger, coverage, matrix, backlog,
  shell audit, declaration inventory, and this report.

## 4. Theorem names added

Shell refinement:

- `shellEndpointBound`
- `fullShellStratifiedBound_endpointBound`
- `shellEndpointBound_nonneg`
- `shellEndpointBound_self_cogito`
- `shellEndpointBound_symm`
- `dInfShared_le_shellEndpointBound_zeroExtend`
- `dInfShared_le_shellEndpointBound`
- `dInfShared_le_of_pointwise_shellEndpointBound`
- `dInfShared_le_sameInteriorShellEndpointBound`

Free will:

- `branchProfile_eq_projectedProfile`
- `branchFutureContents_eq_futureMSIContents`

Temporal trajectory:

- `trajectoryFutureContents_eq_futureMSIContents`
- `oneStepBranchUnionDistance`
- `oneStepBranchUnionDistance_eq_dInfUnion`

## 5. Profile-level theorem status

- Scalar seven-shell theorem: machine verified as `fullShellStratifiedBound`;
  endpoint-bound bridge verified as `fullShellStratifiedBound_endpointBound`.
- Shared-domain uniform-shell profile corollary: machine verified as
  `dInfShared_le_shellEndpointBound`.
- Shared-domain zero-extension shell-assignment variant: machine verified as
  `dInfShared_le_shellEndpointBound_zeroExtend`; this is the preferred API
  when callers already reason about `zeroExtend`.
- Shared-domain variable-shell profile corollary: machine verified as
  `dInfShared_le_of_pointwise_shellEndpointBound`.
- Same-interior-shell endpoint bridge: machine verified as
  `dInfShared_le_sameInteriorShellEndpointBound`.
- Union-domain profile shell theorem: not added; audited as future work because
  shell assignments must cover zero-extended values over `f.domain ∪ g.domain`.

## 6. Blocked or skipped phases

- `dInfUnion` shell theorem skipped: the shared-domain hypotheses do not
  control zero-extension values outside one profile's domain.
- `oneStepBranchUnionDistance_eq_branchUnionDistance` skipped in temporal:
  `branchUnionDistance` lives in `TLICA.DifferentiatedAffect`, which imports
  temporal, so the alias belongs in a future affect-side helper branch.
- Contestable-boundary Lean theory skipped by instruction and because the
  source ambiguity remains unresolved.

## 7. Files changed

Lean source:

- `TLICA/ProfileComparison/ShellRefinement.lean`
- `TLICA/FreeWill.lean`
- `TLICA/TemporalTrajectory.lean`

Documentation and inventory:

- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/SHELL_BOUNDARY_CONVENTION_AUDIT.md`
- `docs/tlica_rosetta/NEXT_LEAN_FRONTIER.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md`
- `docs/tlica_rosetta/ROSETTA_COVERAGE_AUDIT.md`
- `docs/tlica_rosetta/FEATURE_COMPLETENESS_MATRIX.md`
- `docs/tlica_rosetta/LEAN_IMPROVEMENT_BACKLOG.md`

## 8. Verification status

- `lake exe cache get`: succeeded.
- `python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md`: succeeded.
- Final `lake build`: succeeded, with existing warning-only lints.
- Final `bash scripts/audit_lean.sh`: succeeded.

Audit target:

- Zero `sorry` in imported Lean files.
- Zero `admit` in imported Lean files.
- Zero global `axiom` declarations in imported Lean files.

## 9. Next recommended branch

Recommended next branch:

`codex/tlica-union-shell-bound-v0`

Purpose: add a union-domain shell bound only after the theorem states explicit
zero-extension shell assignments over the union domain. If that hypothesis shape
is not settled, use `codex/tlica-direct-projected-pce-api-v0` for direct API
migration instead.
