# Rosetta Pure Math View — Seed

This document removes TLICA-specific vocabulary and expresses the formal apparatus as mathematics.

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

Actions induce future-state projections. Composite objective functionals are defined over projected future states. Some foundation-level properties are pure consequences of nonnegativity and boundedness; differentiated action choice is deferred to richer application-calibrated projection models.

In the deterministic foundation default currently encoded in Lean, the continued-existence functional is constant across actions and equals the preservation rank of the MSI contents. This is a verified default-model fact, not an application-level claim that all real action choices are equivalent.

Lean carriers: `Action`, `ProjectMap`, `PCE`, `PCE.eq_rank_msi_contents`, `PCE.all_actions_equal`.

## 8.1 Action-calibrated projected PCE

The application-ready refinement keeps deterministic projection but evaluates the MSI assigned to each projected future profile. A `FutureMSIModel` supplies this cross-time MSI assignment. It uses the weaker `domain_match` condition rather than full profile equality, because full equality of `ScalarProfile` values involves dependent functions over subtype domains; projected PCE only ranks lifted MSI content sets in the universal type.

A `GlobalPreservationRanking` ranks universal-domain content sets with non-negativity and monotonicity assumptions. `ProjectedPCE` applies that ranking to the lifted future MSI contents of each existing foundation action. It is nonnegative, respects equality and inclusion of lifted future contents, defines projected action selection, and strictly differentiates actions whenever an application supplies a strict global-rank inequality between their lifted future MSI contents.

This `ProjectedPCE` layer is still indexed by the current foundation `Action α`, which is singleton-like because it stores only `Unit`. It is therefore an interface layer, not the final agency/free-will action-space model.

Stochastic projection is deferred; this layer uses the existing deterministic `ProjectMap`.

Lean carriers: `FutureMSIModel`, `GlobalPreservationRanking`, `liftSet`, `liftMSIContents`, `projectedProfile`, `futureMSI`, `futureMSIContents`, `ProjectedPCE`, `ProjectedPCE.*`.

## 8.2 General action-space projected PCE

The generalized deterministic layer replaces the foundation action type with an arbitrary application action type `Act`. A `GeneralProjectMap α Act` supplies a no-action element, deterministic projection, and natural-dynamics compatibility. The old `ProjectMap α` embeds into this layer by `generalProjectMapOfProjectMap`, preserving the foundation interface.

`GeneralProjectedPCE` is the application-ready projected PCE for agency and free-will formalization. It has the same nonnegativity, equality, rank-comparison, monotonicity, selection, and conditional strict-differentiation theorems as `ProjectedPCE`, but it is no longer blocked by singleton-like action typing. It still does not assert that differentiating actions exist; strict differentiation remains conditional on a supplied strict global-rank inequality.

Deterministic projection remains the current layer; stochastic projection remains deferred.

Lean carriers: `GeneralProjectMap`, `generalProjectMapOfProjectMap`, `generalProjectedProfile`, `generalFutureMSI`, `generalFutureMSIContents`, `GeneralProjectedPCE`, `GeneralProjectedPCE.*`, `generalProjectedPCE_strictly_differentiates_of_rank_lt`.

## 8.3 Agency as feasible projected-PCE selection

Agency is modeled as a feasible action-selection context over the generalized action-space layer. An `AgencyContext` supplies a future-MSI model, a global preservation ranking, a generalized deterministic projection map, and a feasible action set at each profile. The no-action element is required to be feasible, but existence of a maximizing selected action is not asserted globally.

`selectsFeasibleAction` says that an action is feasible and maximizes `GeneralProjectedPCE` over feasible alternatives. `AgencyWitness` packages a selected feasible maximizer when such a witness is supplied. Nontrivial agency requires live alternatives, i.e. at least two distinct feasible actions. PCE-differentiated agency requires feasible alternatives with different projected-PCE values.

Finite feasible-set assumptions for proving selected-action existence are deferred. Free will remains deferred; this branch only formalizes agency selection.

Lean carriers: `AgencyContext`, `feasibleProjectedPCE`, `selectsFeasibleAction`, `liveAlternative`, `hasLiveAlternatives`, `pceDifferentiatedAlternative`, `AgencyWitness`, `finiteFeasibleSelection_deferred`.

## 9. Consistency classification and mode selection

A ternary evaluation classifies elements as positive, neutral, or negative relative to a consistency criterion. A finite mode operator is selected from this evaluation. Boundary operators are definable from the induced partition.

The three evaluation classes are verified to be pairwise disjoint and jointly exhaustive over the profile domain. The foundation boundary is the union of positive and negative classes, so membership is equivalent to positive-or-negative evaluation and excludes neutral evaluation.

Lean carriers: `ConsistencyEval`, `PtCns`, `PtCns.partition_disjoint`, `PtCns.partition_cover`, `ModeOp`, `IBoundary`, `IBoundary.mem_boundary_iff`, `IBoundary.boundary_not_neutral`.
