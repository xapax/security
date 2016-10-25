# Port forwarding and tunneling


## Port forwarding

So imagine that you are on a network and you want to connect to a ftp server (or any other port) to upload or download some files. But someone has put some crazy firewall rules (egress filters) that prohibits outgoing traffics on all ports except for port 80. So how are we going to be able to connect to our ftp-server?

What we can do is add a machine that redirect/forward all traffic that it receives on port 80 to port 21 on a different machine.

So instead of having this kind of traffic 

```
home-computer/port-21 ----> ftp-server/port-21
```

we will have

```
home-computer/port-80 ----> port-80/proxy-machine/port-21 ----> ftp-server
```

And the other way around of course, to receive the traffic.

Okay, so how do we go about actually implementing this?

### Rinetd - Port forward/redirect

So we can set up this port forwaring machine with the help of rinetd.

To make it clear, we have the following machines:
Machine1 - IP: 111.111.111.111 - Behind firewall, and wants to connect to Machine3.
Machine2 - IP: 222.222.222.222 - Forwards incomming connections to Machine3 
Machine3 - IP: 333.333.333.333 - Hosts the ftp-server that machine1 wants to connect to.

```
apt-get install rinetd
```

This is the default config file

```
cat /etc/rinetd.conf 
#
# this is the configuration file for rinetd, the internet redirection server
#
# you may specify global allow and deny rules here
# only ip addresses are matched, hostnames cannot be specified here
# the wildcards you may use are * and ?
#
# allow 192.168.2.*
# deny 192.168.2.1?


#
# forwarding rules come here
#
# you may specify allow and deny rules after a specific forwarding rule
# to apply to only that forwarding rule
#
# bindadress    bindport  connectaddress  connectport


# logging information
logfile /var/log/rinetd.log

# uncomment the following line if you want web-server style logfile format
# logcommon
```

This is the essential part of the configuration file, this is where we create the port-forwarding
```
# bindadress    bindport  connectaddress  connectport
111.111.111.111    80     333.333.333.333       21
```

```
/etc/init.d/rinetd restart
```

So the bind-address is where the proxy receieves the connection, and the connectaddress is the machine it forwards the connection to.

## SSH Tunneling - Port forwarding on SSH

SSH Tunneling is not only useful for hackers and pentesters. It is also useful for anyone that wants to encrypt traffic that goes over unencrypted protocols. For example VNC, IMAP or IRC. But for us it might be useful if a network has a firewall that filters outgoing traffic. 

### Local port forwarding

So with local port forwarding we are just forwarding our traffic from a local port to somewhere. For example. Lets say that you have facebook.com blocked by your company. So in order to bypass this firewall we can forward all the traffic from a local port to our destination.

```
ssh -L 8081:www.facebook.com:80 localhost
```


### Remote port forwarding

### Dynamic port forwarding


## References

