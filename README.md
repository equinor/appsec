# Equinor AppSec public site

This repo contains the documentation and setup for hosting https://equinor.github.io/appsec/

## Development
To start the project locally [Jekyll](https://jekyllrb.com/docs/installation/)
needs to be installed.

To start the project, simply run:
```
bundle exec jekyll serve
```
and the server will start on `localhost:4000`. If any plugins is added to the
project, they can be installed with `bundle install`.

### Adding content
To add content add markdown or html pages at the preferred location, and link
it from the rest of the site.

To add a new header page, this can bee appended in the `_config.yml` file.
