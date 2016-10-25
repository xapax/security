# Commands

You can find all the commands in for metasploit here:

https://www.offensive-security.com/metasploit-unleashed/msfconsole-commands/

I just want to highlight some really useful commands.

## setg
With `setg` you can set global variables. Like instead of having to enter `set LHOST 192.168.1.101` for every payload and listener with `setg` those will be automatically filled in with your global values. You can enter `save` to save the global values so they persist from one session to the other.

## Populate RHOSTS from database

This is an incredibly useful feature. 

First you choose the auxilary module. Then yo just do

```
services -p 139 --rhosts
run
```