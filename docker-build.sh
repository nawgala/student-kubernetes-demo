#! /bin/bash

#GIT_TAG=$(git describe)
GIT_TAG=0.0.1
#TAG=$(git rev-parse HEAD)
#mvn clean install -DskipTests
./mvnw clean install -DskipTests -Dmaven.javadoc.skip=true -B -V

java -Djarmode=layertools -jar target/*.jar extract --destination target/extracted

docker build -t student-kubernetes-demo:LATEST .
CI_REGISTRY="dockerregistry.hsenidmobile.com:443"
DOCKER_IMAGE_DOMAIN="gsma-openapi/api-gateway"

docker build -t ${CI_REGISTRY}/${DOCKER_IMAGE_DOMAIN}/student-kubernetes-demo:LATEST .