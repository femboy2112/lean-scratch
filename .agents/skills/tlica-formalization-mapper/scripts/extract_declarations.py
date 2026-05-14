#!/usr/bin/env python3
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[4]
SCRIPT = ROOT / "scripts" / "extract_lean_decls.py"
OUT = ROOT / "docs" / "tlica_codex" / "lean_declaration_inventory.md"

if not SCRIPT.exists():
    print("extract_lean_decls.py not found; cannot refresh inventory", file=sys.stderr)
    raise SystemExit(1)
OUT.parent.mkdir(parents=True, exist_ok=True)
with OUT.open("w", encoding="utf-8") as f:
    proc = subprocess.run(["python3", str(SCRIPT)], cwd=ROOT, stdout=f, text=True)
raise SystemExit(proc.returncode)
