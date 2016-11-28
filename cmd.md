# CMD - Windows commands



This might come in handy for the linux-users: http://www.lemoda.net/windows/windows2unix/windows2unix.html
For more on how to use powershell see the powershell-scripting chapter

The equivalent to the linux command `;` as in
```
echo "command 1" ; echo "command 2"
```

is

```
dir & whoami
```

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

# Add user
net user hacker my_password /add
net localgroup Administrator hacker /add

# Check if you are part of a domain
net localgroup /domain

# List all users in a domain
net users /domain
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

### Mounting - Mapping

In the windows world mounting is called mapping.

If you want to see which drives are mapped/mounted to your filesystem you can use any of these commands:

```
# This is the most thorough
wmic logicaldisk get deviceid, volumename, description

# But this works too
wmic logicaldisk get name
wmic logicaldisk get caption
```


The command to deal with mounting/mapping is **net use**

Using **net use** we can connect to other shared folder, on other systems. Many windows machines have a default-share called IPC (Interprocess communication share). It does not contain any files. But we can usually connect to it without authentication. This is called a **null-session**. Although the share does not contain any files it contains a lot of data that is useful for enumeration.
The linux-equivalent of **net use** is usually **smbclient**. 


```
net use \\IP address\IPC$ "" /u:""
net use \\192.168.1.101\IPC$ "" /u:""
```

If you want to map a drive from another network to your filesystem you can do that like this:

```
net use z: \\192.168.1.101\SYSVOL
```

Here you map the drive to the letter **z**. If the command is successfull you should now be able to access those files by entering the **z** drive.

You enter the z-drive by doing this:

```
C:\>z:
Z:\

# Now we switch back to c
Z:\>c:
C:\
```

#### Switch between drives
So if you have mapped a drive like the example before, 