
CLUSTER_NAME := skaffold
KUBERNETES_VERSION ?= 1.25.7

.PHONY: build build-backend build-frontend cluster-create cluster-delete

build: build-backend build-frontend

build-backend:
	docker build -t transposer-backend backend

build-frontend:
	docker build -t transposer-frontend frontend

cluster-create:
	minikube --kubernetes-version=v${KUBERNETES_VERSION} -p ${CLUSTER_NAME} --addons ingress start
	skaffold config set local-cluster true

cluster-delete:
	minikube -p ${CLUSTER_NAME} delete
