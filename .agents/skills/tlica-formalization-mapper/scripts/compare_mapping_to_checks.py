#!/usr/bin/env python3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[4]
for rel in ["MAPPING.md", "docs/tlica_codex/lean_declaration_inventory.md"]:
    path = ROOT / rel
    print(f"{rel}: {'present' if path.exists() else 'missing'}")
