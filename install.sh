#!/usr/bin/env bash
# install.sh — One-shot environment setup for the TLICA Lean project on
# Linux Mint / Ubuntu. Installs:
#   * the apt packages needed by Lean's build pipeline (curl, git, zstd,
#     build-essential),
#   * elan (the Lean version manager) via the official installer,
#   * the leanprover/lean4:v4.11.0 toolchain pinned by the project.
#
# Run once after cloning the repo. Idempotent — safe to re-run.

set -euo pipefail

echo "[1/3] Installing system packages (apt)…"
sudo apt-get update
sudo apt-get install -y \
    curl git ca-certificates build-essential \
    zstd unzip

echo "[2/3] Installing elan (Lean version manager)…"
if ! command -v elan >/dev/null 2>&1 && [ ! -x "$HOME/.elan/bin/elan" ]; then
    curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh \
        | sh -s -- -y --default-toolchain none
fi

export PATH="$HOME/.elan/bin:$PATH"

# Add elan to .profile if not already there
if ! grep -q '.elan/bin' "$HOME/.profile" 2>/dev/null; then
    echo 'export PATH="$HOME/.elan/bin:$PATH"' >> "$HOME/.profile"
    echo "  added ~/.elan/bin to PATH in ~/.profile"
fi

echo "[3/3] Installing Lean 4.11.0 toolchain…"
elan toolchain install leanprover/lean4:v4.11.0

echo ""
echo "── Verification ──"
"$HOME/.elan/bin/lean" --version
"$HOME/.elan/bin/lake" --version

echo ""
echo "Setup complete. To pick up PATH changes in this shell, run:"
echo "    source ~/.profile"
echo "Then run ./run.sh to build and verify the project."
