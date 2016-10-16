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

## Structure of windows

### Windows 7

The root folder of windows **c:\*** by default contains the following 

```
Windows
Users

```

#### Windows


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

List processes

```
tasklist
```

Kill process
```
taskkill /PID 1532 /F
```

### Users

```
net users
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

## File types

Unlike linux not everything is a file in windows. File-endings are important

### BAT

.bat-files are the windows equivalent to bash-scripts

In order to write a batch-script you open up an editor and then just write your commands. And then you save it as blabla.bat. And make sure you don't save it as a text file.

Then you just run the script from the cmd

### DLL - Dynamic Link Library

A DLL file is a library that is used for one or more program. It is a binary-file but it is not executable in itself, but it contains code that the executable calls. It is used to modularize the code of a program. 

In the windows operating system DLL files are shared among different applications. In windows the dll **Comdlg32** performs dialog boxes. So different applications can invoke this library yo easily create a dioalog box. This promotes code reuse.

So a application may use the standard windows DLL-files, but it may also bring its own DLL-files.

So if one DLL-file is missing for a program a certain module might not work. 

### LIB

Lib is a bit like DLL, it is a library. But it is not dynamic as DLL. So lib-files are linked on compile-time. While dll-files are linked in run-time. Since lib-files are compiled into the exacutable you never see it (unless you are developing of course). But since DLL-files are dynamically loaded at run-time they are still around for the user to see.
