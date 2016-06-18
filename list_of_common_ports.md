# List of common ports

There are too many ports and services to write about all of them here. But still, I am going to try to write a bit about what I am learning.

## Port 22 - SSH

You can find out the version of the SSH either but scanning it with nmap or by connecting with it using `nc`

`nc 192.168.1.10 22`

It returnes something like this:
SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu1

## Port 25 - SMTP

Exploits can be found in metasploit

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

