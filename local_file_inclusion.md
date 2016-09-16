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

## Sensitive file

```
# Usually found in the root of the website
.htaccess
```

### SSH
```
authorized_keys
id_rsa
id_rsa.keystore
id_rsa.pub
known_hosts
```
### Logs
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

### General files

First you need to check the passwd file to find the users.
```
cat /etc/passwd
cat /etc/group
cat /etc/shadow
/var/mail/
```

### User specific files

Found in the home-directory

```
.bash_history
.mysql_history
.my.cnf
```

## Bruteforcing SSH known_hosts

https://blog.rootshell.be/2010/11/03/bruteforcing-ssh-known_hosts-files/