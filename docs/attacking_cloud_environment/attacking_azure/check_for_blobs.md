## Background

Blobs are Azure equivalent to Buckets. They can be misconfigured in the same way as aws buckets.

## Pre-requisites

Access to an Azure account which is associated with an azure subscription.

```
# Login using azure cli
az login

# list subscriptions
az account list
```

If no subscriptions are associated with the user you won't be able to do much.

## Risks

No risks.

## How to check for

```powershell
connect-azuread
get-AzureADServicePrincipal
```

Look for `TenantDomain`.


Search the internets for 


```
For example:
site:<tenantdomain>.blob.core.windows.net
site:<tenantdomain>.file.core.windows.net
site:<tenantdomain>.table.core.windows.net
site:<tenantdomain>.queue.core.windows.net
```

If you find one you can perform a directory-search.


## How to exploit


## Recommendation


## Related Vulnerabilities



## References

https://www.youtube.com/watch?v=AWhag2K3AS8
