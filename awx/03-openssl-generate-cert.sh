#!/usr/bin/env bash

openssl x509 -req -days 3650 -in awx.csr -signkey awx.key -out awx.crt
