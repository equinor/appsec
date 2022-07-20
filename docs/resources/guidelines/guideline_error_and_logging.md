# Guideline - Logging and Error Handling #DRAFT

The primary objective of error handling and logging is to provide useful information for the user,
administrators, and incident response teams. The objective is not to create massive amounts of logs, but high
quality logs, with more signal than discarded noise

### 1. Encrypt all data in transit and at rest, use the latest version of TLS

### 2. Always “fail safe” or “fail closed”, do not “fail open” or to an unknown state. If an error occurs, do not grant access or complete the transaction, always roll back

### 3. Having a catch-all mechanism (global exception handling) is highly advisable, to ensure unexpected errors are always handled properly

### 4. Internal information, stack traces or other crash information should never be revealed to the user or potential attackers

### 5. Error messages should reveal as little as possible. Ensure they do not “leak”information, such as details about the sever version or patching levels

### 6. Security-related errors (login fails, access control failures, server-side inputvalidation failures) should issue a system alert. Ideally, log files will feed into an intrusion prevention/detection system or an application SIEM (TODO: align with CDC)

---

!!! important "Logs must contain (at least)"
    - what type of event occurred (why this event is security-
    related/name for event)  
    - when the event occurred (timestamp)
    - where the event occurred (URL)
    - the source of the event (IP address)
    - the outcome of the event
    - (if possible) the identity of any individuals, users or
    subjects associated with the event

---

## Resources

- [OWASP Logging cheat sheet](https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html)
