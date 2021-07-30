#!/usr/bin/env bash

function check {
    ls /dev/nonexistent
    if [ $? != 0 ]; then
        ls /dev/nonexistent
    fi
    return $?
}

check
echo $?

