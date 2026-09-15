# Multi Branch Setup in Dependabot

In the Equinor GitHub organization, Dependabot alerts and security updates are [enabled by organization policy](setup.md#enabled-by-organization-policy); you do not need to enable them manually. Version updates still require repository configuration.

To configure Dependabot version updates for multiple branches, use the `target-branch` property in `.github/dependabot.yml`. This controls version updates only; Dependabot security updates target the default branch.

1. **Create or Edit the `dependabot.yml` File**:

    - On your repository's default branch, navigate to the `.github` directory.
    - Create or edit the `dependabot.yml` file to specify configurations for each branch.

1. **Define Updates for Multiple Branches**:

    - Use the `updates` key in the `dependabot.yml` file to define configurations for each branch.
    - Replace `package-ecosystem`, `directory`, `schedule`, and `target-branch` with values specific to your repository.

Example:

```yaml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "daily"
    target-branch: "main"
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
    target-branch: "development"
```
