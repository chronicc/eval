#!/usr/bin/env bash

openssl req -out awx.csr -newkey rsa:4096 --sha512 -nodes -keyout awx.key -config awx-openssl.conf


