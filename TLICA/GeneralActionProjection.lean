/-
TLICA.GeneralActionProjection — Projected PCE over arbitrary action spaces.

The existing foundation action type `TLICA.ProjectMap.Action α` stores
`Unit`, so it is singleton-like. `TLICA.ActionProjection.ProjectedPCE` is still
useful as an interface over that foundation type, but agency and free-will
formalization need an arbitrary action type.

This module adds a deterministic project-map layer parameterized by
`Act : Type*`, while preserving the existing `ProjectMap` and `ProjectedPCE`
layers unchanged. Stochastic projection remains deferred.
-/

import TLICA.ActionProjection

namespace TLICA.GeneralActionProjection

open TLICA.Profile
open TLICA.MSI
open TLICA.ProjectMap
open TLICA.ActionProjection

variable {α Act : Type*}

/-- Deterministic project map over an arbitrary action type `Act`. -/
structure GeneralProjectMap (α Act : Type*) where
  /-- The no-action / null action in the generalized action space. -/
  noAction : Act
  /-- Deterministic projection of a profile under an action. -/
  project : Act → ScalarProfile α → ScalarProfile α
  /-- No-action projection agrees with some natural-dynamics evolution. -/
  identity_action_natural :
    ∃ (naturalDynamics : ScalarProfile α → ScalarProfile α),
      ∀ P, project noAction P = naturalDynamics P

/-- The existing deterministic `ProjectMap` embeds into the generalized layer. -/
def generalProjectMapOfProjectMap (proj : ProjectMap α) :
    GeneralProjectMap α (Action α) where
  noAction := Action.noAction
  project := proj.project
  identity_action_natural := proj.identity_action_natural

/-- General deterministic projected profile for an arbitrary action type. -/
def generalProjectedProfile (proj : GeneralProjectMap α Act)
    (P : ScalarProfile α) (a : Act) : ScalarProfile α :=
  proj.project a P

/-- Future MSI assigned to the general deterministic projected profile. -/
def generalFutureMSI (fam : FutureMSIModel α) (proj : GeneralProjectMap α Act)
    (P : ScalarProfile α) (a : Act) : MSI α :=
  fam.msiOf (generalProjectedProfile proj P a)

/-- Universal-domain future content set for the generalized projected PCE. -/
def generalFutureMSIContents (fam : FutureMSIModel α) (proj : GeneralProjectMap α Act)
    (P : ScalarProfile α) (a : Act) : Set α :=
  liftMSIContents (generalFutureMSI fam proj P a)

/-- Projected PCE over an arbitrary action type.

This is the application-ready deterministic action layer. It is not blocked by
the singleton-like foundation `Action α` type because `Act` is supplied by the
application. -/
def GeneralProjectedPCE (fam : FutureMSIModel α)
    (globalRank : GlobalPreservationRanking α) (proj : GeneralProjectMap α Act)
    (P : ScalarProfile α) (a : Act) : ℝ :=
  globalRank.rank (generalFutureMSIContents fam proj P a)

namespace GeneralProjectedPCE

variable {α Act : Type*}

/-- General projected PCE is non-negative by global-rank non-negativity. -/
theorem nonneg (fam : FutureMSIModel α) (globalRank : GlobalPreservationRanking α)
    (proj : GeneralProjectMap α Act) (P : ScalarProfile α) (a : Act) :
    0 ≤ GeneralProjectedPCE fam globalRank proj P a :=
  globalRank.rank_nonneg _

/-- Equal lifted future MSI contents induce equal general projected-PCE values. -/
theorem eq_of_future_contents_eq
    (fam : FutureMSIModel α) (globalRank : GlobalPreservationRanking α)
    (proj : GeneralProjectMap α Act) (P : ScalarProfile α) (a b : Act)
    (h : generalFutureMSIContents fam proj P a =
      generalFutureMSIContents fam proj P b) :
    GeneralProjectedPCE fam globalRank proj P a =
      GeneralProjectedPCE fam globalRank proj P b := by
  unfold GeneralProjectedPCE
  rw [h]

/-- Rank comparison implies general projected-PCE comparison. -/
theorem ge_of_rank_ge
    (fam : FutureMSIModel α) (globalRank : GlobalPreservationRanking α)
    (proj : GeneralProjectMap α Act) (P : ScalarProfile α) (a b : Act)
    (h : globalRank.rank (generalFutureMSIContents fam proj P b) ≤
      globalRank.rank (generalFutureMSIContents fam proj P a)) :
    GeneralProjectedPCE fam globalRank proj P b ≤
      GeneralProjectedPCE fam globalRank proj P a :=
  h

/-- Monotonicity with respect to lifted future MSI content inclusion. -/
theorem monotone_of_future_contents_subset
    (fam : FutureMSIModel α) (globalRank : GlobalPreservationRanking α)
    (proj : GeneralProjectMap α Act) (P : ScalarProfile α) (a b : Act)
    (h : generalFutureMSIContents fam proj P b ⊆
      generalFutureMSIContents fam proj P a) :
    GeneralProjectedPCE fam globalRank proj P b ≤
      GeneralProjectedPCE fam globalRank proj P a :=
  globalRank.monotone _ _ h

/-- General projected action-selection over arbitrary action type `Act`. -/
def selectsGeneralProjectedAction
    (fam : FutureMSIModel α) (globalRank : GlobalPreservationRanking α)
    (proj : GeneralProjectMap α Act) (P : ScalarProfile α) (a : Act) : Prop :=
  ∀ b : Act, GeneralProjectedPCE fam globalRank proj P b ≤
    GeneralProjectedPCE fam globalRank proj P a

/-- A selected general projected action has maximal general projected PCE. -/
theorem selected_has_max_generalProjectedPCE
    (fam : FutureMSIModel α) (globalRank : GlobalPreservationRanking α)
    (proj : GeneralProjectMap α Act) (P : ScalarProfile α) (a b : Act)
    (hsel : selectsGeneralProjectedAction fam globalRank proj P a) :
    GeneralProjectedPCE fam globalRank proj P b ≤
      GeneralProjectedPCE fam globalRank proj P a :=
  hsel b

/-- Conditional strict action differentiation over arbitrary action types.

This theorem does not assert that differentiating actions exist. It says that
when an application action space supplies actions whose lifted future MSI
contents receive strictly different global ranks, the generalized projected PCE
strictly differentiates them. Since `Act` is arbitrary, this result is no
longer blocked by the singleton-like foundation `Action α` type. -/
theorem strictly_differentiates_of_rank_lt
    (fam : FutureMSIModel α) (globalRank : GlobalPreservationRanking α)
    (proj : GeneralProjectMap α Act) (P : ScalarProfile α) (a b : Act)
    (h : globalRank.rank (generalFutureMSIContents fam proj P a) <
      globalRank.rank (generalFutureMSIContents fam proj P b)) :
    GeneralProjectedPCE fam globalRank proj P a <
      GeneralProjectedPCE fam globalRank proj P b :=
  h

end GeneralProjectedPCE

/-- Explicitly named conditional theorem showing that generalized projected PCE
    can strictly differentiate arbitrary application actions when their lifted
    future MSI contents have strictly different global ranks. This is the
    non-singleton-action-space version of projected-PCE differentiation. -/
theorem generalProjectedPCE_strictly_differentiates_of_rank_lt
    (fam : FutureMSIModel α) (globalRank : GlobalPreservationRanking α)
    (proj : GeneralProjectMap α Act) (P : ScalarProfile α) (a b : Act)
    (h : globalRank.rank (generalFutureMSIContents fam proj P a) <
      globalRank.rank (generalFutureMSIContents fam proj P b)) :
    GeneralProjectedPCE fam globalRank proj P a <
      GeneralProjectedPCE fam globalRank proj P b :=
  GeneralProjectedPCE.strictly_differentiates_of_rank_lt fam globalRank proj P a b h

end TLICA.GeneralActionProjection
