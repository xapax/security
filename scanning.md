# Recon

So once you have decided on a target you want to start your recon-process. 

## Find subdomains

This isn't really a sience. Some tools find some stuff, other tools other stuff. So your best bet is to use a few of them together.

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

### Pentest-tools
https://pentest-tools.com/information-gathering/find-subdomains-of-domain

## Netdiscover

netdiscover -r 192.168.1.1/24

## Nmap

Now that you have gathered some IP addresses from your subdomain scanning it is time to scan those addresses. You just copy-paste those addresses and add them to a file, line bby line. Then you can scan all of them with nmap at the same time. Using the `-iL` flag.


`nmap -vvv -Pn -A -iL listOfIP.txt`


## References
https://high54security.blogspot.cl/2016/01/recon-ng-and-power-to-crawl-trough.html