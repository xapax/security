# Port Scanning




## Metasploit

We can do port-scanning with metasploit and nmap. And we can even integrate nmap into metasploit. This might be a good way to keep your process neat and organized. 

### db_nmap

You can run `db_nmap` and all the output will be stored in the metasploit database and available with 

```
hosts
services
```

You can also import nmap scans. But you must first output it in xml-format with the following flag  

```
nmap 192.168.1.107 -oX result.xml
```

Good practice would be to output the scan-results in xml, grepable and normal format. You do that with

```
nmap 192.168.1.107 -oA result
```

Then you can load it into the database with the following command. 

```
db_import /path/to/file.xml
```

### Metasploit PortScan modules

If you for some reason don't have access to nmap you can run metasploits modules that does portscans

```
use auxiliary/scanner/portscan/
```

## Nmap

Now that you have gathered some IP addresses from your subdomain scanning it is time to scan those addresses. You just copy-paste those addresses and add them to a file, line bby line. Then you can scan all of them with nmap at the same time. Using the `-iL` flag.

### Basics

Okay, so a bit of the basics of Nmap and how it works. When one machine initiate a connection with another machine using the **transmission-control protocol (tcp)** it performs what is know as a three-way handshake. That means:
```
machine1 sends a syn packet to machine2
machine2 send a syn-ack packet to machine1
machine1 sends a ack packet to machine2.
```

If machine2 responds with a syn-ack we know that that port is open. This is basically what nmap does when it scans for a port.
If machine1 omits the last ack packet the connection is not made. This can be a way to make less noise. 

```
nmap -vvv -Pn -A -iL listOfIP.txt
```

#### Stealthy

If we do not want to create a connection we can add the `-sS` flag

#### Output scan to a textfile

Not all output works with grepable format. For example NSE does not work with grepable. So you might want to use xml instead.

```
# To text-file
-oN nameOfFile

# To grepable format
-oG nameOfFile

# To xml
-oX nameOfFile

```

#### UDP scan

```
-sU
```

### Scan an entire IP-range
You might find that a site has several machines on the same ip-range. You can then use nmap to scan the whole range.

The `-sn` flag stops nmap from running port-scans. So it speeds up the process.

`nmap -vvv -sn 201.210.67.0/24`

You can also specify a specifc range, like this

`nmap -sP 201.210.67.0-100`

#### Sort out the machines that are up
So let's say you find that 40 machine exists in that range. We can use grep to output those IP:s.

First let's find the IPs that were online. Ip-range is the output from previous command. You can of course combine them all.

`cat ip-range.txt | grep -B 1 "Host is up"`

Now let's sort out the ips from that file.

`grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' ip-range.txt > onlyIps.txt`

Now you can input all those Ips to nmap and scan them.




#### Scan a range and output if a specific port is open

Nmap has a command to make the output grepable.

`nmap -vvv -p 80 201.210.67.0-100 -oG - | grep 80/open`

### Nmap scripts

This chapter could also be placed in Vulnerability-analysis and Exploitation. Because nmap scripting is a really versatile tool that can do many things. Here we will focus on it's ability to retrieve information that can be useful in the process to **find vulnerabilities** 


First locate the nmap scripts. Nmap scripts end in **nse**. For Nmap script engine.

```
locate *.nse
```

The syntax for running a script is:

```
nmap --script scriptname 192.168.1.101
```


To find the "man"-pages, the info about a script we write:

```
nmap -script-help http-vuln-cve2013-0156.nse
```

**Run multiple scripts**

Can be run by separating the script with a comma

```
nmap --script scriptone.nse,sciprt2.nse,script3.nse 192.168.1.101
```

Run the default scripts

```
nmap -sC example.com
```


