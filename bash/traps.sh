#!/usr/bin/env bash

cleanup() {
    echo "Script is exiting, cleaning up..."
    rm -f /tmp/traps.lock
}

trap "exit" HUP INT TERM
trap cleanup EXIT

touch /tmp/traps.lock

while true;
do
    ls -l /tmp/traps.lock
    sleep 1
done
