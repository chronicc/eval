#!/usr/bin/env bash

echo "\n>>> Adding and updating helm repos\n"
helm repo add awx-operator https://ansible.github.io/awx-operator/
helm repo update

echo "\n>>> Updating tls certificates\n"
kubectl -n awx delete secrets awx-cert
kubectl -n awx create secret tls awx-cert --key ../ssl-ca/awx.kubernetes.local.key --cert ../ssl-ca/awx.kubernetes.local.crt

echo "\n>>> Installing helm charts\n"
helm upgrade --install -n awx --create-namespace my-awx-operator awx-operator/awx-operator --values values.yml
