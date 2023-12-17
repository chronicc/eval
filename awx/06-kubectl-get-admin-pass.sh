#!/usr/bin/env bash

kubectl -n awx get secrets awx-demo-admin-password -o jsonpath="{.data.password}" | base64 -d; echo
