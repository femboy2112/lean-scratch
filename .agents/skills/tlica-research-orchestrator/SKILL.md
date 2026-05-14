---
name: tlica-research-orchestrator
description: Orchestrate TLICA active mission packets by loading control docs, running preflight, routing build/audit/mapper work, and producing status reports under the repository guardrails.
---

# Skill: tlica-research-orchestrator

## Purpose

Master controller for TLICA Lean/Rosetta mission packets.

## Use when

- User says `$tlica-research-orchestrator go`.
- User asks to run the active Codex plan.
- User asks for the next formalization round.

## Required procedure

1. Read `AGENTS.md`.
2. Read `CODEX.md`.
3. Read `CLAIM_GUARDRAILS.md`.
4. Read `plans/ACTIVE_CODEX_PLAN.md`.
5. Read the active mission packet.
6. Run `scripts/bootstrap_codex.sh`.
7. Run relevant build/audit/mapper scripts.
8. Produce Markdown and JSON reports under `reports/`.

## Hard stops

Stop for author guidance if the active mission requires a new mathematical commitment not already present in the source or encoded assumptions.
