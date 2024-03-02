#!/usr/bin/env bash
openssl x509 -text -noout -in <(kubectl -n awx get secrets awx-cert --output jsonpath="{.data.tls\.crt}" | base64 -d)
