# Basics of windows


## Windows domain

A windows network is usually called a Windows domain. On windows domain all users are connected to a domain controller. Domain controller is 

### Active directory

From Windows 2000 the application Active directory has been in charge of maintaining the central database of users and configurations.

### Domain controller

Any windows computer can be configured to be a domain controller. The domain controller manages all the security aspects of the interaction between user and domain.

### SMB

On networks that are based on linux and you need to integrate a windows machine you can use SMB to do that.

## Workgroup

A workgroup architecture stands in contrast to the domain-system. A workgroup is based on the idea of peer-to-peer and not server-client as Domain is. In Domain you have a server (domain controller) and a client (the user). Therefore it might be a bit hard to control a network bigger than a dozen clients. So it is usually used for smaller networks.


## User privileges

### SYSTEM
System is actually not a user per se. System is technically a security principle. One big difference between SYSTEM and Administrator is that is the computer is connected to a domain the system user can access the domain in the context of the domain account. The administrator cannot.

On windows it is possible to grant permission of a file to System but not to Administrator.

One example of this is the SAM key, which contains local account information. The system user has access to this information, but Administrator does not.
http://superuser.com/questions/504136/root-vs-administrator-vs-system

## Important files and stuff

SAM key


## Xampp default folder

```
:C\xampp/htdocs
```


## Useful commands


### Dealing with files and stuff

**Delete file**

```
del
```

**Create dir**

```
md folderName
```

**Show hidden files**

```
dir /A
```

**Print out file content, like cat**

```
type file.txt
```

**grep files**

```
findstr file.txt
```



### Network

 **netstat -an**


**ipconfig**

Show ip-address and other network information

**ping**

well, it pings

**tracert**

Equvialent to traceroute


### Processes

```
tasklist
```

### Other

**shutdown**

```
 # Shutdown now
 shutdown /s /t 0
 
 # Restart
 shutdown /r /t 0
 ```
 
 **ciper - Clear data/shred**
 
 ```
 Shreds the whole machine
 ciper /w:C:\
 ```
 
 
 
 **Show environmental variables**

```
set
```

**Show options for commands**

The "man"-pages in windows is simply:
```
help dir
```