# Multi Branch Setup in Dependabot

To set up Dependabot for multiple branches in your repository, use the target-branch property in the `dependabot.yml` file. Example:

 1. **Enable Dependabot**:
     - Navigate to your repository's **Settings**.
     - Under the "Security" section, click **Advanced Security**.
     - Enable Dependabot alerts, security updates, and version updates.

 2. **Create or Edit the `dependabot.yml` File**:
     - In your repository, navigate to the `/.github` directory.
     - Create or edit the `dependabot.yml` file to specify configurations for each branch.

3. **Define Updates for Multiple Branches**:
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

