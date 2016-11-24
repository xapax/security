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

