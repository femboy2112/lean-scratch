# Lean Improvement Backlog - v0.4

This backlog is derived from `FEATURE_COMPLETENESS_MATRIX.md`. It separates
Lean-ready work from prose-first work so the next branches do not overclaim
coverage.

## Priority Key

| Priority | Meaning |
|---|---|
| P0 | Correctness, misleading documentation, or theorem overclaim. |
| P1 | Lean-ready theorem target. |
| P2 | Lean-ready structure/signature target. |
| P3 | Prose/math refinement needed before Lean. |
| P4 | Deliberately deferred or not current target. |

## A. Completed in `codex/tlica-p1-lean-improvement-batch-v0`

| Priority | Target | Why it matters | Required dependencies | Proposed branch name | Expected Lean files | Expected docs to update | Risk |
|---|---|---|---|---|---|---|---|
| Completed P1 | Finset-enumerated finite feasible-action maximizer theorem | Replaced `finiteFeasibleSelection_deferred` with `exists_selectsFeasibleAction_of_finset`. | Finset correctness, nonempty feasible enumeration, `selectsFeasibleAction`, projected-PCE order facts. | `codex/tlica-p1-lean-improvement-batch-v0` | `TLICA/Agency.lean` | Done in this branch | Completed |
| Completed P1 | Temporal stability lemmas from `dInfUnion` | Added step union-distance bounds, pointwise stability elimination, later-start monotonicity, and uniform-to-eventual bridge. | `stepUnionDistance`, `unionStepStable`, `eventuallyUnionStepStable`, `dInfUnion_le_one`. | `codex/tlica-p1-lean-improvement-batch-v0` | `TLICA/TemporalTrajectory.lean` | Done in this branch | Completed |
| Completed P1 | ProfileIso / CoherentFutureMSIModel coherence helpers | Added membership/value transport helpers and coherent-model domain/assignment helpers. | `ProfileIso.refl/symm/trans`, `CoherentFutureMSIModel.toFutureMSIModel`. | `codex/tlica-p1-lean-improvement-batch-v0` | `TLICA/ProfileIso.lean`, `TLICA/ActionProjection.lean` | Done in this branch | Completed |
| Completed P1/P2 | Branch-distance and affect-kernel helper lemmas | Added branch union-distance bounds, temporal affect-intensity unit bound, and PCE-support non-neutrality. | `dInfUnion_le_one`, existing affect witness structures. | `codex/tlica-p1-lean-improvement-batch-v0` | `TLICA/DifferentiatedAffect.lean` | Done in this branch | Completed |

## A2. Completed in `codex/tlica-shell-stratified-bound-v0`

| Priority | Target | Why it matters | Required dependencies | Branch name | Lean files | Docs updated | Result |
|---|---|---|---|---|---|---|---|
| Completed P1 preparation | Interior shell-distance and profile-level pointwise bounds | Substantially prepares the shell-stratified target without overclaiming boundary-shell semantics. | `ShellThresholds`, `shellOf`, `sameShellBound`, `dInfShared` | `codex/tlica-shell-stratified-bound-v0` | `TLICA/ProfileComparison/ShellRefinement.lean` | `MAPPING.md`, ledger, coverage docs, matrix, report, inventory | Added `interiorShellIndexDistance`, `sameInteriorShell_distance_bound`, `interiorShell_pair_bound`, and `shellStableDistanceBound_of_pointwise`; full seven-shell theorem remains deferred. |

## A3. Completed in `codex/tlica-shell-boundary-conventions-v0`

| Priority | Target | Why it matters | Required dependencies | Branch name | Lean files | Docs updated | Result |
|---|---|---|---|---|---|---|---|
| Completed P1 | Full seven-shell pointwise shell-stratified bound | Resolves the source-level boundary convention blocker for Proposition 5.3.1. | Source-fixed shell 0/6 conventions, `ShellThresholds`, interior preparation theorems. | `codex/tlica-shell-boundary-conventions-v0` | `TLICA/ProfileComparison/ShellRefinement.lean` | `SHELL_BOUNDARY_CONVENTION_AUDIT.md`, mapping, ledger, coverage docs, matrix, report, inventory | Added `ShellIndex7`, `shellOf7`, boundary helper lemmas, and `fullShellStratifiedBound`; legacy marker superseded. |
| Completed P2 | Agency finite-selection wrappers and direct PCE bridge | Makes the finite feasible-selection theorem easier to apply and clarifies primary `ProjectedPCE` usage. | Existing finset theorem, `Set.Finite.toFinset`, `ProjectedPCE`. | `codex/tlica-shell-boundary-conventions-v0` | `TLICA/Agency.lean` | Mapping, ledger, coverage docs, matrix, report, inventory | Added `feasibleProjectedPCE_eq_projectedPCE`, `exists_selectsFeasibleAction_of_finite_feasible`, and `exists_selectsFeasibleAction_of_fintype`. |
| Completed P2 | Generated trajectory helper API | Adds low-risk theorem names around `generatedBy`. | Existing deterministic projection definitions. | `codex/tlica-shell-boundary-conventions-v0` | `TLICA/TemporalTrajectory.lean` | Mapping, ledger, coverage docs, matrix, report, inventory | Added `generatedBy_step`, `generatedBy_step_projectedProfile`, and `trajectoryFutureContents_eq_branchFutureContents`. |
| Completed P2 | Branch-distance helper expansion | Exposes reflexivity, symmetry, and triangle for branch union distance. | Existing `dInfUnion` theorem package. | `codex/tlica-shell-boundary-conventions-v0` | `TLICA/DifferentiatedAffect.lean` | Mapping, ledger, coverage docs, matrix, report, inventory | Added `branchUnionDistance_self`, `branchUnionDistance_symm`, and `branchUnionDistance_triangle`. |
| Completed audit | Contestable boundary source/Lean readiness audit | Prevents over-formalizing `contestableBoundary` before the source chooses a refinement predicate. | `IBoundary`, orphan-cluster boundary candidates. | `codex/tlica-shell-boundary-conventions-v0` | None | `CONTESTABLE_BOUNDARY_AUDIT.md`, matrix, backlog, report | Audit says contestable boundary is not Lean-ready beyond current stub. |

## A4. Completed in `codex/tlica-profile-shell-bound-corollary-v0`

| Priority | Target | Why it matters | Required dependencies | Branch name | Lean files | Docs updated | Result |
|---|---|---|---|---|---|---|---|
| Completed P2 | Shared-domain profile shell-stratified corollaries | Packages `fullShellStratifiedBound` over `dInfShared` without changing the distance definitions. | `shellEndpointBound`, `fullShellStratifiedBound`, `shellStableDistanceBound_of_pointwise`. | `codex/tlica-profile-shell-bound-corollary-v0` | `TLICA/ProfileComparison/ShellRefinement.lean` | Mapping, ledger, coverage docs, matrix, backlog, report, inventory | Added endpoint-bound helper lemmas, uniform shared-domain theorem, zero-extension preferred API variant, variable-shell shared-domain theorem, and same-interior endpoint bridge. |
| Completed audit | Union-domain shell-bound audit | Prevents overclaiming a `dInfUnion` shell theorem before zero-extension shell hypotheses are fixed. | `dInfUnion`, zero-extension convention. | `codex/tlica-profile-shell-bound-corollary-v0` | None | `SHELL_BOUNDARY_CONVENTION_AUDIT.md`, `NEXT_LEAN_FRONTIER.md`, matrix, backlog, report | Documents that union-domain shell bounds need hypotheses over `f.domain ∪ g.domain`, including absent values as zero. |
| Completed P2 | Direct projected-profile/future-content aliases | Reduces compatibility-name friction without refactoring downstream modules. | Existing general/direct equality theorems. | `codex/tlica-profile-shell-bound-corollary-v0` | `TLICA/FreeWill.lean`, `TLICA/TemporalTrajectory.lean` | Mapping, ledger, coverage docs, matrix, report, inventory | Added branch and trajectory direct future-content bridges, plus a temporal one-step branch union-distance definition and unfold theorem. |

## A5. Completed in `codex/tlica-claude-union-shell-sync-v0`

| Priority | Target | Why it matters | Required dependencies | Branch name | Lean files | Docs updated | Result |
|---|---|---|---|---|---|---|---|
| Completed P2 | Union-domain profile shell-stratified bound | Packages `fullShellStratifiedBound` over `dInfUnion` with explicit zero-extension and outer-shell absorption hypotheses. | Boundary-aware pointwise theorem, union-domain hypothesis design, absent values treated as zero. | `codex/tlica-claude-union-shell-sync-v0` | `TLICA/ProfileComparison/ShellRefinement.lean` | `MAPPING.md`, ledger, matrix, coverage docs, shell audit, report, inventory | Added `dInfUnion_le_of_pointwise`, `dInfUnion_le_of_pointwise_union`, `dInfUnion_le_shellEndpointBound_zeroExtend`, `dInfUnion_le_threeWayMax_shellEndpointBound`, and `dInfUnion_le_of_pointwise_shellEndpointBound`. |
| Completed P4 | Interior shell-distance helper usage | Keeps `interiorShellIndexDistance` from being only an orphaned helper definition. | Existing `interiorShellIndexDistance`. | `codex/tlica-claude-union-shell-sync-v0` | `TLICA/ProfileComparison/ShellRefinement.lean` | Mapping, ledger, coverage docs, matrix, report, inventory | Added `interiorShellIndexDistance_self` and `interiorShellIndexDistance_symm`. |

## B. Remaining Immediate Lean-Ready Theorem Targets

| Priority | Target | Why it matters | Required dependencies | Proposed branch name | Expected Lean files | Expected docs to update | Risk |
|---|---|---|---|---|---|---|---|
| P2 | Direct `ProjectedPCE` API cleanup | Reduces dependence on compatibility names in comments and downstream helper statements. | Existing equality theorem `generalProjectedPCE_eq_projectedPCE`; branch/trajectory direct API bridges. | `codex/tlica-direct-projected-pce-api-v0` | Dependent modules if touched | `MAPPING.md`, ledger, coverage audit | Low-medium |

## C. Lean-Ready Structure Targets

| Priority | Target | Why it matters | Required dependencies | Proposed branch name | Expected Lean files | Expected docs to update | Risk |
|---|---|---|---|---|---|---|---|
| P3 | Contestable boundary signature clarification | Turns `contestableBoundary` from a bare named set into a documented structure or theorem target after source refinement. | Choice among perturbation sensitivity, Mode A/C dual candidacy, projection-induced class change, or temporal instability. | `codex/tlica-contestable-boundary-signature` | `TLICA/IBoundary.lean` after source work | `MAPPING.md`, ledger, source-alignment audit | Medium |
| P2 | Pseudo-emetric convenience lemmas | Makes the profile-space instance easier to cite. | Existing `ProfileSpace` and `edist_def`. | `codex/tlica-profile-space-helpers` | `TLICA/ProfileComparison/PseudoEMetric.lean` | `MAPPING.md`, ledger | Low |

## D. Prose-First Targets

| Priority | Target | Why it matters | Required dependencies | Proposed branch name | Expected Lean files | Expected docs to update | Risk |
|---|---|---|---|---|---|---|---|
| P3 | Religiously charged experience | It is explicitly prose-only and not Lean-ready. | Clarify charged vs sacred terminology, source opacity, positive/negative/ambivalent transformations, attractor structure, affect/temporal relation, theological non-overcommitment. | `codex/tlica-rcx-source-refinement` | None expected | Rosetta source docs, matrix, backlog | High |
| P3 | Named affect taxonomy | Needed before Lean can distinguish love, grief, fear, etc. | Stable taxonomy and mathematical discriminants. | `codex/tlica-affect-taxonomy-source` | None expected | Affect source docs, matrix | High |
| P3 | Substrate affect pathways | Current Lean kernel is profile/PCE-based only. | Definition of substrate pathway object and relation to profile/PCE kernel. | `codex/tlica-substrate-affect-source` | None expected | Affect source docs, matrix | High |
| P3 | Source-opacity affect | Needed for both affect and RCX source-opacity claims. | Source-opacity semantics and observability relation. | `codex/tlica-source-opacity-source` | None expected | Affect and RCX docs, matrix | High |
| P3 | Phenomenological duration | Current temporal layer is deterministic profile trajectory substrate only. | Duration object, metric, and relation to trajectory/profile distances. | `codex/tlica-phenomenological-duration-source` | None expected | Temporal source docs, matrix | High |
| P3 | Stochastic projection | Lean should wait until deterministic/stochastic boundaries are fully specified. | Stochastic process type, action schedule interaction, deterministic limit case. | `codex/tlica-stochastic-projection-source` | None expected initially | Temporal/action projection docs, matrix | High |

## E. Compatibility Cleanup Targets

| Priority | Target | Why it matters | Required dependencies | Proposed branch name | Expected Lean files | Expected docs to update | Risk |
|---|---|---|---|---|---|---|---|
| P0 | Prevent `GeneralProjectMap` primitive wording | Misstates v0.4 architecture if described as primitive. | Existing source-alignment docs. | `codex/tlica-compatibility-wording-audit` | None expected | Rosetta docs, verification report | Low |
| P2 | Migrate new docs/modules to direct `ProjectMap`/`ProjectedPCE` names | Keeps compatibility names from becoming de facto primary. | Existing compatibility equalities. | `codex/tlica-direct-projected-pce-api` | `TLICA/Agency.lean` and dependents only if low risk | `MAPPING.md`, ledger | Medium |
| P2 | Old singleton `Action` wrapper cleanup | Reduces confusion around `Action α` versus arbitrary `Act`. | `DefaultAction`, `DefaultProjectMap`, `UnitDefaultProjectMap`. | `codex/tlica-action-wrapper-cleanup` | `TLICA/ProjectMap.lean`, docs only if possible | `MAPPING.md`, source-alignment audit | Medium |
| P2 | Default-action naming cleanup | Clarifies foundation default versus application action carriers. | Current `ProjectMap` compatibility names. | `codex/tlica-default-action-naming` | `TLICA/ProjectMap.lean` if needed | `MAPPING.md`, ledger | Medium |

## F. Deferred / Blocked Targets

| Priority | Target | Why it matters | Required dependencies | Proposed branch name | Expected Lean files | Expected docs to update | Risk |
|---|---|---|---|---|---|---|---|
| P4 | RCX Lean module | Religious experience formalization is not source-ready and was explicitly excluded from v0.4. | RCX source refinement first. | `codex/tlica-rcx-deferred` | None | Matrix/backlog only | High |
| P4 | New major application theory module | This branch is release audit/planning, not new theory. | Separate scoped proposal. | `codex/tlica-next-application-kernel` | TBD | TBD | High |
| P4 | Full named affect/love formalization | Depends on taxonomy and constitutive-extension semantics. | Affect source refinement. | `codex/tlica-love-source-first` | None initially | Affect docs | High |
| P4 | Phenomenological duration Lean theorem package | Needs source-level metric calibration. | Temporal source refinement. | `codex/tlica-duration-source-first` | None initially | Temporal docs | High |

## Current P0 Findings

No imported Lean theorem overclaim was found in the current v0.4 source-aligned
documents. The main P0 class is documentation wording: do not call
`GeneralProjectMap` primitive, do not say foundation-default `PCE` differentiates
actions, and do not describe agency, free will, affect, or RCX as fully
formalized.
