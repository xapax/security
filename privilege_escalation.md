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

#### **Cronjob** 
With privileges running script that are editable for other users. 

#### World writable scripts invoked as root
World/user writable scripts that are invoked by root can me rewritten to escalate privileges.

Also check scripts that are called by these scripts.

#### World/user writable binaries

#### Weak permissions on LD_preload

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


### Abusing sudo-rights

If you have a shell that has limited sudo programs you might still be able to use it. Any program that can write or overwrite cna be used. If you have `cp` you can overwrite `/etc/shadow` or `/etc/sudoers`. 
**ht**
The text/binary-editor HT running as sudo



### Software vulnerabilites

Software vulnerabilites can lead to priv-esc, like vulnerabiliteis in:
- Kernel
```
uname -a
/etc/issue*
/etc/release
```

#### Binary expoits against root owned binaries
- sudo
- Chrootkit


## Windows

## References
https://www.trustwave.com/Resources/SpiderLabs-Blog/My-5-Top-Ways-to-Escalate-Privileges/