#!/usr/bin/env bash
# devcpc build
# Usage: run-build.sh <working_dir>
set -euo pipefail

DEVCPC="${DEVCPC_BIN:-$HOME/.DevCPC/bin/devcpc}"
WORKING_DIR="${1:?Error: working_dir requerido}"

cd "$WORKING_DIR"
"$DEVCPC" build
