/-
TLICA.Agency — Feasible action selection under generalized projected PCE.

Agency is modeled as more than action occurrence: an agency context provides a
generalized deterministic projection layer, a feasible action set for each
profile, and evaluation by `GeneralProjectedPCE`. Selection is only stated
relative to feasible alternatives. This module does not assert global existence
of maximizers.

Free-will branch semantics remain deferred.
-/

import TLICA.GeneralActionProjection

namespace TLICA.Agency

open TLICA.Profile
open TLICA.ProjectMap
open TLICA.ActionProjection
open TLICA.GeneralActionProjection

variable {α Act : Type*}

/-- Feasibility model indexed by a deterministic project map.

This lifts no-action feasibility into a reusable foundation-level structure
while allowing feasibility to depend on the action space and projection
context. -/
structure FeasibilityModel (α Act : Type*) (proj : GeneralProjectMap α Act) where
  /-- Feasible actions at a current profile. -/
  feasible : ScalarProfile α → Set Act
  /-- No-action is always feasible. -/
  noAction_feasible : ∀ P, proj.noAction ∈ feasible P

/-- Agency context over an arbitrary action type.

The context packages the projected-PCE calibration and a feasible action set at
each current profile. The no-action element is required to be feasible, giving
every profile at least one feasible action without asserting that any maximizer
exists. -/
structure AgencyContext (α Act : Type*) where
  /-- Future-MSI assignment for projected profiles. -/
  fam : FutureMSIModel α
  /-- Universal-domain preservation ranking. -/
  globalRank : GlobalPreservationRanking α
  /-- Deterministic generalized projection over `Act`. -/
  proj : GeneralProjectMap α Act
  /-- Feasibility model for this projection context. -/
  feasibility : FeasibilityModel α Act proj

namespace AgencyContext

variable {α Act : Type*}

/-- Feasible actions at a current profile, exposed as an accessor to preserve
    existing `ctx.feasible P` notation. -/
def feasible (ctx : AgencyContext α Act) : ScalarProfile α → Set Act :=
  ctx.feasibility.feasible

/-- No-action feasibility, exposed as an accessor over the lifted feasibility
    model. -/
theorem noAction_feasible (ctx : AgencyContext α Act) (P : ScalarProfile α) :
    ctx.proj.noAction ∈ ctx.feasible P :=
  ctx.feasibility.noAction_feasible P

/-- Constructor from an explicit feasible-set function and no-action
    feasibility proof. This preserves the ergonomic pre-v0.4 construction
    pattern while storing feasibility in `FeasibilityModel`. -/
def mkFromFeasible
    (fam : FutureMSIModel α)
    (globalRank : GlobalPreservationRanking α)
    (proj : GeneralProjectMap α Act)
    (feasible : ScalarProfile α → Set Act)
    (noAction_feasible : ∀ P, proj.noAction ∈ feasible P) :
    AgencyContext α Act where
  fam := fam
  globalRank := globalRank
  proj := proj
  feasibility := {
    feasible := feasible
    noAction_feasible := noAction_feasible
  }

end AgencyContext

/-- Projected PCE evaluated in an agency context. Feasibility is kept as a
    separate predicate so infeasible alternatives can be excluded explicitly. -/
def feasibleProjectedPCE (ctx : AgencyContext α Act)
    (P : ScalarProfile α) (a : Act) : ℝ :=
  GeneralProjectedPCE ctx.fam ctx.globalRank ctx.proj P a

/-- Feasible action selection: `a` is feasible and maximizes generalized
    projected PCE over all feasible alternatives. -/
def selectsFeasibleAction (ctx : AgencyContext α Act)
    (P : ScalarProfile α) (a : Act) : Prop :=
  a ∈ ctx.feasible P ∧
    ∀ b, b ∈ ctx.feasible P →
      feasibleProjectedPCE ctx P b ≤ feasibleProjectedPCE ctx P a

/-- Two distinct feasible actions at a profile. -/
def liveAlternative (ctx : AgencyContext α Act)
    (P : ScalarProfile α) (a b : Act) : Prop :=
  a ∈ ctx.feasible P ∧ b ∈ ctx.feasible P ∧ a ≠ b

/-- Nontrivial agency condition: the feasible set contains at least two
    distinct actions. -/
def hasLiveAlternatives (ctx : AgencyContext α Act) (P : ScalarProfile α) : Prop :=
  ∃ a b, liveAlternative ctx P a b

/-- Feasible alternatives whose generalized projected-PCE values differ. -/
def pceDifferentiatedAlternative (ctx : AgencyContext α Act)
    (P : ScalarProfile α) (a b : Act) : Prop :=
  a ∈ ctx.feasible P ∧ b ∈ ctx.feasible P ∧
    feasibleProjectedPCE ctx P a ≠ feasibleProjectedPCE ctx P b

/-- Witness that a selected feasible action exists at a profile. This is a
    witness structure, not a global existence theorem. -/
structure AgencyWitness (ctx : AgencyContext α Act) (P : ScalarProfile α) where
  /-- The selected action. -/
  selected : Act
  /-- The selected action is feasible. -/
  selected_feasible : selected ∈ ctx.feasible P
  /-- The selected action maximizes generalized projected PCE over feasible alternatives. -/
  selected_max :
    ∀ b, b ∈ ctx.feasible P →
      feasibleProjectedPCE ctx P b ≤ feasibleProjectedPCE ctx P selected

namespace AgencyWitness

variable {ctx : AgencyContext α Act} {P : ScalarProfile α}

/-- The selected action in an agency witness is feasible. -/
theorem selected_is_feasible (w : AgencyWitness ctx P) :
    w.selected ∈ ctx.feasible P :=
  w.selected_feasible

/-- The selected action in an agency witness maximizes over feasible actions. -/
theorem selected_maximizes (w : AgencyWitness ctx P) :
    ∀ b, b ∈ ctx.feasible P →
      feasibleProjectedPCE ctx P b ≤ feasibleProjectedPCE ctx P w.selected :=
  w.selected_max

/-- An agency witness gives the corresponding feasible-selection predicate. -/
theorem selects_selected (w : AgencyWitness ctx P) :
    selectsFeasibleAction ctx P w.selected :=
  ⟨w.selected_feasible, w.selected_max⟩

end AgencyWitness

/-- A feasible selected action can be packaged as an agency witness. -/
def witness_of_selectsFeasibleAction
    (ctx : AgencyContext α Act) (P : ScalarProfile α) (a : Act)
    (h : selectsFeasibleAction ctx P a) :
    AgencyWitness ctx P where
  selected := a
  selected_feasible := h.1
  selected_max := h.2

/-- An agency witness implies that its selected action satisfies
    `selectsFeasibleAction`. -/
theorem selectsFeasibleAction_of_witness
    (ctx : AgencyContext α Act) (P : ScalarProfile α)
    (w : AgencyWitness ctx P) :
    selectsFeasibleAction ctx P w.selected :=
  w.selects_selected

/-- A selected feasible action rules out any feasible alternative with strictly
    higher generalized projected PCE. -/
theorem not_exists_feasible_strictly_higher_of_selects
    (ctx : AgencyContext α Act) (P : ScalarProfile α) (a : Act)
    (hsel : selectsFeasibleAction ctx P a) :
    ¬ ∃ b, b ∈ ctx.feasible P ∧
      feasibleProjectedPCE ctx P a < feasibleProjectedPCE ctx P b := by
  intro h
  rcases h with ⟨b, hb_feasible, hb_gt⟩
  have hb_le := hsel.2 b hb_feasible
  exact not_lt_of_ge hb_le hb_gt

/-- If live alternatives exist, then there are two distinct feasible actions. -/
theorem exists_distinct_feasible_of_hasLiveAlternatives
    (ctx : AgencyContext α Act) (P : ScalarProfile α)
    (h : hasLiveAlternatives ctx P) :
    ∃ a b, a ∈ ctx.feasible P ∧ b ∈ ctx.feasible P ∧ a ≠ b :=
  h

/-- If a selected action strictly beats a feasible alternative, then those
    feasible alternatives are PCE-differentiated. -/
theorem pceDifferentiatedAlternative_of_selected_strictly_beats
    (ctx : AgencyContext α Act) (P : ScalarProfile α) (a b : Act)
    (hsel : selectsFeasibleAction ctx P a)
    (hb : b ∈ ctx.feasible P)
    (hgt : feasibleProjectedPCE ctx P b < feasibleProjectedPCE ctx P a) :
    pceDifferentiatedAlternative ctx P a b :=
  ⟨hsel.1, hb, ne_of_gt hgt⟩

/-- Deferred marker for a future finite-feasible-action extension.

Existence of feasible maximizers should be proved only after adding finite or
compact feasible-set hypotheses. -/
def finiteFeasibleSelection_deferred : Prop := True

end TLICA.Agency
