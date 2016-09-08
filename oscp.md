# OSCP

So part of the reason I have been working on this document/notepad/book is to prepare for the oscp exam.

Here are its guide-lines
https://support.offensive-security.com/#!oscp-exam-guide.md

## Highlights From the Guide

### Exam Proofs: Linux

> On all Linux targets, you must have a root shell to receive full points. You must provide the contents of the proof files IN A SHELL (web, bind, reverse, or ssh) with the "cat" command from their original location. Obtaining the contents of the proof files in any other way will result in zero points for the target machine.


### Forbidden tools

- Spoofing (IP, ARP, DNS, NBNS, etc)
- Commercial tools or services (Metasploit Pro, Burp Pro, etc.)
- Automatic exploitation tools (e.g. db_autopwn, browser_autopwn, SQLmap, SQLninja etc.)
- Mass vulnerability scanners (e.g. Nessus, NeXpose, OpenVAS, Canvas, Core Impact, SAINT, etc.)
- Features in other tools that utilize either forbidden or restricted exam limitations

### Exam restrictions

> The usage of Metasploit is restricted for the exam. You can only use Metasploit Auxiliary, Exploit, and Post modules against one target machine of your choice. Once you have selected your one target machine, you can not use Metasploit Auxiliary, Exploit, and Post modules against any other machines.

```
multi handler (aka exploit/multi/handler)
meterpreter
msfpayload & msfencode
msfvenom
```