/-
TLICA.ProfileComparison.PseudoEMetric — PseudoEMetricSpace instance for dInfUnion.

This module promotes `dInfUnion` from a freestanding function with proven
properties (round 3) to a formal `PseudoEMetricSpace` structure on a wrapper
type around `ScalarProfile`. This lets downstream consumers use mathlib's
topology API (`EMetric.ball`, `Cauchy`, etc.) directly on profile distances.

The structure: define a wrapper type `ProfileSpace α` that is essentially
`ScalarProfile α` with a `Dist`-flavored instance bundle, then provide the
`PseudoEMetricSpace` instance whose distance function is `dInfUnion`.

Reference: round-3 lemmas `dInfUnion_self`, `dInfUnion_symm`,
`dInfUnion_triangle` (in `TLICA.ProfileComparison.Pointwise`).
-/

import TLICA.ProfileComparison.Pointwise
import Mathlib.Topology.EMetricSpace.Basic

namespace TLICA.ProfileComparison.PseudoEMetric

open TLICA.Profile TLICA.ProfileComparison.Pointwise
open scoped ENNReal

variable {α : Type*}

/-- The space of scalar profiles on a universal content type α, equipped
    with the union-form L^∞ distance.

    A pseudo-emetric space (not a metric space): two distinct profiles
    that happen to extend to the same zero-extended function will have
    distance zero. -/
def ProfileSpace (α : Type*) : Type _ := ScalarProfile α

noncomputable instance : EDist (ProfileSpace α) where
  edist := dInfUnion

theorem edist_def (f g : ProfileSpace α) : 
    edist f g = dInfUnion f g := rfl

/-- Named bridge from the profile-space `edist` notation to the union-form
    profile distance. This is an API convenience theorem, not a new distance
    definition. -/
theorem edist_eq_dInfUnion (f g : ProfileSpace α) :
    edist f g = dInfUnion f g := rfl

/-- The `PseudoEMetricSpace` instance assembled from round-3 lemmas. -/
noncomputable instance : PseudoEMetricSpace (ProfileSpace α) where
  edist := dInfUnion
  edist_self f := dInfUnion_self f
  edist_comm f g := dInfUnion_symm f g
  edist_triangle f g h := dInfUnion_triangle f g h

/-- Reflexivity of profile-space `edist`, specialized to the TLICA wrapper. -/
theorem edist_self_profile (f : ProfileSpace α) : edist f f = 0 :=
  dInfUnion_self f

/-- Symmetry of profile-space `edist`, specialized to the TLICA wrapper. -/
theorem edist_symm_profile (f g : ProfileSpace α) :
    edist f g = edist g f :=
  dInfUnion_symm f g

/-- Triangle inequality for profile-space `edist`, specialized to the TLICA
    wrapper. -/
theorem edist_triangle_profile (f g h : ProfileSpace α) :
    edist f h ≤ edist f g + edist g h :=
  dInfUnion_triangle f g h

/-- The profile-space `edist` is bounded by `1`, inherited from the union-form
    distance over bounded scalar profiles. -/
theorem edist_le_one_profile (f g : ProfileSpace α) :
    edist f g ≤ 1 :=
  dInfUnion_le_one f g

/-- Membership in an emetric ball around a profile, unfolded to the
    union-form profile distance. -/
theorem mem_emetric_ball_iff_dInfUnion_lt
    (f g : ProfileSpace α) (r : ℝ≥0∞) :
    g ∈ EMetric.ball f r ↔ dInfUnion f g < r := by
  rw [EMetric.mem_ball']
  simp [edist_eq_dInfUnion]

end TLICA.ProfileComparison.PseudoEMetric
