# TLICA Lean Proof Discipline

## Formalization levels

Every entry in the Lean/Rosetta system must be marked with exactly one status:

| Status | Meaning |
|---|---|
| `machine_verified` | Imported Lean theorem/definition compiles under `lake build`. |
| `encoded_pending_compile` | Lean code exists but has not yet passed the current local build. |
| `signature` | Type/structure declaration only; no theorem claimed. |
| `primitive_axiom_field` | Encoded as a field of a structure/typeclass because TLICA treats it as primitive. |
| `theorem_skeleton_nonimported` | Statement exists outside the imported build pending proof. |
| `application_deferred` | Requires application-specific calibration or empirical content. |
| `rejected_or_recast` | Earlier formulation was mathematically invalid and has been replaced. |

## Axioms versus proofs

Axioms are acceptable only when they are explicit TLICA commitments or calibration parameters. Prefer:

```lean
structure SomeTLICAStructure where
  carrier : Type u
  primitive_property : ...
```

Do not use global Lean `axiom` unless there is no better structure/typeclass encoding and the justification is documented in `MAPPING.md`.

## Rosetta invariant

For each Lean declaration, maintain:

```text
Lean declaration → pure math referent → TLICA referent → source reference → proof status
```

For each TLICA primitive, maintain:

```text
TLICA primitive → pure math object → Lean declaration or deferred status → proof obligations
```

## Build invariant

The top-level import file `TLICA.lean` should import only build-safe modules. Hard theorem statements can live in non-imported files under `TLICA/TODO/` until proved.
