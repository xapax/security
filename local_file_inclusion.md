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

cat /etc/passwd
cat /etc/group
cat /etc/shadow
ls -alh /var/mail/
```