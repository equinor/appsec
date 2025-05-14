# Web Application Logging and Monitoring

!!! info
    This is a work in progress. Any thoughts? Reach out to us on [Slack](https://app.slack.com/client/T02JL00JU/CMM6FSW5V) or e-mail at ``appsec[at]equinor.com``

**Target Audience** - Application teams maintaining or implementing web applications.

Logging and Monitoring are core components of a robust security posture.
They contribute for the operational health of the application, assist non-repudiation controls, allow for detection of security incidents and support it's investigation.

In this guideline we address logging for security, maintenance and operational purposes. This is not a single truth, as each application is different. Additional requirements might apply based on the criticality of the application and classification of information managed by it.

## TL;DR

- Application teams should ensure that logging and monitoring is in place for operational and maintenance purposes
- The front-end is a **public client** and the logs from it **cannot be trusted**
- Do a **threat model** to see where security logging would benefit you the most

## Application Specific Logging & Monitoring

### Security Logging

Security logging is a huge topic, so we will limit our scope. You should not log "just to log", and _what_ you log should make sense. Consider the below points based on your **risk appetite**, **sensitivity of data** and your applications **threat model**.

!!! warn "Note"

    This is **not** a complete list, **not** a minimum requirement, but a **good start** to get ideas.

- Log when state of data changes occur
- Log when someone tries to gain access to resources they do not have access to
- Log actions done by administrators
- Log access to sensitive documents

#### Examples

- ```Scans:``` Somebody keeps poking our end-points, testing known end-points, or trying different malicious inputs. A fitting mitigation for this threat can be throttling / rate limiting. Logging would not properly mitigate the issue, because the application team would be unable to take action to stop such an attack. Such an attack would be up to CDC to detect and respond
- ```Access control:``` Assume an application holds data that is owned by specific users, and it is required that data can be accessed only by its owner. A risk is identified that, due to either errors or malicious action, user Alice could access user Bob's data. In this case, logging is an acceptable mitigation to this risk. The application can log whenever a user accesses a piece of data. Controls can be set up to check the logs in real time and detect if some accesses are incompatible, or this could happen on a regular basis (e.g. once a month a validation routine is run on the logs)
- ```Privileged (admin) access:``` Some applications may include special permissions for admins. What application admins can do is determined by the application, so misuse of admin credentials is a threat in the scope of the application. Logging accesses and actions performed by admins is a valid mitigation strategy

#### Where to store security logs

It depends on your situation is the "boring answer". If you have a small application, it might be practical to have the security logs with your application logs. If you have a big application, it might be useful to store security logs in a Azure Log Analytics workspace separate from your [Maintenance & Operational Logging](#maintenance-operational-logging). This is so it can be easily consumed if you are asked for your security logs.

### Maintenance & Operational Logging

The application teams should ensure, that logging and monitoring is in place for operational and maintenance purposes.

We recommend that teams address and put into place a logging strategy as soon as possible in the software development life cycle. We have experienced that the later logging is addressed the harder it is to put into place.

!!! tip "A logging strategy should address"

    - Why you are logging
    - Where to send logs
    - Where to store the logs
    - How to maintain the logs

The granularity of logging and frequency of monitoring will depend on the criticality of the application and of the information managed by it.

Iterative **threat modeling sessions** should be conducted to access the level of logging and monitoring required. These sessions should involve the BSO/TPM as they will be the best equipped to provide insight into the business and security requirements of the application.

Depending on your selected log strategy, you should consider having **immutable logs**, especially if you are handling confidential data.

```Critical or sensitive information, access tokens, secrets, source code, keys, certificates, etc.. are examples of what should never be logged.```

### Personal Identifiable Information (PII) & GDPR

The team should pay particular attention to minimize to the absolute minimum the collection and storage of any kind of private or personal identifiable information (PII) in the log files.

We recommend consulting the [GDPR - Privacy by Design Guideline](https://wiki.equinor.com/wiki/Software:Gdpr_guideline) for further guidance.

### Logging on the back-end vs front-end

!!! tip

    The **back-end** is a **confidential client**, the logs presented from it can be trusted.

    The **front-end** is a **public client** as such the logs presented from it cannot be trusted.

Ideally, if **front-end** logging is necessary, a separate logging instance should be set up for both the **back-end** and **front-end**.
If sharing the same logging instance, we suggest you tag the logs with the source when prevenient from the backend, so it can be easily identified and distinguished which are trusted logs and which are untrusted logs.

### Retention Period

In accordance to [TR2375 SR133039](https://docmap.equinor.com/Docmap/page/doc/dmDocIndex.html?DOCKEYID=1000005127):

- Access logs from solutions containing personal data shall be stored for 3 months
- Logs that enable detection and investigation of incidents shall be stored for 3 months
- Logs are from applications and systems processing confidential information shall be stored for 18 months

We do recommend setting up auto deletion of logs after they have passed the intended retention period to reduce cost and manual maintenance.

## Logging & Monitoring Best Practices

There are some best practices that we recommend teams to keep in mind when implementing logging and monitoring into their applications.

### Monitoring & Alerting

When it comes to monitoring and alerting, each team should decide on how much is necessary, this depends on the criticality of the application and of the information handled by it.

!!! info

    Monitoring and alerts should not take most of the time from the team.

Monitoring and alerts can quickly become overwhelming. It can be considered for teams that want to be proactive on identifying issues in the application before their users or it can be a good mitigation strategy for a threat identified during a **threat modeling session.**

### Resources

Here are some resources on logging and monitoring we can recommend:

- [OWASP Logging Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html#logging-cheat-sheet)
- [OWASP Logging Vocabulary](https://cheatsheetseries.owasp.org/cheatsheets/Logging_Vocabulary_Cheat_Sheet.html#the-vocabulary)
- [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/)
- [OWASP Implement Security Logging and Monitoring](https://owasp.org/www-project-proactive-controls/v3/en/c9-security-logging)
- [OWASP Security Logging and Monitoring Checklist](https://owasp.org/www-project-developer-guide/release/design/web_app_checklist/security_logging_and_monitoring/)
- [Snyk Lesson on Logging Vulnerabilities](https://learn.snyk.io/lesson/logging-vulnerabilities/#step-12d534ed-b232-4f6d-b52b-f06b8897f99a)
