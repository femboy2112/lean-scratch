#!/usr/bin/env python3
from pathlib import Path
from datetime import datetime, timezone
ROOT = Path(__file__).resolve().parents[4]
reports = ROOT / "reports"
reports.mkdir(exist_ok=True)
ts = datetime.now(timezone.utc).strftime("%Y%m%d-%H%M%S")
content = """# Shell Refinement Plan Scaffold

1. Separate scalar, shared-domain, and union-domain shell claims.
2. Identify source conventions for shell indices and endpoints.
3. State exact zero-extension hypotheses before union-domain proofs.
4. Label deferred markers as non-theorems.
5. Update MAPPING and Rosetta status after any Lean changes.
"""
(reports / f"{ts}_shell_refinement_plan.md").write_text(content, encoding="utf-8")
print("wrote shell refinement plan scaffold")
