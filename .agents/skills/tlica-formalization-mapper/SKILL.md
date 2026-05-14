# Skill: tlica-formalization-mapper

## Purpose

Maintain the map from TLICA source claims to pure-math objects, Rosetta rows, and Lean declarations.

## Use when

- Lean declarations are added or removed.
- MAPPING/Rosetta docs may be stale.
- A mission ends and status documents need updating.

## Procedure

1. Refresh declaration inventory where possible.
2. Compare inventory to `MAPPING.md`.
3. Compare active Rosetta ledger to Lean declarations.
4. Classify each object using `CLAIM_GUARDRAILS.md` vocabulary.
5. Produce gap list and status patch.
