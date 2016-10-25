# Port forwarding and tunneling


## Port forwarding

So imagine that you are on a network and you want to connect to a ftp server (or any other port) to upload or download some files. But someone has put some crazy firewall rules (egress filters) that prohibits outgoing traffics on all ports except for port 80. So how are we going to be able to connect to our ftp-server?

What we can do is add a machine that redirect/forward all traffic that it recieves on port 80 to port 21 on a different machine.

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

### Port forward/redirect with rinetd

So we can set up this port forwaring machine with the help of rinetd.

To make it clear, we have the following machines:
Machine1 - IP: 111.111.111.111 - Behind firewall, and wants to connect to Machine2.
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

This is the essential part of the configuration file, this is where we create the port-fowarding
```
# bindadress    bindport  connectaddress  connectport


```
