#!/bin/sh
set -e

# Ensure wasm-pack target has been set
if [ -z "$WASM_PACK_TARGET" ]; then
  echo "WASM_PACK_TARGET is not set..."
  exit 1
fi

# Ensure wasm-pack input directory has been set
if [ -z "$WASM_PACK_IN_DIR" ]; then
  echo "WASM_PACK_IN_DIR is not set..."
  exit 1
fi

# Ensure wasm-pack output directory has been set
if [ -z "$WASM_PACK_OUT_DIR" ]; then
  echo "WASM_PACK_OUT_DIR is not set..."
  exit 1
fi

wasm-pack build ${WASM_PACK_IN_DIR} --release --target ${WASM_PACK_TARGET} --out-dir ${WASM_PACK_OUT_DIR}