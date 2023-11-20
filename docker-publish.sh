#! /bin/bash

CI_REGISTRY="dockerregistry.hsenidmobile.com:443"
DOCKER_IMAGE_DOMAIN="gsma-openapi/api-gateway"
DOCKER_USER_NAME=gsma-api-gw-docker-publish
DOCKER_PASSWORD=glpat-6nsdQbv4d2y79Rw5KzMY
docker login ${CI_REGISTRY} -u "$DOCKER_USER_NAME" -p "$DOCKER_PASSWORD"
docker push "${CI_REGISTRY}/${DOCKER_IMAGE_DOMAIN}/student-kubernetes-demo:LATEST"
