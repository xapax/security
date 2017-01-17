
# Loot Linux

## Passwords and hashes

First grab the passwd and shadow file.

```bash
cat /etc/passwd
cat /etc/shadow
```

We can crack the password using `john the ripper` like this:

```
unshadow passwd shadow > unshadowed.txt
john --rules --wordlist=/usr/share/wordlists/rockyou.txt unshadowed.txt
```


## Tcp-dump



Fast command:

```
tcpdump -i any -s0 -w capture.pcap
```

If you are on a network with other machines that you still haven't owned, it might be useful to take a tcp-dump from the machine you have owned. So that you can inspect the traffic between that machine and the other machines on the network. This might be helpful when attacking the other machines.

So after we have exploited a machine we want to use that machine to learn as much about the network as possbible. To be able to map the entire network. We want to know about switches, firewalls, routers, other computers, server, etc. We want to know what ports are open, their operating systems.

1. First we need to figure out what interfaces the machine is using.
- Ifconfig. Then we can just start tapping in on that and start to record it.

### Commands and flags
Let's start with the basics.
tcpdump - this command will output all network traffic straight to the terminal. Might be hard to understand if there is a lot of traffic.

**-A** - stands for Ascii, and output it in ascii.

**-w file.pcap ** - the w-flag will save the output into the filename of your choice. The traffic is stored in pcap-format, which is the standard packet-analysis-format. 

**-i any ** - will record traffic for all interfaces.

**-D** - show list of all interfaces

**-q** - be less verbose. Be more **quiet**

**-s** - The default size that tcpdump captures is only 96 bytes. If you want it to capture more you have to define it yourself `-s0` gives you the whole packet.

**-c** - count. Set how many packets you want to intercept. And then stop.

**port 22** - only see traffic on a specific port.

**-vvv** - Verbose. Depending on how verbose you want the output. 

### Useful commands
Lots of good stuff here
http://www.rationallyparanoid.com/articles/tcpdump.html

```
tcpdump -i wlan0 -vvv -A | grep "GET"
```
This will grep all GET from the wlan0 interface.
This will not get any SSL-encrypted traffic.

```
sudo tcpdump -i wlan0 src port 80 or dst port 80 -w port-80-recording.pcap
sudo tcpdump -i eth0 src port 80 or dst port 80 -w port-80-recording.pcap
```

Print the traffick in hex with ascii interpretation.
```
tcpdump -nX -r file.pcap
```

Only record tcp-traffic

```
tcpdump tcp -w file.pcap
```


## Sniffing for passwords

Once we have dumped some of the traffic we can insert it into metasploit and run `psnuffle` on it. It can sniff passwords and usernames from pop3, imap, ftp, and HTTP GET. This is a really easy way to find usernames and passwords from traffic that you have already dumped, or are in the process of dumping.

```
use auxiliary/sniffer/psnuffle
```

https://www.offensive-security.com/metasploit-unleashed/password-sniffing/



## References


http://www.thegeekstuff.com/2010/08/tcpdump-command-examples/
https://danielmiessler.com/study/tcpdump/
https://www.sans.org/reading-room/whitepapers/testing/post-exploitation-metasploit-pivot-port-33909

http://jvns.ca/blog/2016/03/16/tcpdump-is-amazing/
