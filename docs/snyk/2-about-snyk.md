# About Snyk
## What is it
Snyk is a bundle of tools which helps managing vulnerabilities throughout the software development lifecycle. Currently Equinor has
licenses for Snyk Open Source and Snyk Container which helps manage vulnerabilities related to third party software either as dependencies
or as part of the base docker images your app depends on.

## Third party dependencies
All modern IT projects today pull in volumes of code from open source projects. It is not possible to read and understand this code,
and as such this becomes a legitimate application security risk. An example is the recent supply chain attack through [`colors.js`](https://snyk.io/blog/open-source-npm-packages-colors-faker/), where the maintainer simply added an infinite loop in the code resulting
in a Denial of Service to any Node.js server using it.

This is a strong argument for pinning packages to exact versions as provisioned in e.g. npm lock files, but the counter side of that
is that you need to explicitly upgrade to get the latest security patches. Given the complexity of this landscape, using
automated tools quickly becomes a requirement to keep software patched and secure.

So what can we do to mitigate this risk? The current strategy in Equinor is to automatically scan the projects using tools like Snyk.
These tools can scan code repositories continuously and on every pull request. They will find your Dockerfiles, npm package-locks,
pip requirements and many other packaging formats and check if you are currently installing a dependency with an associated
known vulnerability. They will also assist you in assessing the severity and suggesting mitigating actions.

To learn more, check out how to [get started](index.md)
