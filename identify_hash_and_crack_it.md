# Identify hash and crack it

We might find passwords or other credencials in databases or whereever. Many times these are hashed, so we need to first identify which hash it is and then try to crack it.

## Identify hash

http://www.onlinehashcrack.com/hash-identification.php
https://md5hashing.net/hash_type_checker

In kali we can use:
```
hash-identifier 
```
And then just input the hash

## Cracking the hash

Okay so now we know what hash it is, let's get cracking. We are going to use hashcat.

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