


## Forward traffic through a windows machine / Bridge connections on windows
Case:
You need to forward traffic from your computer through a windows-computer. This might be because you can't connect your own machine on the network.


### Bridge
You can of course bridge two connections. But that might not be want you want, since that will effectivly add your computer to the local LAN. This will allow other computers on the network to connect to yours. The sysadmins might also wonder what your computer is doing there, which computer it is that has that IP address.


In windows 7 you do the following to bridge two networks:


```
Control Panel / Network and internet / Network and sharing center / Change adapter settings / 
Mark both Interfaces at the same time, right-click on them and click on "Bridge interfaces".
```

Now on your client-computer you just have to put the interface in DHCP mode, and you will receive an IP-address.

### LAN
If you prefer to work from your private LAN that can be arranged too.
You need two network interfaces for it to work. One connected to the internet (or other LAN) and another connected to your computer (or a switch or whatever).

Once that is done you go to:

```
Control Panel / Network and internet / Network and sharing center
```

Right click on the network interface that is connected to the internet (usually called something like Local Area Connection 1).
Click on `Properties` then `Sharing` then click on `Allow other network computer users ...`.

Now if you run ipconfig your other network interface should have a LAN ip. For example `192.168.137.1`.


Now you just take your other computer and just configure a static ip address for it, for example

```
Maybe delete the previous ip-address:

sudo ip a del 192.168.66.55/24 dev eth0

Then add a new
sudo ip a add 192.168.137.2/24 dev eth0

Then add some routes:
sudo ip r add default via 192.168.137.1 dev eth0
```


