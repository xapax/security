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



https://github.com/gentilkiwi/mimikatz

http://bernardodamele.blogspot.cl/2011/12/dump-windows-password-hashes.html

https://www.youtube.com/watch?v=kMG8IsCohHA&feature=youtu.be

https://www.youtube.com/watch?v=PC_iMqiuIRQ

http://www.harmj0y.net/blog/powershell/powerup-a-usage-guide/

https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerUp

http://pwnwiki.io/#!privesc/windows/index.md