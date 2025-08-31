#!/bin/bash

docker build -f devops/dockerfiles/Dockerfile.base -t example_app_base:local .
docker build -f devops/dockerfiles/Dockerfile.dev -t example_app_dev:local .
docker build -f devops/dockerfiles/Dockerfile.deploy -t example_app_deploy:local .