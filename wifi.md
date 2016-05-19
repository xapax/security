# Wifi


There are quite a few different security mechanism on wifi. And each of them require a different tactic. This article outlines the different strategies quite well. http://null-byte.wonderhowto.com/how-to/hack-wi-fi-selecting-good-wi-fi-hacking-strategy-0162526/


This is a great guide to the many different ways to hack wifi.
### Checking what networks are avalible

`sudo iwlist wlan0 scanning` - scans for wifis

### Hacking WPA2-wifis Using airmon-ng and cowpatty
What we are going to to here it basically just to record the 4-way handshake and then run a dictionary attack on it. The good part about this strategy is that you won't have to interfere to much with the network and thereby risk of taking down their wifi. The bad part is that if you run a dictionary attack there is always the possibility that the password just isn't in the list.

1. Start airmon-ng
 - `airmon-ng start wlan0`
 - This puts the network card in monitoring mode.
 - This will create a network interface that you can use to monitor wifi-action. This interface is usually called mon0 or something like that. You see the name when you run the command.

2. Run airodump to see what is passing through the air
 - Now we want to see what access points are available to us. 
 - `airodump-ng -i mon0`
 - This would output something like this:
```CH 13 ][ Elapsed: 6 s ]

BSSID              PWR  Beacons    #Data, #/s  CH  MB   ENC  CIPHER AUTH ESSID

E8:DE:27:31:15:EE  -62       40       54    0  11  54e  WPA2 CCMP   PSK  myrouter
A8:A6:68:D4:1C:91  -80        7        0    0  11  54e  WPA2 CCMP   PSK  DKT_D24D81
B4:EE:B4:80:76:72  -84        5        0    0   6  54e  WPA2 CCMP   PSK  arrisNetwork
```
So what is all this?
`BSSID` - This is the mac-address of the access point.
`PWR` - Signal strength. The higher (closer to 0) the strength the stronger is the signal. In the example above it is myrouter that has the strongest signal.



http://radixcode.com/hackcrack-wifi-password-2015-step-step-tutorial/



