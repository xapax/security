# Mysql


## Configuration files

```
cat /etc/my.cnf
```

## Mysql-commands cheat sheet
    
    http://cse.unl.edu/~sscott/ShowFiles/SQL/CheatSheet/SQLCheatSheet.html


## Finding passwords to mysql

You might gain access to a shell by uploading a reverse-shell. And then you need to escalate your privilege. One way to do that is to look into the databse and see what users and passwords that are available. Maybe someone is resuing a password?

So the first step is to find the login-credencials for the database. Those are usually found in some configuration-file oon the web-server. For example, in joomla they are found in:
```
/var/www/html/configuration.php
```
In that file you find the 

```
cat configuration.php
<?php
class JConfig {
	var $offline = '0';
	var $editor = 'none';
	var $list_limit = '20';
	var $helpurl = 'http://help.joomla.org';
	var $debug = '0';
	var $debug_lang = '0';
	var $sef = '0';
	var $sef_rewrite = '0';
	var $sef_suffix = '0';
	var $feed_limit = '10';
	var $secret = 'cKtZspJlgZvk82DU';
	var $gzip = '0';
	var $error_reporting = '-1';
	var $xmlrpc_server = '1';
	var $log_path = '/var/www/html/logs';
	var $tmp_path = '/var/www/html/tmp';
	var $offset = '0';
	var $caching = '0';
	var $cachetime = '15';
	var $cache_handler = 'file';
	var $memcache_settings = array();
	var $ftp_enable = '1';
	var $ftp_host = '127.0.0.1';
	var $ftp_port = '21';
	var $ftp_user = '';
	var $ftp_pass = '';
	var $ftp_root = '';
	var $dbtype = 'mysql';
	var $host = 'localhost';
	var $user = 'jose';
	var $db = 'catsanddogs';
	var $dbprefix = 'jos_';
	var $mailer = 'mail';
	var $mailfrom = 'admin@catsanddogs.com';
	var $fromname = 'Fuku';
	var $sendmail = '/usr/sbin/sendmail';
	var $smtpauth = '0';
	var $smtpuser = '';
	var $smtppass = '';
	var $smtphost = 'localhost';
	var $MetaAuthor = '1';
	var $MetaTitle = '1';
	var $lifetime = '15';
	var $session_handler = 'none';
	var $password = 'mySecretPassowrd1234';
	var $sitename = 'catsAndDogsInc';
	var $MetaDesc = 'Joomla! - the dynamic portal engine and content management system';
	var $MetaKeys = 'joomla, Joomla';
	var $offline_message = 'This site is down for maintenance. Please check back again soon.';
    ```
    
    So there we have it. 
    
    ## Uploading a shell
    
    
    You can also use mysql to upload a shell
    
    