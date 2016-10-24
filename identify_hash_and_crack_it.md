# Offline password cracking 


We might find passwords or other credentials in databases or where-ever. Many times these are hashed, so we need to first identify which hash it is and then try to crack it. The first step is to identify the hash-algortithm that was used to hash the password.

## Identify hash

There are generally speaking three pieaces of data we can use to identify a hash.
- The length  of the hash
- The character set
- Any special characters



In kali we can use **hash-identifier** or **hashid**

```
hash-identifier 
hashid
```

Or try these online services
http://www.onlinehashcrack.com/hash-identification.php
https://md5hashing.net/hash_type_checker


## Cracking the hash

Okay so now we know what hash it is, let's get cracking.

If you want to try out the functionality of hashcat or john the ripper you can find example hashes here: http://openwall.info/wiki/john/sample-hashes.

### Hashcat

Look for the specific type of hash you want to crack in the list produced by the following command:

```
hashcat --help
```

My hash was a Apache md5, so I will use the corresponding code for it, `1600`

`-a 0` - straight
`-o found.txt` - where the cracked hash outputs
`admin.hash" - the hash you want to crack.
`/usr/share/hashcat/rules/rockyou-30000.rule` - the wordlist we use

```
hashcat -m 11 -a 0 -o found.txt admin.hash /usr/share/hashcat/rules/rockyou-30000.rule
```

### John the ripper

So this is how you usually crack passwords with john

```
john --wordlist=wordlist.txt dump.txt
```

If you do not find the password you can add the john-rules. Which add numbers and such things to each password.

```
john --rules --wordlist=wordlist.txt dump.txt
```

## Online

### findmyhash

You can use findmyhash 

Here is an example of how to use it:

```
findmyhash LM -h 6c3d4c343f999422aad3b435b51404ee:bcd477bfdb45435a34c6a38403ca4364
```

Crackstation
Hashkiller
Google hashes
Search pastebin.


## Windows 
