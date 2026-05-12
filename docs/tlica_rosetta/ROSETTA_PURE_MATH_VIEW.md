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

A profile is modeled as a bounded scalar assignment over a domain. Profiles admit zero-extension to an ambient union domain. The induced extended `L^∞`-style union distance is nonnegative, symmetric, reflexive, bounded, and satisfies the triangle inequality.

Lean carriers: `ScalarProfile`, `zeroExtend`, `dInfUnion`, `dInfUnion_*`.

## 6. Shell partitions and coarse stability

Thresholds partition scalar values into shells. If two points lie in the same shell, their absolute scalar difference is bounded by the maximum adjacent threshold gap. A full shell-stratified bound remains a target theorem.

Lean carriers: `ShellThresholds`, `sameShellBound`, `shellStratifiedBound_TODO`.

## 7. Distinguished self-substructure and preservation ranking

A distinguished subset/substructure satisfies inclusion and density-style properties. A ranking/order functional evaluates preservation of that structure, with axioms enforcing distinguished-point necessity and maximality of the specified substructure.

Lean carriers: `MSI`, `PreservationRanking`.

## 8. Projection and prerogative functionals

Actions induce future-state projections. Composite objective functionals are defined over projected future states. Some foundation-level properties are pure consequences of nonnegativity and boundedness; differentiated action choice is deferred to richer application-calibrated projection models.

In the deterministic foundation default currently encoded in Lean, the continued-existence functional is constant across actions and equals the preservation rank of the MSI contents. This is a verified default-model fact, not an application-level claim that all real action choices are equivalent.

Lean carriers: `Action`, `ProjectMap`, `PCE`, `PCE.eq_rank_msi_contents`, `PCE.all_actions_equal`.

## 9. Consistency classification and mode selection

A ternary evaluation classifies elements as positive, neutral, or negative relative to a consistency criterion. A finite mode operator is selected from this evaluation. Boundary operators are definable from the induced partition.

The three evaluation classes are verified to be pairwise disjoint and jointly exhaustive over the profile domain. The foundation boundary is the union of positive and negative classes, so membership is equivalent to positive-or-negative evaluation and excludes neutral evaluation.

Lean carriers: `ConsistencyEval`, `PtCns`, `PtCns.partition_disjoint`, `PtCns.partition_cover`, `ModeOp`, `IBoundary`, `IBoundary.mem_boundary_iff`, `IBoundary.boundary_not_neutral`.
