# Codex Prompt — Commit and Push Branch

Before pushing, run:

```bash
lake build
bash scripts/audit_lean.sh
python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md
git status --short
```

Ensure `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md` has exactly these sections:

1. Build status.
2. Files changed.
3. Lean declarations added/modified.
4. Rosetta entries added/modified.
5. Open mathematical issues requiring user/ChatGPT review.

Then commit and push:

```bash
git add .
git commit -m "Advance TLICA math-first Lean Rosetta"
git push -u origin codex/tlica-math-rosetta-v0
```

If build is not green, commit only if the branch clearly separates build-safe imported modules from non-imported TODO files and the verification report explains the remaining failure.
