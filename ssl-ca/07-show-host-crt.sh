#!/usr/bin/env bash

COMMON_NAME=$1
if [ -z $COMMON_NAME ]
then
    echo "Usage: $0 COMMON_NAME"
    exit 1
fi

openssl x509 -text -noout -in $COMMON_NAME.crt
