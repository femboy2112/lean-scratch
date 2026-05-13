# Codex Prompt — Rosetta Math Ledger Construction

Construct the math-first Rosetta ledger. Use `docs/tlica_rosetta/ROSETTA_MATH_SCHEMA.md` as the schema.

For every entry in `MAPPING.md` and every high-priority item in `docs/tlica_rosetta/rosetta_stone_v0_2.md`, create or update an entry with:

- Rosetta ID.
- TLICA referent.
- Pure mathematical referent.
- Lean declaration(s).
- Source reference.
- Formal status.
- Proof obligations.
- Dependencies.

Prioritize foundation and profile/orphan-cluster entries before application entries.

Do not mark an entry closed merely because it is named in prose. It is closed only if it has a mathematical object and a Lean status.
