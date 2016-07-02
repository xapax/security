# Find Subdomains


Finding subdomains is fundamental. The more subdomains you find, the bigger attack surface you have. Which means bigger possibility of success.

For now this seems to be a very comprehensive list of tools to find subdomains.
https://blog.bugcrowd.com/discovering-subdomains

This isn't really a science. Some tools find some stuff, other tools other stuff. So your best bet is to use a few of them together. Don't forget to brute-force recursivly!

But before we begin to look at the specific techniques that exists to find subdomains, lets try to understand what subdomains are and how they work.

* A - records
The A record maps a name to one or more IP addresses, when the IP are known and stable.
So that would be 123.244.223.222 => example.com

AAAA - points to a IPv6 Record 

* CNAME
The CNAME record connects a name to another name. An example of that would be:

www.example.com,CNAME,www.example.com.cdn.cloudflare.net.

Another example is. If you have the domains mail.example.com and webmail.example.com. You can have webmail.example.com point to mail.example.com. So anyone visiting webmail.example.com will see the same thing as mail.example.com. It will NOT redirect you. Just show you the same content.

Another typical usage of CNAME is to link www.example.com to example.com

CNAME is quite convenient. Because if you change the A-record. The IP-address, you don't need to change the other subdomains, like ftp.example.com or www.example.com. Since they both point to example.com, which is a A-record and points directly to the IP.

Another note.
If foo.example.com points to bar.example.com, that mean that bar.example.com is the CNAME (Canonical/real/actual Name) of foo.example.com.



* Alias
Kind of like CNAME in that it points to another name, not an IP.

* MX - Mail exchange

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



### Being smart

You also have to look at what kind of system the target has. Some web-apps give their clients their own subdomains. Like github.

1. Check out the homepage
Often companies brag about their clients. You can use this to guess the subdomains of some clients.


### Reverse DNS-lookup

If you manage to figure out the IP range that the target owns (see section about nmap below). You can see which machines are online. And then you can run a script to find out the domain-addresses of those machines. That way you might find something new.

The text-file onlyIps.txt is a textfile with one IP-address on each line.

`#!/bin/bash

while read p; do
  echo $p;
  host  $p
done <onlyIps.txt`

Here are some more tools that can do reverse lookup
http://www.cyberciti.biz/faq/how-to-test-or-check-reverse-dns/


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


References
https://en.wikipedia.org/wiki/CNAME_record


