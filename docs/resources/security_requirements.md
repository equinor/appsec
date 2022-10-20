# Security Requirements

## Why

Defining your security requirements will help you out when performing various security related activities. When thinking of what can go wrong and trying to secure your system, having defined what is important to you just makes sense :shrug: In addition, it helps prioritizing security-work, ex. patching vulnerabilities found in Snyk, prioritizing threats as part of [Threat Modelling](../threat-modeling/resources/threat_modelling.md), or when doing [Security Testing](security_testing.md).


## What

!!! quote "[OWASP Proactive Controls](https://owasp.org/www-project-proactive-controls/v3/en/c1-security-requirements)"
    A security requirement is a statement of needed security functionality that ensures one of many different security properties of software is being satisfied. Security requirements are derived from industry standards, applicable laws, and a history of past vulnerabilities. Security requirements define new features or additions to existing features to solve a specific security problem or eliminate a potential vulnerability.


## How

The first step would be to have a look at the business objectives and the functional requirements. From here you can derive security requirements by asking **"what CAN'T go wrong"** in order to meet these requirements.

A good place to define these requirements would be in the Requirements Document (having everything in one place and all that :nerd_face:), and gradually work towards having automated test-cases for them.

!!! tip
    - Look at [OWASP ASVS](https://raw.githubusercontent.com/OWASP/ASVS/v4.0.3/4.0/OWASP%20Application%20Security%20Verification%20Standard%204.0.3-en.pdf) and find testable security requirements that applies to your application
    - Have a look at our Guidelines

!!! question "TL;DR"
    **Define Security Requirements**  

    _What are some of the things I care about?_

    (_ * Take into account Confidentiality, integrity, availability._) 

    **Define Compliance Requirements**  

    _Are there any special requirements that must be met (Compliance, and/or legal)?_

    ---

    Input:

    - Business requirement documents
    - Functional requirements documents
    - Information security policies (ex. [WR1211](https://docmap.equinor.com/Docmap/page/doc/dmDocIndex.html?DOCID=1000011245))
    - Regulatory compliance documents (ex. SOX)
    - Security standards & guidelines (ex. [ASVS](https://raw.githubusercontent.com/OWASP/ASVS/v4.0.3/4.0/OWASP%20Application%20Security%20Verification%20Standard%204.0.3-en.pdf))

    Output:

    - Description of the application functionality
    - List of business objectives
    - Definition of the application security and compliance requirements