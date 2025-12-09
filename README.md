# Equinor AppSec public site

This repo contains the documentation and setup for hosting <https://equinor.github.io/appsec/>

## Development

### Prerequisites

This project uses [uv](https://docs.astral.sh/uv/) for dependency management. If you don't have `uv` installed, follow [the offical installation guides](https://docs.astral.sh/uv/getting-started/installation/).

### Setup
Install the dependencies using

```bash
uv sync
```

To start the project, simply run:

```bash
uv run mkdocs serve
```

and the server will start on `localhost:8000`.

Alternatively, you can activate the virtual environment and run mkdocs directly:
```bash
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
mkdocs serve
```

### Adding content

To add content add markdown inside the `docs` folder, and link
it from the rest of the site.

### Runbook

A runbook of how the site is deployed and maintained can be found in [Runbook](./runbook.md).

## How to contribute

Read our [contribute.md](CONTRIBUTING.md)
