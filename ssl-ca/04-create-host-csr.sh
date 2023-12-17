#!/usr/bin/env bash

COMMON_NAME=$1
if [ -z $COMMON_NAME ]
then
    echo "Usage: $0 COMMON_NAME"
    exit 1
fi

openssl genrsa -out $COMMON_NAME.key 4096
openssl req -new -subj "/C=DE/O=chronicc/CN=$COMMON_NAME" -config host.conf -key $COMMON_NAME.key -out $COMMON_NAME.csr -addext "subjectAltName = DNS.1:$COMMON_NAME,DNS.2:www.$COMMON_NAME"
