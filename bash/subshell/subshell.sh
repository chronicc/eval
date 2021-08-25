#!/usr/bin/env bash

env | sort -h

echo "Nonexported: ${NONEXPORTED}"
echo "Exported: ${EXPORTED}"

