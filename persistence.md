# Persistence - Rootkit - Backdoor

So if you manage to compromise a system the system might die for whatever reason. If you have used an exploit that messes with the machine the user might want to reboot, and if the user reboots you will lose your shell.

Or, maybe the way to compromise the machine is really complicated or noisy and you don't want to go through the hassle of doing it all again. So instead you just create a backdoor that you can enter fast and easy.

## Create a new user

The most obvious, but not so subtle way is to just create a new user (if you are root, or someone with that privilege) 

```
adduser pelle
adduser pelle sudo
```

Now if the machine has ssh you will be able to ssh into the machine.

## 
If you have a meterpreter shell you can easily just run. 