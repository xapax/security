# Firewalls

## Terminology

Let's start with some terminology. We often hear the words **egress filtering** and **ingress** in connection to talk about firewalls and routers.


**Egress filtering**
This basically means that we are filtering outgoing traffic.So egress filtering ensures that malicious, or just prohibited, traffic is not allowed to leave the network. Of course egress filtering then is the enemy of the hacker. 

## Port forwarding

So imagine that you are on a network and you want to connect to a ftp server to upload or download some files. But someone has put some crazy firewall rules (egress filters) that prohibits outgoing traffics on all ports except for port 80. So how are we going to be able to connect to our ftp-server?

What we can do is add a machine that redirect/forward all traffic that it recieves on port 80 to port 21 on a different machine.

So instead of having this kind of traffic 

```
home-computer/port-21 ----> ftp-server/port-21
```

we will have

```
home-computer/port-80 ----> port-80/proxy-machine/port-21 ----> ftp-server
```

And the other way around of course, to recieve the traffic.