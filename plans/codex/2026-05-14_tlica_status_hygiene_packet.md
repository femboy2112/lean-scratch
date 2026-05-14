# Mission Packet — TLICA Status Hygiene

## Mission

Audit and repair project-status documentation against the current successful Lean build and theorem-status evidence.

## Required reading

- `AGENTS.md`
- `CODEX.md`
- `CLAIM_GUARDRAILS.md`
- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md`
- latest `tlica-results-*/REPORT.md` files if present

## Tasks

1. Detect Lean project directory.
2. Run build/audit where possible.
3. Scan for placeholders and deferred markers.
4. Compare `MAPPING.md` and Rosetta docs against declaration inventory and build logs.
5. Patch stale status claims only.
6. Do not change theorem statements.

## Required outputs

- `reports/<timestamp>_tlica_status_hygiene_audit.md`
- `reports/<timestamp>_tlica_status_hygiene_audit.json`

## Required report content

- Lean dir used.
- Build result.
- Audit result.
- Placeholder/deferred marker inventory.
- Stale documentation claims found.
- Patches applied.
- Remaining author-math-required gaps.

## Acceptance criteria

- Build succeeds or blocker is documented.
- README/MAPPING/Rosetta no longer contradict current logs.
- Placeholder declarations are not described as proved.
- No theorem statements are changed.
