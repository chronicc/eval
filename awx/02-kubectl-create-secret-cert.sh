#!/usr/bin/env bash

kubectl -n awx delete secrets awx-cert
kubectl -n awx create secret tls awx-cert --key ../ssl-ca/awx.minikube.local.key --cert ../ssl-ca/awx.minikube.local.crt

