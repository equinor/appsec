# Security Screening Open Source packages

How can we determine if an open source package is "safe to use"? This is a question we get quite often. Package in this context is any open source library, package, module or similar.

??? Note "Read more"

    Safe to use" could mean a few things. We typically want to ensure that the projects that we consume have a good reputation, are reliable and don't contain any vulnerabilities. We want to reduce supply-chain risk, handle license risk and reduce operational drag.

    There is no such thing as 100% secure. Remember that packages are source code and dynamic - status is not static. Transitive dependencies are a thing - a package usually consumes other packages as well. It's a potentially fragile eco system. Having good AppSec and Software Engineering hygiene is vital.

!!! Warning "Your development environment requires vigilance"

    Development environments often run with elevated privileges and hold sensitive data (tokens, keys, configs). Treat them as high‑value targets.

    Be cautious with package installs and scripts: review sources and prefer isolated containers/VMs/Codespaces for untrusted code. Avoid exposing real secrets in your local env.


!!! Info "TL;DR"

    - Vet project health: multiple maintainers, recent releases, tests/docs, transparent governance, signed/provenanced releases.
    - Check reputation signals: author/org, forks/usage (stars weak), Snyk Advisor/OpenHub, OpenSSF Scorecard.
    - Scan continuously: Dependabot plus ecosystem audits (npm audit, pip-audit).
    - Update deliberately: apply critical patches fast; otherwise wait ~1 week before bumping—avoid blind auto-updates.
    - Explore safely: read source/install scripts; test in isolated containers/VMs/Codespaces; watch for common supply-chain attacks.
# Signal intelligence

??? Info "Signals that can give an indication of an open source project's vitality and security risk"

    - Author / project reputation
    - Number of maintainers, should be more than one
    - Stars on Github (not a strong security signal)
    - Number of clones and forks
    - Transparency (README.md, CONTRIBUTING.md, SECURITY.md, changelog, community, ++)
    - Code and release frequency, time since last update and release, should not be older than 12 months.
    - Quality signals like tests and reasonable documentation
    - Issue and PR handling
    - License
    - Automation, CI/CD
    - Provenance, code signing, release signing, trusted registry
    - Known vulnerabilities - time to resolution
    - Number of dependencies
    - (Does the project provide a SBOM (not just dependency lock files))
    - (Look for OpenSSF Scorecard)
    - (Examining the source code ...)
  

## 3rd party tools to check package health:

Some 3rd party tools can give an idea about project health:

- [Snyk Advisor](https://snyk.io/advisor/)
- [Blackduck Open Hub](https://openhub.net/)

## SCA Scanners (Software Composition Analysis)

??? Note "Use these to (continuously) scan packages for known vulnerabilities"

    When screening packages, you could consider downloading them (not installing and do a SCA scan)

    - Github Dependabot
    - Ecosystem's own scanners (like npm audit, pip-audit)
    - Trivy

??? Tip "When to update versions?"

    We recommend having a strategy for when to do package version updates. Besides the usual features given by semantic versioning and breaking changes, don't auto-update to the latest version without some consideration. If not an important security patch, consider waiting until the new release is a week old before updating - malicious updates are usually identified within a few days.

## Safe screening 

??? Tip "Are the safe ways to explore a package?"

    - Packages can contain malicious code in install scripts - examine source code
    - Test / review packages in an isolated environment
        - Container
        - Virtual Machines
        - Github Codespace (on a "dumb" repo with no secrets ....)

## Attack types

??? Note "Want to to know more about known attack vectors in the open source ecosystem?"

    - Typosquatting – Publishing packages with names similar to popular ones (e.g. reqeusts vs requests).
    - Starjacking - Lack of package metadata validation. Associating a source code repository URL with lot of stars to the package 
    - Dependency Confusion – Registering a package name in a public registry that overrides an internal/private package.
    - Malicious Maintainer Update – A trusted maintainer intentionally adds backdoors or malware.
    - Account Takeover – Maintainer's credentials or tokens are compromised, attacker publishes malicious versions.
    - Hijacked Package Ownership – Abandoned package transferred or sold to attacker, who inserts malware.
    - Obfuscated / Hidden Payloads – Malicious code hidden in minified, obfuscated, or binary blobs.
    - Install-Time Attacks – Malicious postinstall or build scripts executing during package installation.
    - Transitive Dependency Attack – Malicious code hidden deep in a dependency chain.
    - Watering Hole Attack – Compromise of the package registry itself (npm, PyPI, etc.).
    - Version Shadowing – Publishing a "good" version and then later pushing a malicious patch version.
    - Binary Planting – Shipping prebuilt binaries in packages with hidden malicious functionality.
    - Credential Stealing / Data Exfiltration – Package attempts to read environment variables, SSH keys, or send data out.
    - Cryptojacking – Package silently runs cryptocurrency miners on install or runtime.
    - Protestware / Logic Bombs – Author inserts politically motivated or disruptive payloads.
    - Backdoored Updates – A legitimate update introduces intentional or unintentional backdoors.
