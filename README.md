# Purpose

Starting a new python project from scratch can be tedious, as there are many components to remember (entrypoints, linting, formatting, testing, builds, virtual environments...) and making them work together requires significant effort. This template intends to give a skeleton to start a python project managed with [uv](https://docs.astral.sh/uv/). 

This template is based on [simple-modern-uv](https://github.com/jlevy/simple-modern-uv). Compared to it, this template enables you to develop your uv-managed python application within a docker container, as well as deploying it into a container. This offers the following benefits: 
- Gives you the certainty and reproducibility about your dev setup, which can then be pushed into CI stages (environment is explicilty defined in your dockerfiles)
- Avoids conflicts with other system packages you might have installed in your dev machine
- Simpler setup as only docker is needed

Developing within a docker container can be done directly by running a script or using the dev container extension of VS Code

Compared to [simple-modern-uv](https://github.com/jlevy/simple-modern-uv) there are these othere differences:

Added features:
- pre commit hooks
- using pyright instead of basedpyright
- developing the app within docker
- deploying the app, based on Astral's [UV in docker](https://github.com/astral-sh/uv-docker-example/blob/main/Dockerfile)

Some features were removed to simplify the template:
- Integration with Github Actions
- Publishing workflow
- Agents

# How to instantiate the template

1. Install uv through pipx so you have it as a global tool https://docs.astral.sh/uv/getting-started/installation/#standalone-installer
2. Install copier as a uv tool with:
```bash
uv tool install copier
```
3. Instantiate the template by running the command below, where PLACEHOLDER is the name of your new repo that will be based on the template:
```bash
copier copy gh:marcsusagna/docker_uv_template PLACEHOLDER
```
4. Follow the instructions after running copier, which can be seen in the file `copier.yml` of this repository