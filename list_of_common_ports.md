# List of common ports

There are too many ports and services to write about all of them here. But still, I am going to try to write a bit about what I am learning.

## Port 22 - SSH

You can find out the version of the SSH either but scanning it with nmap or by connecting with it using `nc`

`nc 192.168.1.10 22`

It returnes something like this:
SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu1

## Port 25 - SMTP

Port 25 can be used to enumerate users.

You can connect to port 25 by using nc. Like this:

It looks like this:

`$ nc 192.168.1.103 25                                                                                                                          130 ↵
220 metasploitable.localdomain ESMTP Postfix (Ubuntu)
VRFY root
252 2.0.0 root
VRFY roooooot
550 5.1.1 <roooooot>: Recipient address rejected: User unknown in local recipient table`

Here we have managed to identify the user root. But roooooot was rejected.


VRFY, EXPN or RCPT command

Here are the documentations for SMTP
https://cr.yp.to/smtp/vrfy.html

http://www.dummies.com/how-to/content/smtp-hacks-and-how-to-guard-against-them.html
http://pentestmonkey.net/tools/user-enumeration/smtp-user-enum
https://pentestlab.wordpress.com/2012/11/20/smtp-user-enumeration/

Exploits can be found in metasploit25 can be quite useful 
And shellshock
https://www.exploit-db.com/exploits/34896/

## Port 587 - Submission

Outgoing smtp-port

If Postfix is run on it it could be vunerable to shellshock
https://www.exploit-db.com/exploits/34896/

## Port 993 - Imap Encrypted

The default port for the Imap-protocol.

## Port 995 - POP3 Encrypten

Port 995 is the default port for the *Post Office Protocol*. 
The protocol is used for clients to connect to the server and download their emails locally. 
You usually see this port open on mx-servers. Servers that are meant to send and recieve email.

Related ports: 
110 is the POP3 non-encrypted.
25, 465

