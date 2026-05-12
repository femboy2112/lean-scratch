/-
TLICA.FreeWill — Branch-sensitive agency witnesses.

This module adds the first free-will layer over `TLICA.Agency`. Free will is
not identified with bare agency or unconditioned randomness. Here it is modeled
as agency with live feasible alternatives and branch-sensitive projected
outcomes. The module provides witness structures and conditional theorems only;
it does not assert that free will exists globally.

Stochastic projection remains deferred.
-/

import TLICA.Agency

namespace TLICA.FreeWill

open TLICA.Profile
open TLICA.Agency
open TLICA.GeneralActionProjection

variable {α Act : Type*}

/-- The projected branch profile for an action in an agency context. -/
def branchProfile (ctx : AgencyContext α Act) (P : ScalarProfile α) (a : Act) :
    ScalarProfile α :=
  generalProjectedProfile ctx.proj P a

/-- The lifted future MSI contents for an action branch. -/
def branchFutureContents (ctx : AgencyContext α Act)
    (P : ScalarProfile α) (a : Act) : Set α :=
  generalFutureMSIContents ctx.fam ctx.proj P a

/-- Live alternatives whose projected future contents differ. -/
def branchDistinctAlternative (ctx : AgencyContext α Act)
    (P : ScalarProfile α) (a b : Act) : Prop :=
  liveAlternative ctx P a b ∧
    branchFutureContents ctx P a ≠ branchFutureContents ctx P b

/-- Live alternatives whose projected-PCE values differ. -/
def pceBranchDistinctAlternative (ctx : AgencyContext α Act)
    (P : ScalarProfile α) (a b : Act) : Prop :=
  liveAlternative ctx P a b ∧
    feasibleProjectedPCE ctx P a ≠ feasibleProjectedPCE ctx P b

/-- The set of currently open alternatives, used as a Rosetta naming bridge. -/
def openAlternatives (ctx : AgencyContext α Act) (P : ScalarProfile α) : Set Act :=
  {a | a ∈ ctx.feasible P}

/-- Free-will witness: selected agency plus a live feasible alternative whose
    projected future contents differ from the selected branch. -/
structure FreeWillWitness (ctx : AgencyContext α Act) (P : ScalarProfile α) where
  /-- The selected action. -/
  selected : Act
  /-- The selected action satisfies agency selection. -/
  selected_agency : selectsFeasibleAction ctx P selected
  /-- A live alternative action. -/
  alternative : Act
  /-- The selected action and alternative are distinct feasible actions. -/
  alternative_live : liveAlternative ctx P selected alternative
  /-- The selected and alternative branches have distinct future contents. -/
  branch_distinct :
    branchFutureContents ctx P selected ≠ branchFutureContents ctx P alternative

/-- PCE-differentiated free-will witness: selected agency plus a live feasible
    alternative with a distinct projected-PCE value. This is stronger than
    branch-distinct free will. -/
structure PCEFreeWillWitness (ctx : AgencyContext α Act) (P : ScalarProfile α) where
  /-- The selected action. -/
  selected : Act
  /-- The selected action satisfies agency selection. -/
  selected_agency : selectsFeasibleAction ctx P selected
  /-- A live alternative action. -/
  alternative : Act
  /-- The selected action and alternative are distinct feasible actions. -/
  alternative_live : liveAlternative ctx P selected alternative
  /-- The selected and alternative branches have distinct projected-PCE values. -/
  pce_distinct :
    feasibleProjectedPCE ctx P selected ≠ feasibleProjectedPCE ctx P alternative

namespace FreeWillWitness

variable {ctx : AgencyContext α Act} {P : ScalarProfile α}

/-- A free-will witness implies live feasible alternatives. -/
theorem hasLiveAlternatives (w : FreeWillWitness ctx P) :
    hasLiveAlternatives ctx P :=
  ⟨w.selected, w.alternative, w.alternative_live⟩

/-- A free-will witness yields two distinct feasible actions. -/
theorem exists_distinct_feasible (w : FreeWillWitness ctx P) :
    ∃ a b, a ∈ ctx.feasible P ∧ b ∈ ctx.feasible P ∧ a ≠ b :=
  exists_distinct_feasible_of_hasLiveAlternatives ctx P w.hasLiveAlternatives

/-- A free-will witness packages a branch-distinct alternative. -/
theorem branchDistinctAlternative (w : FreeWillWitness ctx P) :
    branchDistinctAlternative ctx P w.selected w.alternative :=
  ⟨w.alternative_live, w.branch_distinct⟩

end FreeWillWitness

namespace PCEFreeWillWitness

variable {ctx : AgencyContext α Act} {P : ScalarProfile α}

/-- A PCE-differentiated free-will witness implies a PCE-differentiated
    feasible alternative in the agency layer. -/
theorem pceDifferentiatedAlternative (w : PCEFreeWillWitness ctx P) :
    pceDifferentiatedAlternative ctx P w.selected w.alternative := by
  exact ⟨w.alternative_live.1, w.alternative_live.2.1, w.pce_distinct⟩

/-- A PCE-differentiated free-will witness packages a PCE-branch-distinct
    alternative. -/
theorem pceBranchDistinctAlternative (w : PCEFreeWillWitness ctx P) :
    pceBranchDistinctAlternative ctx P w.selected w.alternative :=
  ⟨w.alternative_live, w.pce_distinct⟩

end PCEFreeWillWitness

/-- If a selected action strictly beats a feasible live alternative in
    projected PCE, then a PCE-differentiated free-will witness exists. -/
def pceFreeWillWitness_of_selected_strictly_beats
    (ctx : AgencyContext α Act) (P : ScalarProfile α) (selected alternative : Act)
    (hsel : selectsFeasibleAction ctx P selected)
    (hlive : liveAlternative ctx P selected alternative)
    (hgt : feasibleProjectedPCE ctx P alternative <
      feasibleProjectedPCE ctx P selected) :
    PCEFreeWillWitness ctx P where
  selected := selected
  selected_agency := hsel
  alternative := alternative
  alternative_live := hlive
  pce_distinct := ne_of_gt hgt

/-- If all feasible actions have equal branch future contents, then no
    branch-distinct free-will witness exists. -/
theorem no_freeWillWitness_of_all_branch_contents_equal
    (ctx : AgencyContext α Act) (P : ScalarProfile α)
    (h : ∀ a b, a ∈ ctx.feasible P → b ∈ ctx.feasible P →
      branchFutureContents ctx P a = branchFutureContents ctx P b) :
    ¬ ∃ _w : FreeWillWitness ctx P, True := by
  intro hw
  rcases hw with ⟨w, _hw_true⟩
  have h_selected : w.selected ∈ ctx.feasible P := w.selected_agency.1
  have h_alternative : w.alternative ∈ ctx.feasible P := w.alternative_live.2.1
  exact w.branch_distinct (h w.selected w.alternative h_selected h_alternative)

end TLICA.FreeWill
