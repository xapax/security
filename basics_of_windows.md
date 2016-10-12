# Basics of windows


### User privileges

#### SYSTEM
System is actually not a user per se. System is technically a security principle.


## Windows domain

A windows network is usually called a Windows domain. On windows domain all users are connected to a domain controller. Domain controller is 

### Active directory

From Windows 2000 the application Active directory has been in charge of maintaining the central database of users and configurations.

### Domain controller

Any windows computer can be configured to be a domain controller. The domain controller manages all the security aspects of the interaction between user and domain.

### SMB

On networks that are based on linux and you need to integrate a windows machine you can use SMB to do that.

## Workgroup

A workgroup arcitechture stands in contrast to the domain-system. A workgroup is based on the idea of peer-to-peer and not server-client as Domain is. In Domain you have a server (domain controller) and a client (the user). Therefore it might be a bit hard to control a network bigger than a dozen clients. So it is usually used for smaller networks.

## Show environmental variables 

```
set
```

### Show options for commands

The "man"-pages in windows is simply:
```
help dir
```

### Show hidden files

```
dir /A
```

### Print out file content, like cat

```
type file.txt
```

## Xampp default folder

```
:C\xampp/htdocs
```