.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo ""
	@echo "Usage: make TARGET"
	@echo ""
	@echo "Targets"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: start
start: ## Start the k8s cluster
	./k8s-start-cluster.sh

.PHONY: stop
stop: ## Stop the k8s cluster
	./k8s-stop-cluster.sh

.PHONY: delete
delete: ## Delete the k8s cluster
	./k8s-delete-cluster.sh
