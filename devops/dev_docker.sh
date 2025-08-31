#!/bin/bash
docker build -f devops/Dockerfile.dev -t example_app_dev:local .

docker run --rm -it \
  example_app_dev:local
