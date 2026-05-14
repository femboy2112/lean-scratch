#!/usr/bin/env python3
from pathlib import Path
ROOT = Path(__file__).resolve().parents[4]
for rel in ["TLICA/ProfileComparison/Pointwise.lean", "TLICA/ProfileComparison/ShellRefinement.lean", "tlica-lean/TLICA/ProfileComparison/Pointwise.lean", "tlica-lean/TLICA/ProfileComparison/ShellRefinement.lean"]:
    p = ROOT / rel
    if p.exists():
        text = p.read_text(encoding="utf-8", errors="replace")
        print(f"{rel}: {text.count('theorem ')} theorem declarations, {text.count('_deferred')} deferred markers")
