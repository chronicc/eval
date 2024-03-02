#!/usr/bin/env bash

echo "\n>>> Uninstalling helm charts\n"
helm uninstall -n monitoring my-grafana

echo "\n>>> Removing namespace\n"
kubectl delete ns monitoring
