#!/bin/bash

PROJECT_NAME=uv_template

docker run --rm -it \
  -u appuser \
  -w /home/appuser/${PROJECT_NAME} \
  example_app_deploy:local
