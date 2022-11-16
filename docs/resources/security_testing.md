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

### IAST

Stands for "**Interactive** Application Security Testing". IAST is dynamic and gets its feedback from _sensor modules_ that are included with – and run in context with the application that is subject to the test.

!!! info "IAST is considered a form of [Grey Box Testing](https://en.wikipedia.org/wiki/Gray-box_testing)"

As the application is being externally triggered through automated or manual events, the internal instrumentation or _sensor modules_ evaluate the application and report in real-time – making this an interactive process.

IAST is performed in production or a production-like environment, and in contrast to SAST will be able to identify vulnerabilities based on the systems behaviour and not only its static codebase. 
This results in a more holistic approach to evaluating the system. 
It balances some of the false positives given by other more static approaches, and evaluates the system in a context determined by configuration, control and dataflow and other characteristics given by the environment where the application is running.

Proper utilization of IAST, as being included in the CI/CD pipeline will then be able to _"shift left"_ the types of tests that bring information about posible observable runtime vulnerabilities into the development stage.

### RASP
Stands for "**Runtime** application self-protection". 
RASP enabled systems have both the capability to identify and monitor, as well as actively stopping an attack.

As opposed to simply protecting the application from an external perspective by securing its interfaces (e.g firewall protection), RASP protects the system by also taking the internal state of the application into evaluation.
By establishing protection mechanisms at the application/server layer, RASP-protected systems are less dependent on perimeter based protection.

As for IAST the mechanicm is enabled by instrumentation embedded in the system. 
However while IAST identifies vulnerabilities as part of the testing phase, RASP protects the application for direct attacks at runtime.

## Manual :raised_hand_with_fingers_splayed:

!!! example "Have a look at [WSTG](https://owasp.org/www-project-web-security-testing-guide/)"
