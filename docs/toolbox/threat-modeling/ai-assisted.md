# AI-Assisted Threat Modeling

## AI is not the threat modeler - you are

Don't use AI to generate your threat models. The value of threat modeling comes from your team thinking through the system together. AI didn't build your system, doesn't understand your context, and will confidently miss what matters.

Instead, use AI as a:

- **Reviewer** - Have it challenge your threat model and point out what you might have missed
- **Sparring partner** - Discuss attack scenarios and mitigations with it
- **Guide** - Ask it to explain unfamiliar concepts, attack patterns, or security controls

## Make it machine-readable

To get the most out of AI assistance, store your threat models in a format it can actually work with. Tools like [Threat Dragon](tools.md#owasp-threat-dragon) produce machine-readable output by default.

- Store threat models as code (YAML/JSON) alongside your source code
- Use GitHub Copilot to review and update them as you commit
- Keep it a living document that evolves with your system

A machine-readable threat model in your repository means AI tools can access it in context, giving you better and more relevant feedback.

## Context is everything

AI is only as useful as the context you give it. A vague prompt gets a vague answer. If you want meaningful input, invest effort in documenting:

- **Runbooks** - How the system is operated and maintained
- **Access control lists** - Who and what has access to what
- **Data classifications** - What data is sensitive and why

The more context lives in your repo, the better Copilot can reason about your system.

!!! example "Example workflow"
    1. Run a collaborative threat modeling session in **Miro** with your team
    2. Translate the model into **Threat Dragon** and store the JSON file alongside your source code
    3. Spar with **GitHub Copilot** to refine and update the model
    4. Revisit the threat model at major releases, after significant changes, or on a regular cadence
    5. Ask Copilot: *"Do these changes affect our current threat model?"*
