# Internal Enumeration - Windows

Many priv-esc techniques on windows comes from third-party programs and not necessarily windows in itself. Therefore it is important to really learn to enumerate the system and find those vulnerable programs.


http://netsec.ws/?cat=64

http://netsec.ws/?p=314

## Info about the system



```
systeminfo
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
hostname

#Who am I?
whoami
echo %username%

#What users are on the machine?
net users

#More info about a specific user
net user user1
```

## Network

```
ipconfig /all

route print

#Display all available interfaces
arp -A
```

### Active connections

```
netstat -ano

#Firewall rules
netsh firewall show state
netsh firewall show config
```
So how should we interpret the netstat output? Here is an example, now what does this mena?

```
Proto  Local address      Remote address     State        User  Inode  PID/Program name
    -----  -------------      --------------     -----        ----  -----  ----------------
    tcp    0.0.0.0:21         0.0.0.0:*          LISTEN       0     0      -
    tcp    0.0.0.0:5900       0.0.0.0:*          LISTEN       0     0      -
    tcp    0.0.0.0:6532       0.0.0.0:*          LISTEN       0     0      -
    tcp    192.168.1.9:139    0.0.0.0:*          LISTEN       0     0      -
    tcp    192.168.1.9:139    192.168.1.9:32874  TIME_WAIT    0     0      -
    tcp    192.168.1.9:445    192.168.1.9:40648  ESTABLISHED  0     0      -
    tcp    192.168.1.9:1166   192.168.1.9:139    TIME_WAIT    0     0      -
    tcp    192.168.1.9:27900  0.0.0.0:*          LISTEN       0     0      -
    tcp    127.0.0.1:445      127.0.0.1:1159     ESTABLISHED  0     0      -
    tcp    127.0.0.1:27900    0.0.0.0:*          LISTEN       0     0      -
    udp    0.0.0.0:135        0.0.0.0:*                       0     0      -
    udp    192.168.1.9:500    0.0.0.0:*                       0     0      -
```

**Important to understand**
Local address 0.0.0.0 means that the service is listening on all interfaces. This means that it can recieve a connection from the network card, from the loopbak interface or any other interface. 

Local address 127.0.0.1 means that the service is only listening for connection from the your PC. Not from the internet or anywhere else.

Local address 192.168.1.9 means that the service is only listening for connections from the local network. So someone in the local network can connect to it, but not someone from the internet. 

### Processes running

```
# The cronjob of windows
schtasks /query /fo LIST /v

# Running processes
tasklist /SVC
net start


# List all drivers
driverquery

```


### List all patches

```
wmic qfe get Caption,Description,HotFixID,InstalledOn
```

## References

http://www.fuzzysecurity.com/tutorials/16.html