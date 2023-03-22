#!/usr/bin/env sh

trap "exit" HUP
trap "exit" INT
trap "exit" TERM

exec "$@"
