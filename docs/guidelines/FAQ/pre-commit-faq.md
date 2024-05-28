# Pre-commit

> [Pre-commit](https://pre-commit.com/index.html) is a framework for managing and maintaining multi-language pre-commit hooks. In short it allows for a self-maintained list of checks to be performed before any commit.

## How do I install pre-commit?

### Prerequisites

Pre-commit can be installed in two ways, using Python pip or Homebrew.

#### Python

- Verify that pip is installed with `pip -V`.
- If it isn't installed download and install a newer version of Python, it should include pip as well.

#### Homebrew (Mac/Linux)

- Verify that brew is installed with `brew -v`
- If it isn't installed, install using `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`</br>(As usual, verify all install scripts before executing)
- Remember to perform the next steps that are shown after install.

### Installing pre-commit

| Python | Homebrew |
|---|---|
| `pip install pre-commit` | `brew install pre-commit` |

Once pre-commit is installed you need to manually add it to PATH (user variables). 
Set up the git hook scripts by running `pre-commit install`. Now pre-commit wil automatically run on git commit!

## How do I add pre-commit to my repository?

- Once pre-commit is installed you can add plugins to the `.pre-commit-config.yaml` file
- The config file should be added to the root of your project.
- More guides can be found on the [pre-commit website](https://pre-commit.com/index.html#adding-pre-commit-plugins-to-your-project)
- You can also generate a basic configuration using `pre-commit sample-config`

## Do I need to setup pre-commit for each repository?

Yes.

Each repository that uses pre-commit needs to have the `.pre-commit-config.yaml` file.
