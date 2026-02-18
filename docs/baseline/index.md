# AppSec Baseline

These are the **minimum security expectations** we have for every development team in Equinor. Think of it as the starting point, not the finish line.

---

## What we deliver

### 1. Do threat modeling

Threat modeling is the easiest and most impactful thing you can do for the security of your solution. Ask yourself **"What can go wrong?"** - regularly.

Do it every time your solution or the world around it changes the risk picture. You can do a full-fledged threat model of the entire solution, or simply ask the question *"what can go wrong?"* on the next feature in the backlog. Both are valuable.

:material-arrow-right: [Get started with threat modeling](../toolbox/threat-modeling/getting-started.md)

### 2. Address GitHub Advanced Security alerts

[GitHub Advanced Security (GHAS)](../toolbox/github-advanced-security/index.md) is Equinor's main tool for code security. It scans code for secrets, performs code scanning for known bad patterns and vulnerabilities and gives insight to the dependencies of your solutions.

We expect anyone contributing to a repository in Equinor to:

- Be familiar with the different GHAS dashboards
- Actively address any alerts
- Work towards achieving a **zero-issue dashboard**

!!! warning "Priority"
    Focus on handling **secret alerts first**, then critical dependencies and code scanning issues.

:material-arrow-right: [Set up GHAS](../toolbox/github-advanced-security/setup.md)

### 3. Know your application

You should be able to answer these questions about your application at any time:

- **What data does your application handle, and what is its classification?**
- **Who has access to your system and why?**
- **What are your dependencies and where are they running?**

### 4. Know the governing documents

All personnel developing software for Equinor are responsible for knowing and following the governance that apply to their work. The [governing documents](https://varia.equinor.com/docs/default/component/equinor-developer/governance/) listed on the developer portal shall be read and understood by all software developers in Equinor.

You should also be familiar with:

- The AppSec guidelines on [this site](../toolbox/index.md) - our practical take on how to implement secure development
- [OWASP](https://owasp.org/) and the relevant top 10 lists for your technology

---

## How we deliver

### 5. Be active on Slack

AppSec's main communication channel is the **[#appsec](https://equinor.enterprise.slack.com/archives/CMM6FSW5V)** channel on Slack. We expect developers to join and keep up-to-speed on posts here - we announce everything from ongoing attacks and policy changes to relevant cross-posts from other channels.

!!! tip "Other channels worth joining"
    [#developer_community](https://equinor.enterprise.slack.com/archives/C3HLP8ZTQ), [#ai-assisted-software-engineering](https://equinor.enterprise.slack.com/archives/C062CFTEDV1), [#dev-toolbox](https://equinor.enterprise.slack.com/archives/C02JJGV05) and the different #omnia channels are all great communities.

### 6. Share your pain and share your gain

Sharing is caring - and you might be surprised how many others are struggling with the same challenges you are. Share those challenges and solutions, so that others can learn from you and you can learn from others.

Slack is a great place to ask questions, while Security Champions seminars and developer community seminars are good for longer, low-bar demonstrations or talks.

**Ask for help when needed - and help when needed.**
