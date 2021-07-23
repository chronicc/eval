#!/usr/bin/env bash

SCRIPT_PATH=$(cd $(dirname "${BASH_SOURCE[0]}") &> /dev/null && pwd)
RELATIVE_DIR=$(dirname "${BASH_SOURCE[0]}")

echo "BASH_SOURCE[0]: ${BASH_SOURCE[0]}"
echo "SCRIPT_PATH: ${SCRIPT_PATH}"
echo "RELATIVE_DIR: ${RELATIVE_DIR}"

