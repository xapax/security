# Transfering files

The easiest way normally is to use netcat. 

So on the victim-machine we run nc like this:
```nc -lvp 3333 > enum.sh```

ANd on the attacking machine we send the file like this:

```nc 192.168.1.103 < enum.sh```

Wget

server



ftp

ssh
