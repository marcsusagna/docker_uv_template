# Development

## Setting up your dev machine

### UV

Check uv documentation [uv](https://docs.astral.sh/uv/) to understand how it works.

Follow its [installation guide](https://docs.astral.sh/uv/getting-started/installation/). We recommend installing it as a global tool with pipx. 

### Pyright

If you want to use pyright, you'll need npm and nodejs. 

For nodejs you'll need at least version 18, which might conflict with some old Ubuntu distributions. 
Make sure you get, for instance version 20 with with:

```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | bash
apt-get install -y nodejs
```

### pre-commit 

You'll need pre-commit to use the pre-commit hooks in `.pre-commig-config.yaml`. For linux

```bash
apt-get install pre-commit
```

### Copier

## Basic Developer Workflows

The `Makefile` simply offers shortcuts to `uv` commands for developer convenience.

Make shortcuts are intended for local development, your CI pipelines should directly use the `uv` commands.

Find below set of instructions to manage project development with this template of uv

```shell
# First, install all dependencies and set up your virtual environment.
# This simply runs `uv sync --all-extras` to install all packages,
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
