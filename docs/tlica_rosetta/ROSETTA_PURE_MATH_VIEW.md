# Rosetta Pure Math View — Seed

This document removes TLICA-specific vocabulary and expresses the formal apparatus as mathematics.

## Status and boundary convention

The normalized Rosetta status categories are:

`machine_verified_definition`, `machine_verified_theorem`, `machine_verified_structure`, `primitive_structure_field`, `compatibility_alias`, `compatibility_theorem`, `deferred_marker_not_theorem`, `application_deferred`, `prose_only_unformalized`, and `deprecated_or_superseded`.

The foundation primitives are `KField`, `ScalarProfile`, `MSI`, `PreservationRanking`, `ProjectMap α Act`, `FutureMSIModel`, `GlobalPreservationRanking`, and `FeasibilityModel`. Derived/application structures include `AgencyContext`, `AgencyWitness`, `FreeWillWitness`, `PCEFreeWillWitness`, `ProfileTrajectory`, `ActionSchedule`, `AffectKernelWitness`, and the affect witness structures. Compatibility names include `GeneralProjectMap`, `GeneralProjectedPCE`, and the `general*` projected-profile/future-content names.

No global existence of agency, free will, trajectories, or affect kernels is asserted. Stochastic projection, phenomenological duration, the full shell-stratified bound, named affect taxonomy, substrate affect pathways, source-opacity affect, and religiously charged experience formalization remain deferred.

## 1. Ordered non-Archimedean coefficient structure

Let `K` be a linearly ordered field equipped with an element `δ : K` satisfying:

- `0 < δ`,
- `δ < 1`,
- `δ` is infinitesimal relative to ordinary positive rational bounds as specified by the source formalization.

Lean carrier: `KField`.

## 2. Distinguished extremal coordinate point

There is a distinguished point/content whose `φ`-coordinate is maximal in the admissible coordinate domain. Non-distinguished Tier-3 points have coordinate values strictly below this maximum.

Lean carriers: `phiCogito`, `phiTier3`, `PhiAdmissibility`, `Tier3Strictness`, `cogito_unique_phi_supremum`.

## 3. Bounded aggregation by summable weighted series

Given nonnegative mode weights bounded by a summable majorant, the scalar aggregation lies in `[0,1]`; under off-distinguished-point hypotheses it lies strictly below `1`.

Lean carriers: `mode_aggregation_*`.

## 4. Coordinate independence

For coordinate triples `(ρ, φ, κ)`, finite witness configurations establish that no one coordinate is in general a function of the other two.

Lean carriers: `CoordinateTriple`, `no_F_rho`, `no_F_phi`, `no_F_kappa`, `formal_non_reducibility`.

## 5. Profiles as bounded scalar functions

A profile is modeled as a bounded scalar assignment over a domain. Profiles admit zero-extension to an ambient union domain. The induced extended `L^∞`-style union distance is nonnegative, symmetric, reflexive, bounded, and satisfies the triangle inequality. The shared-domain distance has the expected bridge-domain triangle inequality: if every point shared by two endpoint profiles is also present in the bridge profile, then the bridge profile mediates the triangle comparison.

Lean carriers: `ScalarProfile`, `zeroExtend`, `dInfUnion`, `dInfUnion_*`, `dInfShared`, `dInfShared_triangle_of_bridge`.

## 6. Shell partitions and coarse stability

Thresholds partition scalar values into interior half-open shells via `shellOf`. If two points lie in the same shell, their absolute scalar difference is bounded by that adjacent threshold gap. The simplified shared-profile same-shell corollary is machine-verified. A full shell-stratified bound across all boundary shells remains deferred because the cogito and outer-shell conventions require additional source-grounded structure.

Lean carriers: `ShellThresholds`, `shellOf`, `sameShellBound`, `sameShellBound_of_shellOf`, `shellStableDistanceVanishing_simple`, `shellStratifiedBound_deferred`.

## 7. Distinguished self-substructure and preservation ranking

A distinguished subset/substructure satisfies inclusion and density-style properties. A ranking/order functional evaluates preservation of that structure, with axioms enforcing distinguished-point necessity and maximality of the specified substructure.

Lean carriers: `MSI`, `PreservationRanking`.

## 8. Projection and prerogative functionals

Actions induce future-state projections. Application pressure from agency, free will, temporal trajectories, and differentiated affect revealed that the old singleton-like `Action α` default was too weak, so the foundation projection map is now parameterized over an arbitrary action type `Act`. The old wrapper `Action α` and the simple unit carrier `DefaultAction α := Unit` are preserved only as degenerate default cases. The v0.4.1 pass is a consolidation of v0.4, not a new theory layer.

Composite objective functionals are defined over projected future states. Some foundation-level properties are pure consequences of nonnegativity and boundedness; differentiated action choice is deferred to richer application-calibrated projection models.

In the deterministic foundation default currently encoded in Lean, the continued-existence functional is constant across actions over arbitrary `Act` and equals the preservation rank of the MSI contents. This is a verified default-model fact, not an application-level claim that all real action choices are equivalent.

Stochastic projection remains deferred.

Lean carriers: `Action`, `DefaultAction`, `DefaultProjectMap`, `UnitDefaultProjectMap`, `ProjectMap`, `PCE`, `PCE.eq_rank_msi_contents`, `PCE.all_actions_equal`.

## 8.1 Action-calibrated projected PCE

The application-ready refinement keeps deterministic projection but evaluates the MSI assigned to each projected future profile. A `FutureMSIModel` supplies this cross-time MSI assignment, and a `GlobalPreservationRanking` supplies the rank/projection bridge. `FutureMSIModel` uses the weaker `domain_match` condition rather than full profile equality, because full equality of `ScalarProfile` values involves dependent functions over subtype domains; projected PCE only ranks lifted MSI content sets in the universal type. The optional `ProfileIso` relation and `CoherentFutureMSIModel` provide a stronger profile-coherence route while preserving `FutureMSIModel` as the default weak compatibility condition.

A `GlobalPreservationRanking` ranks universal-domain content sets with non-negativity and monotonicity assumptions. `ProjectedPCE` applies that ranking to the lifted future MSI contents of each action in the parameterized foundation action space. It is nonnegative, respects equality and inclusion of lifted future contents, defines projected action selection, and strictly differentiates actions whenever an application supplies a strict global-rank inequality between their lifted future MSI contents.

`ProjectedPCE` now works over the parameterized foundation `ProjectMap α Act` and is the primary application-ready projected-PCE definition. The combination of `FutureMSIModel` and `GlobalPreservationRanking` held up across the agency, free-will, temporal, and differentiated-affect layers.

Stochastic projection is deferred; this layer uses the existing deterministic `ProjectMap`.

Lean carriers: `FutureMSIModel`, `ProfileIso`, `CoherentFutureMSIModel`, `CoherentFutureMSIModel.toFutureMSIModel`, `CoherentFutureMSIModel.toFutureMSIModel_domain_match`, `GlobalPreservationRanking`, `liftSet`, `liftMSIContents`, `projectedProfile`, `futureMSI`, `futureMSIContents`, `ProjectedPCE`, `ProjectedPCE.*`.

## 8.2 General action-space projected PCE

The generalized deterministic layer is now a compatibility naming layer. `GeneralProjectMap α Act` is an abbreviation for the parameterized foundation `ProjectMap α Act`; there is only one primitive deterministic projection structure. The old `generalProjectMapOfProjectMap` bridge is retained as an identity-style compatibility definition for the degenerate action wrapper.

`GeneralProjectedPCE` is retained for older branch continuity in the agency/free-will/temporal/affect stack. It is a compatibility wrapper for `ProjectedPCE`. It has the same nonnegativity, equality, rank-comparison, monotonicity, selection, and conditional strict-differentiation theorems as `ProjectedPCE`, but no longer requires a duplicate primitive project-map structure. It still does not assert that differentiating actions exist; strict differentiation remains conditional on a supplied strict global-rank inequality.

Deterministic projection remains the current layer; stochastic projection remains deferred.

Lean carriers: `GeneralProjectMap`, `generalProjectMapOfProjectMap`, `generalProjectedProfile`, `generalProjectedProfile_eq_projectedProfile`, `generalFutureMSI`, `generalFutureMSI_eq_futureMSI`, `generalFutureMSIContents`, `generalFutureMSIContents_eq_futureMSIContents`, `GeneralProjectedPCE`, `generalProjectedPCE_eq_projectedPCE`, `GeneralProjectedPCE.*`, `generalProjectedPCE_strictly_differentiates_of_rank_lt`.

## 8.3 Agency as feasible projected-PCE selection

Agency is modeled as a feasible action-selection context over the generalized action-space compatibility layer. An `AgencyContext` supplies a future-MSI model, a global preservation ranking, a deterministic projection map, and a project-map-indexed `FeasibilityModel`. This lifts no-action feasibility into reusable foundation-level structure. The no-action element is required to be feasible, but existence of a maximizing selected action is not asserted globally.

`selectsFeasibleAction` says that an action is feasible and maximizes `GeneralProjectedPCE` over feasible alternatives. `AgencyWitness` packages a selected feasible maximizer when such a witness is supplied. Nontrivial agency requires live alternatives, i.e. at least two distinct feasible actions. PCE-differentiated agency requires feasible alternatives with different projected-PCE values.

Finite feasible-set assumptions for proving selected-action existence are deferred. This is a first structural witness layer for agency selection, not a claim that all application-level agency semantics are complete.

Lean carriers: `FeasibilityModel`, `AgencyContext`, `AgencyContext.feasible`, `AgencyContext.noAction_feasible`, `AgencyContext.mkFromFeasible`, `feasibleProjectedPCE`, `selectsFeasibleAction`, `liveAlternative`, `hasLiveAlternatives`, `pceDifferentiatedAlternative`, `AgencyWitness`, `finiteFeasibleSelection_deferred`.

## 8.4 Free will as branch-sensitive agency

Free will is modeled here as a structural witness theory over agency, not as bare action occurrence or unconditioned randomness. A branch is the deterministic projected profile generated by an action, together with its lifted future MSI contents. A `FreeWillWitness` consists of a selected feasible agency action and a live feasible alternative whose branch future contents differ.

This branch gives no universal existence theorem for free will. It only proves consequences from witnesses or hypotheses. If all feasible actions have the same branch future contents, then no branch-distinct free-will witness can exist.

PCE-differentiated free will is machine-verified as stronger than branch-distinct free will: projected-PCE value difference implies branch future content difference, so every `PCEFreeWillWitness` yields a `FreeWillWitness`. Branch collapse excludes both witness types, and projected-PCE collapse excludes PCE-differentiated free-will witnesses. Stochastic projection, incompatibilist/compatibilist metaphysical claims, and richer branch semantics remain deferred.

Lean carriers: `branchProfile`, `branchFutureContents`, `branchDistinctAlternative`, `pceBranchDistinctAlternative`, `openAlternatives`, `FreeWillWitness`, `PCEFreeWillWitness`, `freeWillWitness_of_pceFreeWillWitness`, `no_freeWillWitness_of_all_branch_contents_equal`, `no_pceFreeWillWitness_of_all_branch_contents_equal`, `no_pceFreeWillWitness_of_all_pce_equal`.

## 8.5 Deterministic temporal trajectories

A temporal trajectory is modeled as a natural-number-indexed sequence of scalar profiles. An action schedule is a natural-number-indexed sequence of actions. This layer depends on `FreeWill`, and through it on `Agency` and `GeneralActionProjection`. The `generatedBy` predicate states that a supplied trajectory follows the deterministic generalized projection at every successor step under the supplied schedule; it does not assert that every initial condition or schedule has a globally existing trajectory.

The scheduled branch future contents at time `n` are the existing free-will branch future contents applied to the profile at `n` and the scheduled action at `n`. Adjacent-time stability is measured through the existing profile-comparison distances: union-domain distance `dInfUnion` and shared-domain distance `dInfShared`. Uniform and eventual union-step stability are predicates over these adjacent-time distances.

Branch-sensitive temporal divergence is represented by supplied trajectories with a witnessed time at which their profile states differ. Separately, a `FreeWillWitness` gives one-step branch-sensitive divergence data: selected and alternative live feasible actions have distinct branch future contents. A `PCEFreeWillWitness` gives the same one-step branch-future distinction through its induced `FreeWillWitness`.

Stochastic trajectories and phenomenological duration remain deferred. This deterministic trajectory substrate prepares the profile-difference and time-indexed base needed for later affect and religiously charged transformation work.

Lean carriers: `ProfileTrajectory`, `ActionSchedule`, `generatedBy`, `trajectoryFutureContents`, `stepUnionDistance`, `stepSharedDistance`, `unionStepStable`, `eventuallyUnionStepStable`, `DivergentTrajectories`, `oneStepBranch`, `freeWillWitness_live_branch_contents_distinct`, `freeWillWitness_oneStep_branch_contents_distinct`, `pceFreeWillWitness_oneStep_branch_contents_distinct`, `stochasticTrajectory_deferred`, `phenomenologicalDuration_deferred`, `temporalContinuityMetric_deferred`.

## 8.6 Differentiated-affect kernel

Differentiated affect is represented here only by a generic profile/PCE kernel. Given a baseline action and a comparison action, the relative projected-PCE delta is the comparison action's projected PCE minus the baseline action's projected PCE. PCE-support, PCE-defeat, and PCE-neutrality are therefore relative to a baseline action, and the real-arithmetic equivalences with strict improvement, strict loss, and equality are machine-verified.

The branch-profile side defines union/shared distances between deterministic action branches and an equality-based `branchProfileShift` predicate. Equal branch profiles imply equal branch future contents, so a free-will branch future-content distinction yields a branch-profile shift.

Witness structures package PCE-support, PCE-defeat, PCE-neutrality, profile shift, and a generic `AffectKernelWitness` over feasible actions. The generic kernel requires only a branch-profile shift or projected-PCE differentiation; it is not a named affect category. Free-will witnesses yield profile-shift affect kernels, and PCE-free-will witnesses yield PCE-differentiated affect kernels. If all feasible actions have equal branch profiles and equal projected-PCE values, no affect-kernel witness exists.

`DifferentiatedAffect` depends on `TemporalTrajectory`, and through it on `FreeWill`, `Agency`, and `GeneralActionProjection`. Named affect taxonomy remains deferred. Substrate and source-opacity affect pathways remain deferred.

Lean carriers: `relativePCEDelta`, `pceSupportive`, `pceNeutral`, `pceDefeating`, `pceSupportive_iff`, `pceNeutral_iff`, `pceDefeating_iff`, `pceValence_trichotomy`, `branchUnionDistance`, `branchSharedDistance`, `branchProfileShift`, `branchFutureContents_eq_of_branchProfile_eq`, `branchProfile_ne_of_branchFutureContents_ne`, `PCESupportAffectWitness`, `PCEDefeatAffectWitness`, `PCENeutralAffectWitness`, `ProfileShiftAffectWitness`, `AffectKernelWitness`, `affectKernel_of_freeWillWitness`, `affectKernel_of_pceFreeWillWitness`, `no_affectKernel_of_branch_and_pce_collapse`, `temporalAffectIntensity`, `namedAffectTaxonomy_deferred`, `loveConstitutiveExtension_deferred`, `substrateAffectPathway_deferred`, `sourceOpacityAffect_deferred`.

## 9. Consistency classification and mode selection

A ternary evaluation classifies elements as positive, neutral, or negative relative to a consistency criterion. A finite mode operator is selected from this evaluation. Boundary operators are definable from the induced partition.

The three evaluation classes are verified to be pairwise disjoint and jointly exhaustive over the profile domain. The foundation boundary is the union of positive and negative classes, so membership is equivalent to positive-or-negative evaluation and excludes neutral evaluation.

Lean carriers: `ConsistencyEval`, `PtCns`, `PtCns.partition_disjoint`, `PtCns.partition_cover`, `ModeOp`, `IBoundary`, `IBoundary.mem_boundary_iff`, `IBoundary.boundary_not_neutral`.
