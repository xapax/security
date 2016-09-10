# Privilege Escalation



http://netsec.ws/?p=309

## Linux

### Weak or reused passwords

If there is a web-server, check the connection to the database. Try that password. Also log into the database with the user you found. Is there a admin-account that might be reusing passwords?


### Configuration mistakes

**Web-server running as root**
Now you can just create a php-script and then have root execute it.

**Cronjob**
With privileges running script that are editable for other users. 

**nmap** as root
Run nmap and then enter into interactive shell and then you can issue commands as root.

**Mysql running as root**

If mysql is running as root and you are able to log in as root to it, you can run commands as root by doing this
```
select sys_exec("cp /etc/sudoers /tmp/sudoers");
```

Or you can use this exploit. 
https://www.exploit-db.com/exploits/1518/

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