## Active Directory - Check for lockout threshold 

Lockout threshold can be configured in a number of different ways.

There are many caveats and risks involved with adding account lockout. In some configurations applications use user credentials to authenticate. So if the password is change on one device, the other devices/applications will continue with the old password, and therefore lock out the user.

Account lockout policy is usually managed through GPOs. By default it is the "Defaul Domain Policy" that specifies the Lockout policy.

- Account Lockout Duration
- Account Lockout Threshold
- Reset account lockout after: Default is 30 min



https://ravingroo.com/295/active-directory-account-lockout-policy-threshold-counter-strong-password/


### How to test for

```
net accounts
```

```
get-domainpolicy
net accounts /domain
```
