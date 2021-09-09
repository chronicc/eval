#!/usr/bin/env bash

(return 0 2>/dev/null) && sourced=1 || sourced=0

echo "Sourced: ${sourced}"

