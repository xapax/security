# Find hidden files and directories

Dirbusting, Forced Browse or whatever you like to call it.

It is when you make requests to a site based on a dictionary in order to find files ir directories that are not linked anywhere on the site. If they are linked a spider can easily find it. Otherwise you have to bruteforce it.

##Tools
OWASP ZAP

Insert your target.
Add it to the context
Click the plus-sign
Click on Forced Browse

### Wfuzz

You can find the manual by typing: `wfuzz -h`

wfuzz -c -z file,/root/.ZAP/fuzzers/dirbuster/directory-list-2.3-big.txt --sc 200 http://pegasus.dev:8088/FUZZ.php

### Dirb
This is a really easy tool to use:

`dirb http://target.com`

### Dirbuster

It is a GUI
You start it with `dirbuster` from the terminal



## WAF - Web application firewall

It might be that dirb shows you 403 errors, instead of the expected 404. This might mean that there is a WAF protecting the site. To get around it we might have to change our request header to it looks more like a normal request. 

`dirb http://target.com -a "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36"`


### CMS-Scanning 
There are several tools that you can use to scan Content-management-systems for vulnerabilities. These vulnerabilities can be login-bypass, sql-injections, xss, etc.
wpscan