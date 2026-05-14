# Skill: tlica-profile-comparison-lab

## Purpose

Mathematical lab for TLICA profile comparison, shell refinement, and distance theorems.

## Use when

- Planning `dInfUnion` / `dInfShared` theorems.
- Auditing shell-bound hypotheses.
- Decomposing shell-refinement obligations.
- Checking whether a proposed profile-distance theorem is source-faithful.

## Procedure

1. Inspect `TLICA/ProfileComparison/Pointwise.lean` and `ShellRefinement.lean`.
2. Separate scalar, shared-domain, and union-domain claims.
3. State exact hypotheses before proof work.
4. Do not claim a union-domain result from shared-domain hypotheses.
5. Produce proof-obligation report if theorem shape is uncertain.
