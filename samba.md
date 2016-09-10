# Samba

Samba, or smbd (samba daemon), is a server that provide file-sharing for windows machines.


You can connect to samba the following way

```
smbclient //192.168.1.106/tmp
```

```
smbclient \\\\192.168.1.105\\ipc$ -U john 
```

```
smbclient //192.168.1.105/ipc$ -U john  
```