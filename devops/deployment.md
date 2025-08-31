## Steps:

- Run `devops/scripts/build_docker_images.sh` to create all needed images
- Run `devops/scripts/deploy_app_in_docker.sh` to run your application

A cleaner option would be to just copy the whl file into the deployment container instead of sending all the repo and running it with uv. This is left out as it is considered up to the CICD pipelines of your application