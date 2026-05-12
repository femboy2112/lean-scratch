# Rosetta Math Schema — TLICA

The Rosetta stone has three synchronized views.

## View 1 — Philosophical/theoretical view

This uses TLICA-native language.

Template:

```markdown
### RS-XXX — Theoretical label

- Source reference:
- TLICA formulation:
- Role in architecture:
- Dependencies:
- Output or consequence:
```

## View 2 — Pure mathematical view

This must be readable without TLICA terminology.

Template:

```markdown
### M-XXX — Mathematical label

- Objects:
- Type/signature:
- Assumptions:
- Definition:
- Theorem obligations:
- Proven consequences:
```

## View 3 — Bridge view

This is the bidirectional mapping.

Template:

```markdown
### B-XXX — Bridge entry

| Field | Content |
|---|---|
| Rosetta ID | RS-XXX / M-XXX |
| TLICA referent |  |
| Pure math referent |  |
| Lean declaration(s) |  |
| Source reference |  |
| Formal status | machine_verified / signature / primitive_axiom_field / theorem_skeleton_nonimported / application_deferred |
| Proof obligations |  |
| Notes |  |
```

## Status taxonomy

| Status | Meaning |
|---|---|
| `machine_verified` | Compiles under `lake build` as imported Lean declaration. |
| `encoded_pending_compile` | Lean declaration exists but local build has not yet confirmed it. |
| `signature` | Type or structure declaration; no theorem asserted. |
| `primitive_axiom_field` | Assumption encoded as a field of a structure/typeclass. |
| `theorem_skeleton_nonimported` | Statement present outside imported build. |
| `application_deferred` | Requires application-specific calibration. |
| `open_math` | Needs working-paper-level mathematical development. |

## Naming convention

- Foundation entries: `FND-###`
- Profile-comparison entries: `PRF-###`
- Orphan-cluster entries: `ORP-###`
- Temporal phenomenology entries: `TMP-###`
- Agency entries: `AGY-###`
- Free-will entries: `FWL-###`
- Affect entries: `AFF-###`
- Religious-experience entries: `RCX-###`

## Invariant

No entry is closed unless all three views exist or the missing view has an explicit deferred/open reason.
