# CLAIM_GUARDRAILS.md — TLICA Theorem-Status Guardrails

## Central rule

A Lean declaration is not automatically a completed formalization target merely because it type-checks.

A declaration whose proposition is `True`, or whose body is intentionally vacuous, must be labelled:

```text
statement_placeholder
```

or:

```text
deferred_marker_not_theorem
```

It must not be labelled `machine_verified_theorem`.

## Status labels

Use these labels exactly:

| Label | Meaning |
|---|---|
| `machine_verified_theorem` | Lean theorem with substantive proposition and proof body in imported build. |
| `machine_verified_definition` | Lean definition/abbrev/inductive declaration that compiles. |
| `machine_verified_structure` | Lean structure/class declaration that compiles. |
| `primitive_structure_field` | Assumption carried as a structure/typeclass field. |
| `compatibility_alias` | Name retained for API/backward compatibility, not a new primitive. |
| `compatibility_theorem` | Theorem equating compatibility API to primary API. |
| `statement_placeholder` | Typed statement placeholder, often `: True`; not theorem coverage. |
| `deferred_marker_not_theorem` | Explicit `_deferred : Prop := True` marker. |
| `application_deferred` | Application target intentionally not formalized. |
| `prose_only_unformalized` | Source/prose concept with no Lean declaration. |
| `author_math_required` | Requires source/theory clarification before Lean. |
| `deprecated_or_superseded` | Historical name/status superseded by newer architecture. |

## Red flags

Audit and report any of the following:

- `sorry`
- `admit`
- `axiom`
- theorem statement exactly `True`
- `by trivial` attached to a claimed theorem target
- `_deferred : Prop := True`
- stale docs saying “awaiting compile” when logs/build show success
- stale docs saying “proved” when only a structure/placeholder exists
- compatibility names described as primitive
- RCX described as Lean-formalized

## Allowed primitives

A primitive claim is acceptable only if it appears as:

- named structure field;
- named class field;
- explicit documented axiom schema in prose, not global Lean `axiom`;
- active mission explicitly authorizes it.

## TLICA-specific protected deferrals

Do not formalize without explicit new source refinement:

- religiously charged experience / RCX;
- named affect taxonomy;
- love as constitutive extension;
- substrate affect pathways;
- source-opacity affect;
- stochastic projection;
- phenomenological duration;
- contestable-boundary theory.
