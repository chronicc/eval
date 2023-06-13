start: cluster-start skaffold-deploy
stop: skaffold-delete cluster-stop
update: skaffold-deploy

cluster-start:
	minikube start

cluster-stop:
	minikube delete

skaffold-deploy:
	skaffold deploy

skaffold-delete:
	skaffold delete
