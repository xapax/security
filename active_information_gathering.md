# Active information gathering






## Netdiscover

netdiscover -r 192.168.1.1/24

## Nmap

Now that you have gathered some IP addresses from your subdomain scanning it is time to scan those addresses. You just copy-paste those addresses and add them to a file, line bby line. Then you can scan all of them with nmap at the same time. Using the `-iL` flag.


`nmap -vvv -Pn -A -iL listOfIP.txt`

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

## Find interesting files

`site:example.com filetype:pdf`

This can easily be turned into a script that checks for all important filetypes.



## References

https://blog.bugcrowd.com/discovering-subdomains
https://high54security.blogspot.cl/2016/01/recon-ng-and-power-to-crawl-trough.html

