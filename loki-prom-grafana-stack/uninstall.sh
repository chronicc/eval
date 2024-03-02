#!/usr/bin/env bash

echo "\n>>> Uninstalling helm charts\n"
helm uninstall -n monitoring my-loki
helm uninstall -n monitoring my-prometheus

echo "\n>>> Removing namespace\n"
kubectl delete ns monitoring
