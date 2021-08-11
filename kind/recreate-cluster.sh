#!/usr/bin/env bash

CLUSTER_NAME=$(grep name: config.yaml | cut -d' ' -f2)
kind delete cluster --name $CLUSTER_NAME
kind create cluster --config config.yaml

