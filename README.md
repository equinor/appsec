[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/equinor/appsec)

# Equinor AppSec public site

This repo contains the documentation and setup for hosting https://equinor.github.io/appsec/

## Development
To start the project locally, install the following plugins
1. [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/getting-started/)  
1. [Awesome-Pages for MkDocs](https://github.com/lukasgeiter/mkdocs-awesome-pages-plugin)   

To start the project, simply run:
```
mkdocs serve
```
and the server will start on `localhost:8000`.

.. or use e.g. Gitpod by click the Gitpod image/link above.

### Adding content
To add content add markdown inside the `docs` folder, and link
it from the rest of the site.


### Runbook
A runbook of how the site is deployed and maintained can be found in [Runbook](./runbook.md).

## How to contribute

Read our [contribute.md](CONTRIBUTING.md)
