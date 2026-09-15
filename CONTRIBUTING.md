# How to contribute to the AppSec site

We welcome pull requests to any parts of this repository. Help us make this site a great one!

## Creating a pull request

To update existing content, fix issues, suggest new content etc - use a PR

Procedure:

- Fork the repository
- Create a new branch on you fork
- Add the suggested changes
- Commit changes and push to your fork
- Create a pull request (PR) from you fork to github.com/equinor/appsec/ main branch

## Markdown formatting

With [uv](https://docs.astral.sh/uv/getting-started/installation/) installed, set up the locked development tools and commit hook from the repository root:

```bash
uv sync --locked --extra dev
uv run --locked --extra dev pre-commit install
```

The dev container runs these steps automatically. The hook formats Markdown under `docs/` with mdformat and its MkDocs plugin, including the four-space nested-list indentation required by Python-Markdown. If a commit stops because the hook changed files, review and stage the formatting changes, then commit again.

To format all documentation or check it without changing files:

```bash
uv run --locked --extra dev pre-commit run --all-files
uv run --locked --extra dev mdformat --check docs
```

Keep the mdformat and mdformat-mkdocs versions in `.pre-commit-config.yaml` and `pyproject.toml` aligned when updating them, and regenerate `uv.lock` with `uv lock`.

## Creating an issue

If you spot problems or would like a discussion, create a issue describing your observations.

## Conventions - guides

- Remember, this is a public site!
- Don't be an asshole - be polite and respect people
- Test any links that you add or change
- For markdown, running a markdown linter is smart
- Why not use a spell checker as well?
