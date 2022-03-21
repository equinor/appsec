# Threat Modeling

Threat modeling is.. awesome. You will have a hard time investigating Secure Development without this process being mentioned again and again, and it's highly recommended that development teams do this regularly.  

OWASP has a [good overview](https://owasp.org/www-community/Threat_Modeling) of what it's all about, but in short it is a process that helps to identify the threats a system may be exposed to.

There are numerous described methods out there for doing threat modeling. One approach that synergize well with an agile approach to doing development, is [Agile Threat Modeling](https://martinfowler.com/articles/agile-threat-modelling.html). If you integrate this well, this process won't require any extra effort from your normal dev-cycle, but will add great value.  

> *An example of how to get started:*
>
> * Someone from the team reads and get familiar with [Agile Threat Modeling](https://martinfowler.com/articles/agile-threat-modelling.html)
> * This person facilitates a threat modeling session with the whole team and other interested parties
>   * Choose a scope beforehand (*ex. some upcoming functionality, current functionality, your CI/CD pipeline etc.*)
> * Find a way to integrate with your current dev-cycle
>   * *as part of existing seremonies*
>   * *as part of making ready a new task*

Of course, no shoe fits all. Whichever method you choose, the most important aspect is that it's sustainable and you will be able to continue to do it regularly - and that it gives valuable output.  

\
Other resources:

* [Cheat sheet - Sample threats](https://docs.microsoft.com/en-us/previous-versions/msp-n-p/ff649461(v=pandp.10)?redirectedfrom=MSDN)
* [Threat Modeling Manifesto](https://www.threatmodelingmanifesto.org/)
* [OWASPS Threat Modeling Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Threat_Modeling_Cheat_Sheet.html)