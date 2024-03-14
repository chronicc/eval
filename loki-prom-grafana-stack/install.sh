#!/usr/bin/env bash

echo -e "\n>>> Adding and updating helm repos\n"
helm repo add grafana https://grafana.github.io/helm-charts
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo -e "\n>>> Installing helm charts\n"
helm upgrade --install -n monitoring --create-namespace my-loki \
  grafana/loki-stack --values loki-values.yml
helm upgrade --install -n monitoring --create-namespace my-prometheus \
  prometheus-community/kube-prometheus-stack --values prometheus-values.yml

echo -e "\n>>> Updating tls certificates\n"
kubectl -n monitoring delete secrets grafana-tls
kubectl -n monitoring create secret tls grafana-tls --key ../ssl-ca/grafana.kubernetes.local.key --cert ../ssl-ca/grafana.kubernetes.local.crt

echo -e "\n>>> Installing grafana dashboards\n"
kubectl -n monitoring apply -f dashboard-loki.yml
