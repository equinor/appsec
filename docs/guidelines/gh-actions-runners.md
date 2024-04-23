# GitHub Actions and Self-Hosted Runners

The scope of this guideline is to provide generic security advice for GitHub Actions and specific security advice for using self-hosted runners.

(To have a holistic view on security and threats in a system, we recommend that teams have a **Threat Model for their Software Development Lifecycle**. More informaton on threat modeling can be found [here](../threat-modeling/index.md))

## GitHub Actions in General

When using GitHub Actions, it is good practice to:

- Investigate and familiarize yourself with the [Security Guides](https://docs.github.com/en/actions/security-guides) provided by GitHub and take appropriate actions.
- Investigate and align on repository configuration (repository settings)
    - _Actions -> General_
        - _Action permissions_
            - If you don't use GitHub Actions, set this to "Disable actions" 
            - If you want to use GitHub Actions, set this to "Allow enterprise, and select non-enterprise, actions and reusable workflows"
            - You can check "Allow actions created by GitHub"
            - Add the specific actions you are going to use into the "Allow specified actions and reusable workflows" section
        - _Fork pull request workflows from outside collaborators_ (public repos)
            - The default should be "Require approval for all outside collaborators"
        - _Fork pull request workflows_ (non-public repos)
            - "Run workflows from fork pull requests" should not be checked. Change only i you have a good understanding og the risks involved.
  - All external actions that you plan to use should be examined/audited. This could include examining the repos and using services like [StepSecurity's Action Advisor](https://app.stepsecurity.io/action-advisor).
- Pin actions to the full length commit-hash (example "uses: actions/checkout@b4ffde65f46336ab88eb53be808477a3936bae11 #v4.1.1). You can pin to a tag (version) if you trust the creator (Example: "uses: actions/checkout@v4.1.1")
- Use OpenID Connect for access to Azure Resources ([Configuring OpenID Connect in Azure](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-azure), [MS Workload Identity Federation](https://learn.microsoft.com/en-us/entra/workload-id/workload-identity-federation))
- Manage secrets securely; they should only be available to workflows and branches where needed
    - Use **environments** to protect code and secrets [Github Doc](https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment)
    - Investigate [Using secrets in GitHub Actions](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions)
    - If available, consider using managed identity/[OIDC](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-azure) and Azure Key Vaults for secrets.
- Limit the permissions/scope of all tokens/credentials, especially the GITHUB_TOKEN.
- Only refer to values that you control in an action (think risks related to non-validated input).
- Use branch protection for your repository (workflows should be treated as "sensitive", use branch protection and careful review for any changes).
  

## Using Self-Hosted Runners

When using GitHub Actions with **self-hosted runners**, it is good practice to:

- Investigate and familiarize yourself with the [Hosting your own runners](https://docs.github.com/en/actions/hosting-your-own-runners) documentation.
- Investigate and familiarize yourself with the [Hardening for self-hosted runners](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions#hardening-for-self-hosted-runners).
- **NEVER** use with **public** repos.
- Involve the team, create, and keep up to date a **threat model** of your self-hosted runner setup. The threat model should at least include:
    - A data flow/architecture diagram including key components and code/information flows.
    - A list of identified threats/risks.
    - Information on how identified threats/risks are managed.
    - The threat model should be accepted by product owners/risk owners.
- For the hosting environment:
    - We prefer ephemeral environments, non-persistent environments.
    - [Just-in-time runners](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions#using-just-in-time-runners) may be an option.
    - Use dedicated hosts/machines.
    - Only do one job at a time on the runner (don't do auto-scaling with persistent runners, use the --ephemeral flag).
    - Follow hardening guidelines for the hosting platform (if they exist).
    - The environment should be isolated by default.
    - Network egress/ingress should be managed (firewall, NSG rules, ++).
    - The runner code should execute with the least possible privilege level.
    - Environments should be refreshed regularly (update, patch) (weekly).
    - The GitHub runner software should be on auto-update (which is default unless disabled).
    - **Each job should do a proper clean-up!**
- Have routines and practices for monitoring/examining run/runner logs.

## The Future, The GH Roadmap

- We are exploring company-provided runners (organization, enterprise).
- Using Azure Virtual Networks with GitHub hosted runners may be an option in the future ([link](https://docs.github.com/en/enterprise-cloud@latest/admin/configuration/configuring-private-networking-for-hosted-compute-products/about-using-github-hosted-runners-in-your-azure-virtual-network)).
- The [GitHub Public Roadmap](https://github.com/orgs/github/projects/4247/views/1?filterQuery=is%3Aopen+label%3Aactions+) is evolving.

## External 3rd Party Resources

- [GitGuardian, GitHub Actions Security Cheat Sheet](https://blog.gitguardian.com/github-actions-security-cheat-sheet/)
