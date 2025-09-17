# Dockerfile linting

!!! Tip "Linting is a highly recommended software engineering practice. It helps ensure consistency, prevent common mistakes, and reduce manual review effort."

Linting of Dockerfiles has two targets: the Dockerfile itself and the container image. The linting will happen at different steps in the lifecycle of a container image - and both are useful!

For linting of Docker **images** we have tools like [Dockle](https://github.com/goodwithtech/dockle) (focusing on linting for Security, using parts of the [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks)). For linting of **Dockerfiles** we have tools like [Hadolint](https://github.com/hadolint/hadolint) and [Trivy](https://trivy.dev/latest/). Dockle and Hadolint are focused on linting, while Trivy has more capabilities like finding misconfigurations (IaC) and vulnerabilities (CVE) across repositories, binary artifacts, container images, and more.

Linting will be part of the development lifecycle in both the local development environment and any CI process.

For this guide, we focus on the linter Hadolint.

## Hadolint

From [hadolint](https://github.com/hadolint/hadolint):
> A smarter Dockerfile linter that helps you build [best practice](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices) Docker images. The linter parses the Dockerfile into an AST and performs rules on top of the AST. It stands on the shoulders of [ShellCheck](https://github.com/koalaman/shellcheck) to lint the Bash code inside RUN instructions.


### CI/CD

A great way to ensure that any changes being brought into your repository comply with the best practices is to add linting on pull requests as part of the code review process.

??? Note "Read more"


    Below is an example workflow that will run linting on our Dockerfiles whenever there is a pull request that contains changes to any Dockerfiles.

        name: Lint Dockerfile
        permissions:
          contents: read
        run-name: ${{ github.actor }} is running linting on Dockerfiles
        on:
          pull_request:
            branches: [main] # Limit the workflow to only run on pull requests made to the main branch
            paths:
              - "**Dockerfile" # Ensure that we trigger on any Dockerfile changes
        jobs:
          lint-docker:
            runs-on: ubuntu-latest
            steps:
              - name: Checkout code
                uses: actions/checkout@v5
              - name: Linting Dockerfiles
                uses: hadolint/hadolint-action@v3.2.0
                with:
                  failure-threshold: info # Sets the level at which the step will fail, default is info, other levels are warning and error
                  recursive: true # This enables us to check all Dockerfiles

### Run locally

In order to keep the feedback loop short and write best practice code straight out of the gate, it is a good idea to have a linter run on the code before we send it away somewhere.

#### CLI

Having the CLI available means that we can manually run linting, or even better, that we can attach it to a pre-commit hook so that it runs automatically without us having to think about it. Connecting it to a local **build** process is also a good idea.

##### In Docker

You can run the linting fully within docker:

```bash
cat Dockerfile | docker run --rm -i hadolint/hadolint
```

##### Install

On macOS you can use [brew](https://brew.sh/) to install:

```bash
brew install hadolint
```

On Windows you can use [scoop](https://github.com/lukesampson/scoop) to install:

```bash
scoop install hadolint
```

If any of these do not work, then you can refer to the [installation section](https://github.com/hadolint/hadolint?tab=readme-ov-file#install) in Hadolint's repository.

#### Pre-commit

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

