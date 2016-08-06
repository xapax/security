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