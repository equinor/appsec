# Extention: Explore

## Agile Threat Modeling

There are numerous described methods out there for doing threat modeling. One approach that synergizes well with an agile approach to doing development, is [Agile Threat Modeling](https://martinfowler.com/articles/agile-threat-modelling.html). If you integrate this well, this process won't require any extra effort from your normal dev-cycle, but will add great value.  

!!! example "An example of how to get started:"
   
    1. Someone from the team reads and get familiar with [Agile Threat Modeling](https://martinfowler.com/articles/agile-threat-modelling.html)
    2. Choose a scope beforehand (*ex. some upcoming functionality, current functionality, your CI/CD pipeline etc.*)
    3. This person facilitates a threat modeling session with the whole team and other interested parties
    4. Find a way to integrate with your current dev-cycle
        * *as part of existing ceremonies*
        * *as part of detailing a new task*
    

Of course, no shoe fits all. Whichever method you choose, the most important aspect is that it's sustainable and you will be able to continue to do it regularly - and that it gives valuable output.

## Alternative forms for doing Threat Modeling

### Abuser stories

When detailing your tasks for upcoming functionality with use cases, consider also writing misuse cases.  

!!! quote "[*ref. OWASP Web Security Testing Guide*](https://owasp.org/www-project-web-security-testing-guide/v42/2-Introduction/README#threat-modeling)"
    Similar to use cases, misuse or abuse cases describe unintended and malicious use scenarios of the application.
    These misuse cases provide a way to describe scenarios of how an attacker could misuse and abuse the application.
    By going through the individual steps in a use scenario and thinking about how it can be maliciously exploited,
    potential flaws or aspects of the application that are not well defined can be discovered. The key is to describe all
    possible or, at least, the most critical use and misuse scenarios  

!!! example
    * As an abuser, I want to gain access to this web application’s Cloud Hosting account so that I can lock out the legitimate owners and delete the servers and their backups, to destroy their entire business.
    * As an abuser, I want to overload this system with requests so that legitimate users won't be able use it

For more information, [read this](https://en.wikipedia.org/wiki/Misuse_case)

## Other resources:

* [A really good overview of the existing methodologies](https://shellsharks.com/threat-modeling)
* [An "automated" approach to doing threat modeling](https://github.com/Autodesk/continuous-threat-modeling)
* [Learning path from Microsoft](https://learn.microsoft.com/en-us/training/paths/tm-threat-modeling-fundamentals/)
* [Equinor AppSec Threat Modeling Slide-deck](https://threatmodeling.app.playground.radix.equinor.com/)
* [Threat Modeling Manifesto](https://www.threatmodelingmanifesto.org/)
* [OWASPS Threat Modeling Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Threat_Modeling_Cheat_Sheet.html)