#!/usr/bin/env bash

kubectl -n grafana get secrets my-grafana -o jsonpath="{.data.admin-user}" | base64 -d; echo
kubectl -n grafana get secrets my-grafana -o jsonpath="{.data.admin-password}" | base64 -d; echo
