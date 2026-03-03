#!/usr/bin/env bash
# devcpc new <project_name> [--template=<template>]
# Usage: run-new.sh <project_name> [8bp|asm|basic] [working_dir]
set -euo pipefail

DEVCPC="${DEVCPC_BIN:-$HOME/.DevCPC/bin/devcpc}"
PROJECT_NAME="${1:?Error: project_name requerido}"
TEMPLATE="${2:-8bp}"
WORKING_DIR="${3:-$PWD}"

ARGS=("new" "$PROJECT_NAME")
if [[ "$TEMPLATE" != "8bp" ]]; then
  ARGS+=("--template=$TEMPLATE")
fi

cd "$WORKING_DIR"
"$DEVCPC" "${ARGS[@]}"
