#!/usr/bin/env bash

function print_info {
    echo -e "\e[95m[INFO]  ${1}\e[39m"
}

function print_error {
    echo -e "\e[91m[ERROR] ${1}\e[39m"
}

print_info "What you should know."
print_error "Something failed."

