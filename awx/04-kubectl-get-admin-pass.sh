#!/usr/bin/env bash

kubectl -n awx get secrets awx-admin-password -o jsonpath="{.data.password}" | base64 -d; echo
