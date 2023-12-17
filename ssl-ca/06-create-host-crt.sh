#!/usr/bin/env bash

COMMON_NAME=$1
if [ -z $COMMON_NAME ]
then
    echo "Usage: $0 COMMON_NAME"
    exit 1
fi

openssl x509 -req -in $COMMON_NAME.csr -CA my-ca.crt -CAkey my-ca.key -CAcreateserial -out $COMMON_NAME.crt -copy_extensions copyall
