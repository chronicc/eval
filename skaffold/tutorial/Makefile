
CLUSTER_NAME := skaffold
KUBERNETES_VERSION ?= 1.25.7

cluster-create:
	minikube --kubernetes-version=v${KUBERNETES_VERSION} -p ${CLUSTER_NAME} start
	skaffold config set local-cluster true

cluster-delete:
	minikube -p ${CLUSTER_NAME} delete
