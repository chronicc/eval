#!/usr/bin/env bash

function check {
    ls /dev/nonexistent
    if [ $? != 0 ]; then
        :
    fi
    return $?
}

check
echo $?

