#!/usr/bin/env bash
openssl req -x509 -new -out my-ca.crt -config ca.conf -days 365
