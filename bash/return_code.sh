#!/usr/bin/env bash

function check {
    ls /dev/nonexistent
    if [ $? != 0 ]; then
        echo "Return value is not 0"
        ls /dev/nonexistent
    fi
    return $?
}

check
echo $?

