#!/bin/bash

DOCKER_CONTEXT=$1

if [ ! $1 ]; then
    echo "Usage: ${0} DOCKER_CONTEXT"
    kill -INT $$
fi

cat $DOCKER_CONTEXT | kubectl run kaniko \
--rm --stdin=true \
--image=gcr.io/kaniko-project/executor:latest --restart=Never \
--overrides='{
  "apiVersion": "v1",
  "spec": {
    "containers": [
      {
        "name": "kaniko",
        "image": "gcr.io/kaniko-project/executor:latest",
        "stdin": true,
        "stdinOnce": true,
        "args": [
          "--dockerfile=Dockerfile",
          "--context=tar://stdin",
          "--destination=chronicc/eval-kaniko",
          "--cache=true"
        ],
        "volumeMounts": [
          {
            "name": "docker-config",
            "mountPath": "/kaniko/.docker/"
          }
        ]
      }
    ],
    "volumes": [
      {
        "name": "docker-config",
        "secret": {
          "secretName": "docker-config"
        }
      }
    ]
  }
}'

