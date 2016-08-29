# Basics



## Set up fast cache search

If you try to search in metasploit it will tell you that it uses slow search. Because it hasn't build up the cache. To solve this we have to run

```
msfdb init
```

Then we wait a few minutes. And then check to see if the databse is connected.
First we enter 
```
msfconsole
db_status
```

It should say that the database is connected. If it is, then we run:

```
msfconsole
db_rebuild_cache
```



It will take a few minutes. And then you will be able to use fast search.

## Exploits

An exploit is a module that has a payload.
An explout without a payload is a auxiliary module.


```
msfconsole
```

Exploits are graded from something to excellent. Exploits that are excellent should not crash the system you try to exploit.


You can either find modules right in metasplot, or on their website: http://www.rapid7.com/db/modules

### Msfcli
Msfcli has been deprecated and you should use the `-x`option in msfconsole instead.


### Msfconsole

Msfconsole is where we usually work. This is the most common metasploit interface.

### Update metasploit

```
msfupdate
```

### Search in metasploit

```
searchsploit
```

## 