#!/usr/bin/env bash

kubectl -n monitoring get secrets my-prometheus-grafana -o jsonpath="{.data.admin-user}" | base64 -d; echo
kubectl -n monitoring get secrets my-prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 -d; echo
