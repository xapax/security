## Password spraying
Password spraying might be necessary if you do not have a domainuser. It might be your only options to get on to the network.

If you do not have access to the domain through a domain-user you might be able to use rpcclient to query the domain controller for detailed information about the domain.

It is possible to keep track of failed logon attempts, to make sure that you do not lock out any users.


https://www.blackhillsinfosec.com/password-spraying-other-fun-with-rpcclient/


If you want to know the lockout threshold, and lockout duration you can run the following commands

```
net accounts /domain
net accounts
```
