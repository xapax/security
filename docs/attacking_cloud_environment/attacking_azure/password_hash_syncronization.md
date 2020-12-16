## Background



When On-Prem AD and AzureAD are connected one new on-prem account is created, and one new AzureAD account is created.

On-prem account is called `MSOL_`-and then some random string. This account has DCSync privileges, and sshould therefore be considered a tier 0 resource.

MSOL-account can perform syncornization with AzureAD. The syncronization job is performed on a server. Which server that is is disclosed in the description attribute of the MSOL-user. It says something like:

```
Account created by Microsoft Azure Active Directory Connect with installation identifier <RANDOM STRING> running on computer <NAME OF COMPUTER> configured to synchronize to tenant <XXXX.onmicrosoft.com>
```

By compromising the server or the account it is possible to perform a DCSync attack.

## Pre-requisites


## Risks


## How to check for


## How to exploit


## Recommendation


## Related Vulnerabilities

This finding should not be reported as the name of this issue, instead it should be reported as the vulnerabilities written below. The below written vulnerabilities map to the vulnerability-descriptions in that repo.

For example, if kerberoast, report as the following vulnerabilities if they are applicable:

- Weak password [ID of issue]
- Overpriviliged kerberoastable user [ID of issue]





## References


