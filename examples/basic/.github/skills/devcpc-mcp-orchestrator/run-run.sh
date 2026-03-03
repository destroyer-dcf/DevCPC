#!/usr/bin/env bash
# devcpc run [--dsk|--cdt]
# Usage: run-run.sh <working_dir> [dsk|cdt]
set -euo pipefail

DEVCPC="${DEVCPC_BIN:-$HOME/.DevCPC/bin/devcpc}"
WORKING_DIR="${1:?Error: working_dir requerido}"
MODE="${2:-}"

ARGS=("run")
if [[ "$MODE" == "dsk" ]]; then
  ARGS+=("--dsk")
elif [[ "$MODE" == "cdt" ]]; then
  ARGS+=("--cdt")
fi

cd "$WORKING_DIR"
"$DEVCPC" "${ARGS[@]}"
