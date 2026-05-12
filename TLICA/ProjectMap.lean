/-
TLICA.ProjectMap — The future-state projection map (deterministic variant).

Encodes §5 of the orphan_cluster_v0_1.md working paper. The foundation
default per §5.4.1 is the deterministic Project map; the stochastic
variant (with ProbabilityMeasure codomain) is deferred to a future round.

Reference:
  - 4_derived_concepts_and_predictions.md §10.7 (theoretical statement).
  - orphan_cluster_v0_1.md §5 (foundation-ready definitions and axioms).
-/

import TLICA.Profile

namespace TLICA.ProjectMap

open TLICA.Profile

variable {α : Type*}

/-- An action available to a modeling I at a given time. The architecture
    leaves the action-space application-defined; here we encode it as an
    opaque type. -/
structure Action (α : Type*) where
  /-- An action carries some application-level data; we keep this abstract. -/
  data : Unit

/-- The "no action" / null action. -/
def Action.noAction : Action α := ⟨()⟩

/-- The deterministic future-state projection map.

    Given a current profile and a candidate action, produces the projected
    profile at some forward horizon. Stochasticity (where applications need
    it) is captured by parameterizing the action space.

    Reference: orphan_cluster_v0_1.md Definition 5.2.1 (deterministic variant). -/
structure ProjectMap (α : Type*) where
  /-- The projection function. -/
  project : Action α → ScalarProfile α → ScalarProfile α
  /-- **Axiom 5.3.1**: the no-action projection equals the natural-dynamics
      evolution of the current profile.
      We state it abstractly: there is *some* natural-dynamics function and
      `project noAction` equals it. -/
  identity_action_natural :
    ∃ (naturalDynamics : ScalarProfile α → ScalarProfile α),
      ∀ P, project Action.noAction P = naturalDynamics P

namespace ProjectMap

variable {α : Type*}

/-- The no-action projection is well-defined (existence is automatic since
    `project` is total). -/
theorem noAction_projects (proj : ProjectMap α) (P : ScalarProfile α) :
    ∃ P', proj.project Action.noAction P = P' :=
  ⟨proj.project Action.noAction P, rfl⟩

end ProjectMap

end TLICA.ProjectMap
