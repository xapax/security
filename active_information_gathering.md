# Active information gathering



## Find subdomains

Finding subdomains is fundamental. The more subdomains you find, the bigger attack surface you have. Which means bigger possibility of success.

For now this seems to be a very comprehensive list of tools to find subdomains.
https://blog.bugcrowd.com/discovering-subdomains

This isn't really a science. Some tools find some stuff, other tools other stuff. So your best bet is to use a few of them together. Don't forget to brute-force recursivly!

But before we begin to look at the specific techniques that exists to find subdomains, lets try to understand what subdomains are and how they work.

AAAA
CNAME
SOA
TXT
#### MX - Mail exchange

https://en.wikipedia.org/wiki/MX_record

### recon-ng
In order to find subdomains we can use the recon-ng framework. It has the same basic structure as metasploit. You can learn more about this tool in the tools-section.

`recon-ng`

`use use recon/domains-hosts/`

This will give you a vast amount of alternatives.

`show options`

`set source cnn.com`


All these subdomains will be saved in `hosts`, which you can access though: `show hosts`

If some of these subdomains are not given IPs automatically you can just run
`use recon/hosts-hosts/resolve`
`run`

And it will resolve all the hosts in the hosts-file. 


### Google Dorks
Using google we can also find subdomains.

This will only give us the subdomains of a site.

`site:msn.com -site:www.msn.com`

`site:*.nextcloud.com`

To exclude a specific subdomain you can do this:
`site:*.nextcloud.com -site:help.nextcloud.com`

### subbrute.py

The basic command is like this

`./subbrute.py -p cnn.com`

https://github.com/TheRook/subbrute

### Knock
I haven't tested this yet.
https://github.com/guelfoweb/knock


### Reverse DNS-lookup

If you manage to figure out the IP range that the target owns. 

### Being smart

You also have to look at what kind of system the target has. Some web-apps give their clients their own subdomains. Like github.

1. Check out the homepage
Often companies brag about their clients. You can use this to guess the subdomains of some clients.




### Online tools

#### DNSDumpster
https://dnsdumpster.com/

#### Pentest-tools
https://pentest-tools.com/information-gathering/find-subdomains-of-domain

#### Intodns
http://www.intodns.com/

#### DNSStuff
This tool doesn't enumerate subdomains per se. But it hands of a lot of information about domains.
http://www.dnsstuff.com/


### Brute force dictionaries

If you try to brute force the domains it is a good idea to have a good dictionary. That can be found here:

Bitquark
https://github.com/bitquark/dnspop

SecList
https://github.com/danielmiessler/SecLists/tree/master/Discovery/DNS
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

