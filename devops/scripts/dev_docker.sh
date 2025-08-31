#!/bin/bash

PROJECT_NAME=uv_template

docker build -f devops/dockerfiles/Dockerfile.base -t example_app_base:local .
docker build -f devops/dockerfiles/Dockerfile.dev -t example_app_dev:local .

docker run --rm -it \
  -u appuser \
  -v $(pwd):/home/appuser/${PROJECT_NAME} \
  -v ~/.gitconfig:/home/appuser/.gitconfig:ro \
  -w /home/appuser/${PROJECT_NAME} \
  example_app_dev:local \
  uv sync --all-extras
