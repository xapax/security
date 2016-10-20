# Internal Enumeration - Windows

Many priv-esc techniques on windows comes from third-party programs and not necessarily windows in itself. Therefore it is important to really learn to enumerate the system and find those vulnerable programs.


http://netsec.ws/?cat=64

http://netsec.ws/?p=314

## Info about the system



```
systeminfo
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
hostname

#Who am I?
whoami
echo %username%

#What users are on the machine?
net users

#More info about a specific user
net user user1
```

## Network

```
ipconfig /all

route print

#Display all available interfaces
arp -A
```

### Active connections

```
netstat -ano

#Firewall rules
netsh firewall show state
netsh firewall show config
```

### Processes running

```
# The cronjob of windows
schtasks /query /fo LIST /v

# Running processes
tasklist /SVC
net start


# Drivers
DRIVERQUERY
```


## References

http://www.fuzzysecurity.com/tutorials/16.html