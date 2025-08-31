#!/bin/bash

PROJECT_NAME=uv_template

docker build -f devops/Dockerfile.base -t example_app_base:local .
docker build -f devops/Dockerfile.deploy -t example_app_deploy:local .

docker run --rm -it \
  -u appuser \
  -w /home/appuser/${PROJECT_NAME} \
  example_app_deploy:local
