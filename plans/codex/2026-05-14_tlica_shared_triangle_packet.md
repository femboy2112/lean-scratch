# Mission Packet — TLICA Shared Triangle

## Mission

Audit and, if source/current definitions support it, formalize the qualified triangle inequality for `dInfShared`.

## Rationale

This target is local to profile comparison. It should not require shell-refinement or application-layer machinery. It is a good test case for proof-engineering workflow because the theorem must be stated with the correct shared-domain/bridge-domain hypotheses.

## Tasks

1. Inspect `TLICA/ProfileComparison/Pointwise.lean`.
2. Identify existing `dInfShared` theorem family.
3. Determine whether `dInfShared_triangle_of_bridge` or equivalent already exists.
4. If already machine-verified, update docs only.
5. If missing and theorem statement is source-clear, add proof.
6. If statement is not source-clear, produce author-math-required report.

## Required outputs

- `reports/<timestamp>_tlica_shared_triangle_audit.md`
- `reports/<timestamp>_tlica_shared_triangle_audit.json`

## Acceptance criteria

- No theorem statement weakening to force proof.
- No placeholder theorem counted as machine verified.
- MAPPING/Rosetta status accurately reflects result.
