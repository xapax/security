# Common ports/services and how to use them

There are too many ports and services to write about all of them here. But still, I am going to try to write a bit about what I am learning.

## Port 22 - SSH

You can find out the version of the SSH either but scanning it with nmap or by connecting with it using `nc`

```
nc 192.168.1.10 22
```

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

## Port 110 - Pop3

```
telnet 192.168.1.105 110
USER pelle@192.168.1.105
PASS admin
```

## Port 139 and 445- SMB/Samba shares

Samba is a service that enables the user to share files with other machines. It has interoperability, which means that it can share stuff between unix and windows systems. A windows user will just see an icon for a folder that contains some files. Even though the folder and files really exists on a unix-server.

### Connecting
For linux-users you can log in to the smb-share using smbclient, like this:

```
smbclient -L 192.168.1.102
```

If you don't provide any password, just click enter, the server might show you the different shares and version of the server. This can be useful information for looking for exploits. There are tons of exploits for smb.

So smb, for a linux-user, is pretty much like and ftp or a nfs.

Here is a good guide for how to configure samba:
https://help.ubuntu.com/community/How%20to%20Create%20a%20Network%20Share%20Via%20Samba%20Via%20CLI%20(Command-line%20interface/Linux%20Terminal)%20-%20Uncomplicated,%20Simple%20and%20Brief%20Way!


### Scanning with nmap
Scanning for smb with Nmap

```
nmap -p 139,445 192.168.1.1/24 
```
There are several NSE scripts that can be useful, for example:

Find them here in kali

```
ls -l /usr/share/nmap/scripts/smb*
```

```
nmap -p 139,445 192.168.1.1/24 --script smb-enum-shares.nse smb-os-discovery.nse
```

### nbtscan

```
nbtscan -r 192.168.1.1/24
```
It can be a bit buggy sometimes so run it several times to make sure it found all users.

#### Enum4linux

Enum4linux can be used to enumerate windows and linux machines with smb-shares. 

The do all option
```
enum4linux -a 192.168.1.120
```

For info about it ere: https://labs.portcullis.co.uk/tools/enum4linux/

### rpcclient

You can also use rpcclient to enumerate the share.

Connect with a null-session. That is, without a user. This only works for older windows servers.

```
rpcclient -U "" 192.168.1.101
```

Once connected you could enter commands like

```
srvinfo
enumdomusers
getdompwinfo

```

## Port 161 and 162 - SNMP

Simple Network Management Protocol

SNMP protocols 1,2 and 2c does not encrypt its traffic. So it can be intercepted to steal credencials.

SNMP is used to manage devices on a network. It has some funny terminology. For example, instead of using the word password the word community is used instead. But it is kind of the same thing. A common community-string/password is public.

You can have read-only access to the snmp.Often just with the community string `public`. 

Common community strings
```
public
private
community
```

Here is a longer list of common communiyt strings: https://github.com/danielmiessler/SecLists/blob/master/Miscellaneous/wordlist-common-snmp-community-strings.txt

### MIB - Management information base

SNMP stores all teh data in the Management Information Base. The MIB is a database that is organized as a tree. Different branches contains different information. So one branch can be username information, and another can be processes running. The "leaf" or the endpoint is the actual data. If you have read-access to the database you can read through each endpoint in the tree. This can be used with snmpwalk. It walks through the whole database tree and outputs the content.

#### snmpwalk
```
snmpwalk -c public -v1 192.168.1.101 #community string and which version
```

This command will output a lot of information. Way to much, and most of it will not be relevant to us and much we won't understand really. So it is better to request the info that you are interested in. Here are the locations of the stuff that we are interested in:

```
1.3.6.1.2.1.25.1.6.0 System Processes
1.3.6.1.2.1.25.4.2.1.2 Running Programs
1.3.6.1.2.1.25.4.2.1.4 Processes Path
1.3.6.1.2.1.25.2.3.1.4 Storage Units
1.3.6.1.2.1.25.6.3.1.2 Software Name
1.3.6.1.4.1.77.1.2.25 User Accounts
1.3.6.1.2.1.6.13.1.3 TCP Local Ports
```

Now we can use this to query the data we really want.

#### snmpenum


#### snmpcheck

### Scan for open ports - Nmap
Since SNMP is using UDP we have to use the `-sU` flag.
```
nmap -iL ips.txt -p 161,162 -sU --open -vvv -oG snmp-nmap.txt
```

### Onesixtyone

With onesixtyone you can test for open ports but also brute force community strings.
I have had more success using onesixtyone than using nmap. So better use both.

```

```

### Metasploit

There are a few snmp modules in metasploit that you can use. snmp_enum can show you usernames, services, and other stuff.

https://www.offensive-security.com/metasploit-unleashed/snmp-scan/

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

## Port 2049 - NFS

Network file system
This is a service used so that people can access certain parts of a remote filesystem. If this is badly configured it could mean that you grant exessive access to users.

If the service is on its default port you can run this command to see what the filesystem is sharing
```
showmount -e 192.168.1.109
```

Then you can mount the filesystem to your machine using the following command

```
mount -t 192.168.1.109:/ /tmp/NFS
```
Now we can go to /tmp/NFS and check out /etc/passwd, and add and remove files.

## Port 5900 - VNC

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
