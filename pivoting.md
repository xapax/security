# Pivoting

Let's say that you have compromised one machine on a network and you want to keep going to another machine. You will use the first machine as a staging point/plant/foothold to break into machine 2. Thid technique of using one compromised machine to access another is called pivoting. Machine one is the `pivot` in the example. The `pivot` is just used as a way to channel/tunnel our attack. 

#### Ipconfig

We are looking for machines that have at least THREE network interfaces (loopback, eth0, and eth1 (or something)). These machines are connected to other networks, so we can use them to pivot.

```
# Windows
ipconfig /all
route print

#Linux
ifconfig
ifconfig -a
```

## Metasploit


### Ping-sweep the network

First we want to scan the network to see what devices we can target. In this example we already have a meterpreter shell on a windows machine with SYSTEM-privileges.

```
meterpreter > run arp_scanner -r 192.168.1.0/24
```
This command will output all the devices on the netowork.

### Scan each host

Now that we have a list of all available machines. We want to portscan them.





This is a good video-explanation:
https://www.youtube.com/watch?v=c0XiaNAkjJA

https://www.offensive-security.com/metasploit-unleashed/pivoting/

http://ways2hack.com/how-to-do-pivoting-attack/