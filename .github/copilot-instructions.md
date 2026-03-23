# Copilot Instructions — Equinor AppSec

## Project Overview

MkDocs documentation site for Equinor Application Security guidelines. Pure documentation — no application code.

- **Stack:** MkDocs Material theme, Python 3.12+, uv package manager
- **Site URL:** <https://equinor.github.io/appsec/>
- **Repo:** <https://github.com/equinor/appsec/>

## Commands

```bash
uv sync                    # Install dependencies
uv run mkdocs serve        # Local dev server on http://localhost:8000
uv run mkdocs build        # Build static site to site/
pip install -e ".[dev]"    # Install dev tools (pre-commit, mdformat)
pre-commit install         # Set up git hooks
pre-commit run --all-files # Run formatting on all files
```

## Content & Markdown Conventions

- All documentation lives in `docs/`. Do not create files outside this directory for content.
- MkDocs uses **Python-Markdown**, which requires **4-space indentation** for nested lists (not 2-space like GitHub Flavored Markdown).
- `mdformat` with `mdformat-mkdocs` enforces this automatically via pre-commit hooks.
- Use MkDocs Material features: `admonition` blocks, `pymdownx.details` for collapsible sections, `pymdownx.emoji` for icons.
- Navigation structure is managed by `mkdocs-awesome-pages-plugin` — use `.pages` files or directory-level `index.md` for ordering.
- The `git-revision-date-localized` plugin shows last-edit dates, so CI checkouts use `fetch-depth: 0`.
- Theme overrides go in `overrides/` (custom `main.html`).

## Deployments

All three deploy automatically on push to `main`:

1. **GitHub Pages** — `uv run mkdocs gh-deploy --force` ([gh-pages.yml](.github/workflows/gh-pages.yml))
2. **Azure Static Web Apps** — builds `site/`, deploys via Azure token ([azure-static-webapp.yml](.github/workflows/azure-static-webapp.yml))
3. **Backstage TechDocs** — generates and publishes to Azure Blob Storage ([backstage-techdocs.yml](.github/workflows/backstage-techdocs.yml))

## Dev Container

- Python 3 image with Node.js LTS, port 8000 forwarded
- `post-create.sh` installs uv, dev dependencies, and pre-commit hooks
- `postStartCommand` auto-launches `uv run mkdocs serve`

## Contribution Workflow

Fork → branch → add/edit docs → commit (pre-commit auto-formats) → push → PR to `main`.
See [CONTRIBUTING.md](CONTRIBUTING.md) for full guidelines. Test links, run markdown linter, use a spell checker. Follow conventional commit messages for clarity. 
