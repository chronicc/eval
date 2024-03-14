#!/usr/bin/env bash
# git-repository="https://github.com/vernemq/docker-vernemq"

APPLICATION=vernemq
NAMESPACE=vernemq
REPO_NAME=vernemq
REPO_URL=https://vernemq.github.io/docker-vernemq

echo -e "\n>>> Adding and updating helm repos\n"
helm repo add $REPO_NAME $REPO_URL
helm repo update

echo -e "\n>>> Installing helm charts\n"
helm upgrade \
  --create-namespace \
  --install \
  --namespace $NAMESPACE \
  --values values.yml \
  my-$APPLICATION $REPO_NAME/$APPLICATION
