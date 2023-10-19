# Repository Security Reporting Policy

## Introduction

The purpose of the SECURITY.md file is to offer guidance on reporting security issues or vulnerabilities associated with a Git repository/project.

The guidance may depend on the visibility of the project. Public repos will typically reference how "externals" can get in contact, while internal/private repos may add information on contact  points only available to "internals".

The general description on the mechanics of the SECURITY.md file on github.com is useful. Read the official documentation on [docs.github.com](https://docs.github.com/en/code-security/getting-started/adding-a-security-policy-to-your-repository)

Github has a feature called [Security Advisories](https://docs.github.com/en/code-security/security-advisories/repository-security-advisories/about-repository-security-advisories). Using this feature one can privately discuss, fix and publish security vulnerabilities. We do not give a general advice that all projects should use this feature. For some project (public open source projects) this could be a valuable feature that should be investigated.

We suggest content for few scenarios. Repository/project owners should adapt to their context following the intention of the SECURITY.md file.

---

## Template SECURITY.md (public)

If you discover a security vulnerability in this project, please follow these steps to responsibly disclose it:

1. **Do not** create a public GitHub issue for the vulnerability.
2. Follow our guideline for Responsible Disclosure Policy at [https://www.equinor.com/about-us/csirt](https://www.equinor.com/about-us/csirt) to report the issue

The following information will help us triage your report more quickly:

- Type of issue (e.g. buffer overflow, SQL injection, cross-site scripting, etc.)
- Full paths of source file(s) related to the manifestation of the issue
- The location of the affected source code (tag/branch/commit or direct URL)
- Any special configuration required to reproduce the issue
- Step-by-step instructions to reproduce the issue
- Proof-of-concept or exploit code (if possible)
- Impact of the issue, including how an attacker might exploit the issue

We prefer all communications to be in English.

---

## Template SECURITY.md (internal, private)

If you discover a security vulnerability in this project, please follow the steps below to report it.

### For "non-critical" issues

- Alternative A: Create a GitHub issue for the vulnerability and ask the maintainer to reach our to you. Avoid putting sensitive information in the issue.
- Alternative B: Send an email to the projects maintainer at [security@example.com](mailto:security@example.com) describing the issue.

### For "critical" and time sensitive issues

Send email to [it-security@equinor.com](mailto:it-security@equinor.com) or​ phone the Equinor helpdesk:

- Norway (+47) 51 999 222
- US/Canada (+1) 713 878 6970
