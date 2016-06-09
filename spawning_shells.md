# Spawning shells


1. What is a shell?
2. Why do we need to spawn shells?
If you have a non-tty-shell there are certain commands and stuff you can't do. This can happen if you upload reverse shells on a webserver, so that the shell you get is by the user www-data, or similar. These users are not meant to have shells as they don't interact with the system has humans do. 

So if you don't have a tty-shell you can't run `su`, `sudo` for example. This can be annoying if you manage to get a root password but you can't use it.

Anyways, if you get one of these shells you 

Ways to spawn a shell

Using python
```python -c 'import pty; pty.spawn("/bin/sh")'```


`echo 'os.system('/bin/bash')'`

`/bin/sh -i`

http://pentestmonkey.net/blog/post-exploitation-without-a-tty



## References:
http://unix.stackexchange.com/questions/122616/why-do-i-need-a-tty-to-run-sudo-if-i-can-sudo-without-a-password

http://netsec.ws/?p=337