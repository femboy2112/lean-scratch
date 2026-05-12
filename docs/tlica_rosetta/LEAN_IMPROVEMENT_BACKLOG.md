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

## B. Remaining Immediate Lean-Ready Theorem Targets

| Priority | Target | Why it matters | Required dependencies | Proposed branch name | Expected Lean files | Expected docs to update | Risk |
|---|---|---|---|---|---|---|---|
| P1 | Full shell-stratified bound | Closes the largest remaining profile-comparison theorem marker. | Explicit boundary shell convention, `ShellThresholds`, `sameShellBound`, `dInfUnion`. | `codex/tlica-shell-stratified-bound` | `TLICA/ProfileComparison/ShellRefinement.lean` | `MAPPING.md`, ledger, matrix | Medium |
| P2 | Direct `ProjectedPCE` aliases replacing compatibility usage | Reduces dependence on `GeneralProjectedPCE` compatibility names in newer modules. | Existing equality theorem `generalProjectedPCE_eq_projectedPCE`. | `codex/tlica-direct-projected-pce-api` | `TLICA/Agency.lean`, dependent modules if touched | `MAPPING.md`, ledger, coverage audit | Medium |

## C. Lean-Ready Structure Targets

| Priority | Target | Why it matters | Required dependencies | Proposed branch name | Expected Lean files | Expected docs to update | Risk |
|---|---|---|---|---|---|---|---|
| P2 | Generated trajectory helper API | Adds low-risk theorem names around `generatedBy` without changing semantics. | Existing deterministic projection definitions. | `codex/tlica-generated-trajectory-api` | `TLICA/TemporalTrajectory.lean` | `MAPPING.md`, ledger | Low |
| P2 | Contestable boundary signature clarification | Turns `contestableBoundary` from a bare named set into a documented structure or theorem target if the source settles it. | PtCns/IBoundary source clarification. | `codex/tlica-contestable-boundary-signature` | `TLICA/IBoundary.lean` | `MAPPING.md`, ledger, source-alignment audit | Medium |
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
