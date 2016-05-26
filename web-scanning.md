# Web-scanning

Dirbusting, Forced Browse or whatever you like to call it.

It is when you make requests to a site based on a dictionary in order to find files ir directories that are not linked anywhere on the site. If they are linked a spider can easily find it. Otherwise you have to bruteforce it.

You can use tools as: OWASP ZAP. But that has not been working out too well for me. I prefer wfuzz.

You can find the manual by typing: `wfuzz -h`

wfuzz -c -z file,/root/.ZAP/fuzzers/dirbuster/directory-list-2.3-big.txt --sc 200 http://pegasus.dev:8088/FUZZ.php
