# uv_template

Please fill this README with information about your python app

# Template information

This repository has been copied from [uv_template](https://github.com/marcsusagna/uv_template) using [copier](https://copier.readthedocs.io/en/stable/), which is based on [simple-modern-uv](https://github.com/jlevy/simple-modern-uv)

The added features are:
- pre commit hooks
- using pyright instead of basedpyright
- developing the app within docker
- deploying the app, based on Astral's [UV in docker](https://github.com/astral-sh/uv-docker-example/blob/main/Dockerfile)

Some items were removed:
- Integration with Github Actions
- Publishing workflow
- Agents

## How to develop this app

Check `devops/development.md` for a comprehensive guide on how to develop your python app. It offers two possibilities:

1. Develop directly on your machine (Linux or MAC, for Windows it is based on WSL)
2. Develop within a Dockercontainer to ensure environment isolation. Integration with git and contains all needed dependencies for development (not just python ones) 

## How to deploy this app

Check `devops/development.md` for a comprehensive guide on how to deploy your python app in a Docker container. 

