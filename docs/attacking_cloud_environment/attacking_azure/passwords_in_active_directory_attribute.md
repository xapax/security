## Background

If sensitive data is stored in the description field on Active Directory objects those can usually be accessed by any domain user.



## Pre-requisites

- Domain joined user account.

- Msonline or AzureAD powershell module
-
## Risks

Might be seen in logs.




## How to check for

```
get-msolgroup -All | select-object -Property DisplayName,Description | export-csv -path group-descriptions.csv
```


## How to exploit


## Recommendation


## Related Vulnerabilities




## References


