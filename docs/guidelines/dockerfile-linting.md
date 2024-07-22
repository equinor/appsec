# Dockerfile linting

From [hadolint](https://github.com/hadolint/hadolint):
> A smarter Dockerfile linter that helps you build [best practice](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices) Docker images. The linter parses the Dockerfile into an AST and performs rules on top of the AST. It stands on the shoulders of [ShellCheck](https://github.com/koalaman/shellcheck) to lint the Bash code inside RUN instructions.

## CI/CD

A great way to ensure that your any changes being brought into your repository complies with the best practices is to add the linting on pull requests as a part of the code review

Below is an example workflow that will run linting on our dockerfiles whenever there is a pull request that contains changes to any dockerfiles.

```yml
name: Lint Dockerfile
run-name: ${{ github.actor }} is running linting on dockerfiles
on:
  pull_request:
    branches: [main] # Limit the workflow to only run on pull requests made to the main branch
    paths:
      - "**Dockerfile" # Ensure that we trigger on any dockerfile changes
jobs:
  lint-docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Linting dockerfiles
        uses: hadolint/hadolint-action@v3.1.0
        with:
          failure-threshold: info # Sets the level in which the step will fail on, default is info, other levels are warning and error
          recursive: true # This enables us to check all dockerfiles

```

## Run locally

In order to keep the feedback loop short and write best practice code straight out of the gate it is a good idea to have a linter run on the code before we send it away somewhere.

### CLI

Having the CLI available means that we can manually run linting, or even better that we can attach it to a pre commit hook so that it is automatically without us having to think about it.

#### Install

On OSX you can use [brew](https://brew.sh/) to install:

```bash
brew install hadolint
```

On Windows you can use [scoop](https://github.com/lukesampson/scoop) to install:

```bash
scoop install hadolint
```

In any of these do not work then you can refer to the [installation section](https://github.com/hadolint/hadolint?tab=readme-ov-file#install) in hadolint's repository.

### Pre-commit

```yaml
repos:
  - repo: local
    hooks:
      - id: hadolint
        name: Lint Dockerfiles
        description: Runs hadolint to lint Dockerfiles
        language: system
        types: ['dockerfile']
        entry: hadolint
```

### VS Code

If you want to shorten the feedback loop when changing your dockerfile you can optionally add the [hadolint extension](https://github.com/michaellzc/vscode-hadolint) (Extension id: `exiasr.hadolint`)

### WebStorm

Looks like it is [not available](https://youtrack.jetbrains.com/issue/IJPL-69780/Bundle-hadolint-a-Docker-linting-tool) for WebStorm at the moment
