# Contestable Boundary Audit

Scope: source and Lean-readiness audit for `IBoundary.boundary` and
`contestableBoundary`.

## Current Lean Status

Current imported Lean declarations:

- `boundary`: defined as `positiveContents ∪ negativeContents`.
- `boundary_excludes_neutral`
- `cogito_in_boundary`
- `mem_boundary_iff`
- `boundary_not_neutral`
- `contestableBoundary`: currently a naming stub equal to `boundary`.

This means current Lean formalizes the broad non-neutral PtCns boundary, not a
refined contestability theory.

## Source Evidence

The orphan-cluster working paper gives two candidate characterizations:

- Candidate 9.2.2: PtCns-sensitive boundary, where small perturbations of the
  I's frame can swing evaluation across the `-1 / 0 / +1` partition.
- Candidate 9.2.3: Mode A / Mode C duality boundary, where PtCns is in
  `{-1,+1}` and the assignment is contestable.

It also states:

- The cogito is interior to the I, not at the refined boundary edge.
- The strict not-I region is disjoint from the boundary; boundary contents have
  nonzero rho.
- Boundary stability over time is an open application-calibration question.

The current Lean file explicitly notes that a refined boundary excluding
interior positive and interior negative contents would require additional
structure.

## Classification

| Question | Classification | Notes |
|---|---|---|
| Is broad boundary non-neutral PtCns? | Lean-inferred / foundation default | Current Lean uses positive-or-negative evaluation and proves non-neutrality. |
| Is contestable boundary the same as non-neutral boundary? | ambiguous | Current `contestableBoundary = boundary` is a stub, not a source-final claim. |
| Is contestability overlap between positive and negative evaluability? | source-suggested | Candidate 9.2.3 points toward Mode A / Mode C dual candidacy, but no formal overlap predicate exists. |
| Is contestability contents whose PtCns class can change under projection? | source-suggested | Candidate 9.2.2 mentions perturbation sensitivity, but no perturbation model is formalized. |
| Is contestability unstable evaluation over time? | source-suggested / application-level | `app:boundary-stability` remains open in the working paper. |
| Should new Lean theory be added now? | not Lean-ready | Needs a formal perturbation, dual-candidacy, or temporal-instability predicate. |

## Future Theorem Targets

Lean-ready only after source refinement:

- `contestableBoundary_subset_boundary`
- `cogito_not_mem_contestableBoundary`
- `strictNotI_disjoint_contestableBoundary`
- `contestableBoundary_of_ptcns_sensitive`
- `contestableBoundary_of_modeA_modeC_dual_candidate`

Recommended next source task: choose whether contestability is primarily
perturbation sensitivity, Mode A / Mode C dual candidacy, projection-induced
class change, temporal instability, or a layered structure with these as
separate predicates.
