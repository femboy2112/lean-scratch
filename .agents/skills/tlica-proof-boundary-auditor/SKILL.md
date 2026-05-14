---
name: tlica-proof-boundary-auditor
description: Audit TLICA theorem-status boundaries so placeholders, deferred markers, primitive fields, compatibility aliases, and substantive machine-verified theorems stay correctly classified.
---

# Skill: tlica-proof-boundary-auditor

## Purpose

Maintain the boundary between machine-verified proof, typed declaration, placeholder, deferred marker, and prose-only target.

## Use when

- Before saying a target is machine verified.
- When MAPPING/Rosetta status may be stale.
- Before closing any mission packet.

## Procedure

1. Run `python3 scripts/audit_lean_status.py`.
2. Scan `MAPPING.md` and Rosetta docs for overclaiming.
3. Compare claims against declaration inventory and latest build logs.
4. Produce Markdown/JSON audit artifacts.

## Central rule

`theorem foo : True` and `_deferred : Prop := True` are not theorem coverage.
