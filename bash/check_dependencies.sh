#!/usr/bin/env bash


function print_info {
    echo -e "\e[95m[INFO]  ${1}\e[39m"
}

function print_error {
    echo -e "\e[91m[ERROR] ${1}\e[39m"
}

function check_dependencies {
    print_info "Checking required dependencies"
    dependencies=("$@")
    RC=0
    for dependency in "${dependencies[@]}"; do
        print_info "Checking for ${dependency}"
        which $dependency &>/dev/null
        if [[ $? != 0 ]]; then
            print_error "Binary for '${dependency}' not found - Please install"
            RC=1
        fi
    done
    if [[ $RC != 0 ]]; then
        print_error "There are unmet dependencies"
        exit 1
    fi
    print_info "Dependencies are okay."
}


DEPENDENCIES=(ls cp quacksalber)


check_dependencies "${DEPENDENCIES[@]}"

