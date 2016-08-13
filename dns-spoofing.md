# DNS-spoofing

This attack can also me called DNS cache posining.
This attack is also performed on a already compromised network. It is pretty much like Arp-spoofing. But instead of relying traffic we are directing the user to visit a fake web-site that we have set up.

We set up a webpage that is a clone of facebook.com. We intercept the dns-traffic, and everytime the target sends a request to a dns-server to resolve facebook.com we intercept that request and directs the user to our clone.