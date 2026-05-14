#!/usr/bin/env python3
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[4]
required = [ROOT / "MAPPING.md", ROOT / "docs" / "tlica_codex" / "lean_declaration_inventory.md"]
missing = [str(p.relative_to(ROOT)) for p in required if not p.exists()]
if missing:
    print("missing mapping inputs: " + ", ".join(missing), file=sys.stderr)
    raise SystemExit(1)
print("mapping inputs present")
