#!/usr/bin/env bash

helm upgrade --install -n awx --create-namespace my-awx-operator awx-operator/awx-operator -f awx-operator-values.yml
