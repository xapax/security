# Loot


## Meterpreter

If you have a meterpreter shell you are able to do a lot of thing with very little effort.
If you do not have a meterpreter-shell you can always create a exploit with msfvenom. An elf or exe or other format to upgrade your shell.




Show help of all commands:
```
-h
```

Dump windows hashes for further analysis
```
hashdump
```

Keylogger
```
keysscan_start
keyscan_dump
keyscan_stop
```

Webcam commands
```
record_mic     Record audio from the default microphone for X seconds
webcam_chat    Start a video chat
webcam_list    List webcams
webcam_snap    Take a snapshot from the specified webcam
webcam_stream  Play a video stream from the specified webcam
```


## Dumping password on windows

This most likely requires administrative rights, that's why the chapter is found here and not in priv-esc. Once you have a hash you can move on tto the Password Cracking-chapter where we discuss different techniques of cracking hashes.

Windows stores passwords in SAM - Security Account Manager. Passwords are stored differently depending on the operating system. Up until (and including) Windows 2003 stored the passwords in LAN Manager (LM) and NT LAN Manager (NTLM). LM is incredibly insecure.From windows vista and on the system does not use LM, only NTLM. So it is a bit more secure.

**LM and NTLM >= Windows 2003**

**NTLM > Windows vista**

### LM Hashes

LM hashes can be reaully easy to crack. The LM part in the example below is the first part.

```
Administrator:500:FA21A6D3CF(01B8BAAD3B435B51404EE:C294D192B82B6AA35C3DFCA81F1F59BC:::
```

Example of NT
```
Administrator:500:NO PASSWORD*********************:BE134K40129560B46534340292AF4E72:::
```

### fgdump.exe

We can use fgdump.exe (locate fgdump.exe on kali) to extract NTLM and LM Password hashes. Run it and there is a file called 127.0.0.1.pwndump where the hash is saved. Now you can try to brute force it. 


### Windows Credencial Editor (WCE)

WCE can steal NTLM passwords from memory in cleartext!
There are different versions of WCE, one for 32 bit systems and one for 64 bit. So make sure you have the right one.

You can run it like this
```
wce32.exe -w
```

### Pwdump 7

http://www.tarasco.org/security/pwdump_7/

