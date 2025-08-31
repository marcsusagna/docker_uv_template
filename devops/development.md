# Section 1: Where to develop your application

You have two options:
1. Develop directly within your dev machine
2. Develop within a Docker container

Developing within a Docker container has these pros:
- Gives you the certainty and reproducibility about your dev setup, which can then be pushed into CI stages (environment is explicilty defined in your dockerfiles)
- Avoids conflicts with other system packages you might have installed in your dev machine
- Simpler setup as only docker is needed

In short, Docker container development ensure that you don't fall into the trap "but it worked on my machine!". 

Irrespective of which option, the common development workflows of your application are defined in Section 2

## Option 1: Developing within a Docker container

### Prerequisites
- Have docker installed and running

### Steps
- Run `devops/scripts/build_docker_images.sh` to create all needed images
- Run `devops/scripts/dev_app_in_docker.sh` to open a terminal in a docker container for development. Alternatively, you can use the devcontainer extension using the definition in `.devcontainer/devcontainer.json`

You can now develop your python application as explained in section 2. Note that git will be leveraging your `~/.gitconfig` file

## Option 2: Developing on your dev machine

### Prerequisites

1. Have [uv](https://docs.astral.sh/uv/) installed. Follow its [installation guide](https://docs.astral.sh/uv/getting-started/installation/) it is recommended to install it as a global tool with pipx. 
2. If you want pyright as type checker, you will need npm and nodejs. For nodejs you'll need at least version 18, which might conflict in some old Ubuntu distributions with pre-installed system packages.
3. Install the system package `pre-commit` to be able to run lint, format and typing checks before every commit.

If you are unsure how to install these dependencies, take a look at the files `devops/dockerfiles/Dockerfile.base` and `devops/dockerfiles/Dockerfile.dev` to understand what's needed explicitly

# Section 2: Developing your python application with uv

This section is inherited from [simple-modern-uv](https://github.com/jlevy/simple-modern-uv), with some additions and clean-ups. 

## Basic Developer Workflows

The `Makefile` simply offers shortcuts to `uv` commands for developer convenience.

Make shortcuts are intended for local development, your CI pipelines should directly use the `uv` commands.

Find below set of instructions to manage project development with this template of uv

```shell
# First, install all dependencies and set up your virtual environment.
# This simply runs `uv sync --all-extras` to install all packages as well as pre-commit hooks init
# including dev dependencies and optional dependencies.
make install

# Run uv sync, lint, and test
make

# Build wheel:
make build

# Linting:
make lint

# Run tests:
make test

# Delete all the build artifacts:
make clean

# Upgrade dependencies to compatible versions:
make upgrade

# To run tests by hand:
uv run pytest   # all tests
uv run pytest -s src/module/some_file.py  # one test, showing outputs

# Build and install current dev executables, to let you use your dev copies
# as local tools:
uv tool install --editable .

# Dependency management directly with uv:
# Add a new dependency:
uv add package_name
# Add a development dependency:
uv add --dev package_name
# Update to latest compatible versions (including dependencies on git repos):
uv sync --upgrade
# Update a specific package:
uv lock --upgrade-package package_name
# Update dependencies on a package:
uv add package_name@latest

# Run a shell within the Python environment:
uv venv
source .venv/bin/activate
```
