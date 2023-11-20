# Pre-commit FAQ

> [Pre-commit](https://pre-commit.com/index.html) is a framework for managing and maintaining multi-language pre-commit hooks. In short it allows for a self-maintained list of checks to be performed before any commit.

## Prerequisites
Pre-commit can be installed in two ways, using Python pip or Homebrew.
- **Python**
    - Verify with `pip -V`
    - If it isn't installed download and install a newer version of Python, it should include pip as well.
- **Homebrew** (Mac/Linux)
    - Verify that brew is installed with `which brew`
    - If it isn't installed, install using `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`


## How do I install pre-commit?

- **Python**
    - `pip install pre-commit`
- **Homebrew**
	- `brew install pre-commit`

Once pre-commit is installed you need to set up the git hook scripts by running `pre-commit install`. Now pre-commit wil automatically run on git commit!


## How do I add pre-commit to my repository?
- Once pre-commit is installed you can add plugins to the `.pre-commit-config.yaml` file
    - It should be added to the root of your project.
    - https://pre-commit.com/index.html#adding-pre-commit-plugins-to-your-project
- You can also generate a basic configuration using `pre-commit sample-config`
