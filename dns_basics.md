# DNS Basics


This is the best article I have found about how the DNS-system works. Form the highest to the lowest level.

[An introduction to dns-terminology components and concepts](https://www.digitalocean.com/community/tutorials/an-introduction-to-dns-terminology-components-and-concepts)

Before we begin to look at the specific techniques that exists to find subdomains, lets try to understand what subdomains are and how they work.

** A - records **

A stands for **address**.

The A record maps a name to one or more IP addresses, when the IP are known and stable.
So that would be 123.244.223.222 => example.com

**AAAA** - points to a IPv6 Record 

** CNAME **

The CNAME record connects a name to another name. An example of that would be:

```
www.example.com,CNAME,www.example.com.cdn.cloudflare.net.
```

Another example is. If you have the domains mail.example.com and webmail.example.com. You can have webmail.example.com point to mail.example.com. So anyone visiting webmail.example.com will see the same thing as mail.example.com. It will NOT redirect you. Just show you the same content.

Another typical usage of CNAME is to link www.example.com to example.com

CNAME is quite convenient. Because if you change the A-record. The IP-address, you don't need to change the other subdomains, like ftp.example.com or www.example.com. Since they both point to example.com, which is a A-record and points directly to the IP.

Another note.
If foo.example.com points to bar.example.com, that mean that bar.example.com is the CNAME (Canonical/real/actual Name) of foo.example.com.



** Alias **

Kind of like CNAME in that it points to another name, not an IP.

** MX - Mail exchange **

https://en.wikipedia.org/wiki/MX_record
