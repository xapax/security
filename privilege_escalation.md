# Privilege Escalation



http://netsec.ws/?p=309

## Linux

### Weak or reused passwords

If there is a web-server, check the connection to the database. Try that password. Also log into the database with the user you found. Is there a admin-account that might be reusing passwords?


### Configuration mistakes

Web-server running as root

**Cronjob** with privileges running script that are editable for other users. 

**nmap** as root

**SUID files**

```
find / -perm -u=s -type f 2>/dev/null
```

### Software vulnerabilites
Software vulnerabilites can lead to priv-esc, like vulnerabiliteis in:
- Kernel
- sudo

## Windows

## References
https://www.trustwave.com/Resources/SpiderLabs-Blog/My-5-Top-Ways-to-Escalate-Privileges/