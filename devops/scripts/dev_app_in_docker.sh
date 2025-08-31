#!/bin/bash

PROJECT_NAME=uv_template

docker run --rm -it \
  -u appuser \
  -v $(pwd):/home/appuser/${PROJECT_NAME} \
  -v ~/.gitconfig:/home/appuser/.gitconfig:ro \
  -w /home/appuser/${PROJECT_NAME} \
  example_app_dev:local \
  bash -c "make install && exec bash"
