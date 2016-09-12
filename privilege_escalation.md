# Privilege Escalation

Watch this video!
http://www.irongeek.com/i.php?page=videos/bsidesaugusta2016/its-too-funky-in-here04-linux-privilege-escalation-for-fun-profit-and-all-around-mischief-jake-williams

http://www.slideshare.net/nullthreat/fund-linux-priv-esc-wprotections

http://netsec.ws/?p=309

## Linux

### Weak or reused passwords

If there is a web-server, check the connection to the database. Try that password. Also log into the database with the user you found. Is there a admin-account that might be reusing passwords?

Config-files
postfix
newsbeauter

### Configuration mistakes

**Web-server**
Running as root

**Cronjob** 
With privileges running script that are editable for other users. 

**nmap**
SUID on nmap.

**SUID files**

SUID is a bit that you can set on a file. If you run a binary the binary is run as the user who is running it. But if the binary has the SUID-bit it will be run as the owner of that binary. This can be abused.

Here is how you find SUID files:
```
find / -perm -u=s -type f 2>/dev/null
```

### Abusing sudo-rights

**ht**
The text/binary-editor HT running as sudo


### Software vulnerabilites

Software vulnerabilites can lead to priv-esc, like vulnerabiliteis in:
- Kernel
- sudo
- Chrootkit


## Windows

## References
https://www.trustwave.com/Resources/SpiderLabs-Blog/My-5-Top-Ways-to-Escalate-Privileges/