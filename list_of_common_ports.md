# List of common ports

There are too many ports and services to write about all of them here. But still, I am going to try to write a bit about what I am learning.

## Port 22 - SSH

You can find out the version of the SSH either but scanning it with nmap or by connecting with it using `nc`

`nc 192.168.1.10 22`

It returnes something like this:
SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu1

## Port 25 - SMTP

SMTP is a server to server service. The user receives or sends emails using IMAP or POP3. Those messages are then routed to the SMTP-server which communicates the email to another server.
The SMTP-server has a database with all emails that can receive or send emails. We can use SMTP to query that database for possible emails. 

Here are the possible commands

```
HELO - 
EHLO - Extended SMTP.
STARTTLS - SMTP communicted over unencrypted protocol. By starting TLS-session we encrypt the traffic.
RCPT - Address of the recipient.
DATA - Starts the transfer of the message contents.
RSET - Used to abort the current email transaction.
MAIL - Specifies the email address of the sender.
QUIT - Closes the connection.
HELP - Asks for the help screen.
AUTH - Used to authenticate the client to the server.
VRFY - Asks the server to verify is the email user's mailbox exists.
```

### Manually
We can use this service to find out which usernames are in the database. This can be done in the following way.

```
$ nc 192.168.1.103 25                                                                               
220 metasploitable.localdomain ESMTP Postfix (Ubuntu)
VRFY root
252 2.0.0 root
VRFY roooooot
550 5.1.1 <roooooot>: Recipient address rejected: User unknown in local recipient table
```

Here we have managed to identify the user root. But roooooot was rejected.

VRFY, EXPN or RCPT command

### Automatized

This process can of course be automatized

#### smtp-user-enum
The command will look like this. `-M` for mode. `-U` for userlist. `-t` for target

```
$ smtp-user-enum -M VRFY -U /root/sectools/SecLists/Usernames/Names/names.txt -t 192.168.1.103
```
```
Mode ..................... VRFY
Worker Processes ......... 5
Usernames file ........... /root/sectools/SecLists/Usernames/Names/names.txt
Target count ............. 1
Username count ........... 8607
Target TCP port .......... 25
Query timeout ............ 5 secs
Target domain ............ 

######## Scan started at Sun Jun 19 11:04:59 2016 #########
192.168.1.103: Bin exists
192.168.1.103: Irc exists
192.168.1.103: Mail exists
192.168.1.103: Man exists
192.168.1.103: Sys exists
######## Scan completed at Sun Jun 19 11:06:51 2016 #########
5 results.

8607 queries in 112 seconds (76.8 queries / sec)
```

#### Metasploit

I can also be done using metasploit

```
msf > use auxiliary/scanner/smtp/smtp_enum 
msf auxiliary(smtp_enum) > show options

Module options (auxiliary/scanner/smtp/smtp_enum):

   Name       Current Setting                                                Required  Description
   ----       ---------------                                                --------  -----------
   RHOSTS                                                                    yes       The target address range or CIDR identifier
   RPORT      25                                                             yes       The target port
   THREADS    1                                                              yes       The number of concurrent threads
   UNIXONLY   true                                                           yes       Skip Microsoft bannered servers when testing unix users
   USER_FILE  /usr/share/metasploit-framework/data/wordlists/unix_users.txt  yes       The file that contains a list of probable users accounts.
```

Here are the documentations for SMTP
https://cr.yp.to/smtp/vrfy.html

http://null-byte.wonderhowto.com/how-to/hack-like-pro-extract-email-addresses-from-smtp-server-0160814/
http://www.dummies.com/how-to/content/smtp-hacks-and-how-to-guard-against-them.html
http://pentestmonkey.net/tools/user-enumeration/smtp-user-enum
https://pentestlab.wordpress.com/2012/11/20/smtp-user-enumeration/

Exploits can be found in metasploit25 can be quite useful 
And shellshock
https://www.exploit-db.com/exploits/34896/

## Port 443 - HTTPS

Okay this is only here as a reminder to always check for SSL-vulnerabilities such as heartbleed. Search for heartbleed in this book to find out how to exploit it.


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

## VNC 5900

VNC is used to get a screen for a remote host. But some of them have some exploits.

You can use vncviewer to connect to a vnc-service. Vncviewer comes built-in in Kali.

It defaults to port 5900, so if the machine is using some other port 
```
vncviewer 192.168.1.109
```

### Metasploit scanner

You can scan VNC for logins, with bruteforce. 

**Login scan**
```
use auxiliary/scanner/vnc/vnc_login
set rhosts 192.168.1.109
run
```

**Scan for no-auth**
```
use auxiliary/scanner/vnc/vnc_none_auth
set rhosts 192.168.1.109
run
```
