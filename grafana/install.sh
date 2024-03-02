#!/usr/bin/env bash

echo "\n>>> Adding and updating helm repos\n"
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

echo "\n>>> Updating tls certificates\n"
kubectl -n grafana delete secrets grafana-tls
kubectl -n grafana create secret tls grafana-tls --key ../ssl-ca/grafana.kubernetes.local.key --cert ../ssl-ca/grafana.kubernetes.local.crt

echo "\n>>> Installing helm charts\n"
helm upgrade --install -n grafana --create-namespace my-grafana grafana/grafana --values values.yml
