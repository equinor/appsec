# Equinor AppSec public site

This repo contains the documentation and setup for hosting https://equinor.github.io/appsec/

## Development
To start the project locally [Jekyll](https://jekyllrb.com/docs/installation/)
needs to be installed.

To start the project, simply run:
```
bundle install
bundle exec jekyll serve
```
and the server will start on `localhost:4000`. If any plugins is added to the
project, they can be installed with `bundle install`.

### Ruby > 2.7
Github uses Ruby 2.7 when building the pages, and therefore recommend using that for
development. Most recent systems have a newer version of Ruby. To develop on these,
either
* Use the `.devcontainer` setup with VSCode, which has Ruby 2.7 pre-installed, or
* `bundle install webrick` installs the missing `webrick` package on Ruby >= 3.0

### Check for dead links
To check the site for dead links, run
```
bundle exec rake test
```

### Adding content
To add content add markdown or html pages at the preferred location, and link
it from the rest of the site.

To add a new header page, this can bee appended in the `_config.yml` file.
