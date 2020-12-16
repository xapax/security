

## Background

Scripts are often stored in the SYSVOL of the Domain Controller. These scripts might include sensitive data, such as credentials. Historically these scripts have been used to, among other things, set the password of the local administrator.



## How to test for

Passwords are usually not defined using a variable called "Password", so we will compile a list of strings that are common to use for passwords:


```
aPwd
pwd
password
net user
```

```
net use x: \\dc01\sysvol
x:
gci -recurse -Include config *.bat, *.cmd, *.ps1, *.vbs, *.js, *.wsf, *.kix, *.txt  | out-file C:\Users\<YOUUSER>\Documents\scriptsearch.txt
```