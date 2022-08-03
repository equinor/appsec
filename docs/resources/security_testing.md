# Security Testing

## Automated :robot_face:

### SAST ⬜

Stands for "**Static** Application Security Testing" (tests that are ran towards applications currently not running,  i.e code). That means that this activity can take place very early in the SDLC, as it does not require a working application.

!!! info "SAST is considered a form of [White Box Testing](https://en.wikipedia.org/wiki/White-box_testing)"

A SAST-tool will report on known vulnerabilities and security misconfigurations in your code. Catching these things early, dramatically decrease the cost of fixing these issues.

There are different ways of implementing SAST-tools into your SDLC: doing periodically full scans of your codebase, and having a [linter](https://en.wikipedia.org/wiki/Lint_(software)) present in your dev-environment (IDE) to catch issues as you code. You should do both :muscle:

!!! example "An example of how to get started:"
    Scanner:  
    1. [Sign up to Snyk](/appsec/snyk) (if you have not already)  
    2. Import your project, and make sure that "Snyk Code" is enabled  
    3. Review and prioritize the findings  

    Linter:  
    1. Download [Snyk's IDE plugin](https://snyk.io/ide-plugins/) for your IDE (usually done from the marketplace)  
    2. Sign in  
    3. Review and prioritize the findings as you code 

### DAST ⬛

Stands for "**Dynamic** Application Security Testing". Emulating a malicious user by attacking and probing, a DAST-tool will test a running web application to detect vulnerabilities.

!!! info "DAST is considered a form of [Black Box Testing](https://en.wikipedia.org/wiki/Black-box_testing)"

As with SAST, there are a lot of tools out there that perform this type of testing.

One noteworthy that I can recommend is [OWASP ZAP](https://www.zaproxy.org/).

!!! example "An example of how to get started:"
    Download OWASP ZAP and get familiar with the tool.

    Browse through your application through the ZAP proxy, run the passive and active crawlers, and see if it finds any vulnerabilities.

    Next steps would be to explore the [scripting](https://www.zaproxy.org/docs/desktop/start/features/scripts/) functionality, and look at [ZAP Community Scripts repo](https://github.com/zaproxy/community-scripts).

    OWASP ZAP is quite versatile, and is well suited for integration with your CI/CD. 

## Manual :raised_hand_with_fingers_splayed:

!!! example "Have a look at [WSTG](https://owasp.org/www-project-web-security-testing-guide/)"
