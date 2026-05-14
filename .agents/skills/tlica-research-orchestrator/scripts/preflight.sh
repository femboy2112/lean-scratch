#!/usr/bin/env bash
set -euo pipefail
bash scripts/bootstrap_codex.sh
python3 scripts/summarize_tlica_state.py
