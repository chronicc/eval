#!/usr/bin/env bash

echo "\n>>> Uninstalling helm charts\n"
helm uninstall -n awx my-awx-operator

echo "\n>>> Removing namespace\n"
kubectl delete ns awx
