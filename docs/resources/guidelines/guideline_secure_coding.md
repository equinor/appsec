# Guideline - Secure Coding #DRAFT

### 1. Input validation

Input Validation of ALL types of input. This includes data from your own database, files, URL parameters as well as your own API's. Valid data on sever-side, (not _only_ in the front-end), against a whitelist.

### 2. Output Encoding

Output Encoding is required for all output to the screen.

### 3. Database Security

3.1 Parameterized Queries are mandatory, inline SQL is forbidden.  
3.2 While accessing the database, the application should use lowest possible level of privilege.  
3.3 Default passwords should be changed immediately. Password hygiene should be kept in mind while assigning passwords to accounts.

### 4. Scan for known vulnerabilities

4.1 All 3rd party code and components must be verified not to contain known vulnerabilities.  
4.2 All written code must be scanned by SAST-tool before deployment

### 5. Every applicable security header should be used

### 6. Do not cache sensitive page data

### 7. Use the Authorization, Authentication and other security features in your framework , do not write your own.

### 8. Sensitive or decision-making information should never be stored in URL parameters

### 9. Sensitive data should be stored in secure cookies, and all available security features for cookies should be used, including the 'secure' and 'httponly' flags

### 10. Logging and monitoring

10.1 All errors should be caught, handled, logged, and, if appropriate, alerted upon. Never log sensitive or PII information.  
10.1.1 Logs related to input validation failures, authentication attempts, access control, system exceptions, unexpected changes to data and changes made to security configurations should be maintained and checked thoroughly.

### 11. HTTPS only. Never HTTP

---

## __Bonus Secure Coding Practices__

### Define security requirements. 

Identify and document security requirements early in the development life cycle and make sure that subsequent development artifacts are evaluated for compliance with those requirements.

### Model threats

Use threat modeling to anticipate the threats to which the software will be subjected.

---

## Resources

- [OWASP SCP Quick Reference Guide](https://owasp.org/www-pdf-archive/OWASP_SCP_Quick_Reference_Guide_v2.pdf)
- [Snyk's Secure Coding Practices](https://snyk.io/learn/secure-coding-practices/)
