## Tools 

## Android debuging bridge (ADB)

To interact with the cellphone you can use adb.

On debian you install it like this.

```
sudo apt-get install android-tools-adb
```

Then you connect the phone over usb to your machine. And open the phone, to allow the phone to connect to your computer. 

The you can see the device by running 

```
adb devices
adb shell
```


### Why am i getting permission denied?


Add your user to the plugdev group.

```
sudo usermod -aG plugdev $LOGNAME
```

Fix the udev rules:

```
sudo apt-get install android-sdk-platform-tools-common
```

Not found in kali repo. But in debian repo.

https://wiki.debian.org/SourcesList

Add debian sources and update


vim /etc/apt/sources.list

```
deb http://deb.debian.org/debian buster main contrib non-free
deb-src http://deb.debian.org/debian buster main contrib non-free

deb http://deb.debian.org/debian-security/ buster/updates main contrib non-free
deb-src http://deb.debian.org/debian-security/ buster/updates main contrib non-free

deb http://deb.debian.org/debian buster-updates main contrib non-free
deb-src http://deb.debian.org/debian buster-updates main contrib non-free
```

```
sudo apt update
```

```
sudo apt-get install android-sdk-platform-tools-common
```


### Why is my device getting removed if forwarded via qemu-kvm?

If you have forwarded your mobile device to your VM in qemu-kvm and it keeps getting removed, it might be fixed by adding this to your grub file



```
vim /etc/default/grub

GRUB_CMDLINE_LINUX_DEFAULT="usbcore.autosuspend=-1"

update-grub
reboot
```


### Drozer


https://github.com/mwrlabs/drozer/releases

```
dpkg -i drozeretc
sudo apt -f install
sudo dpkg -i drozer


drozer console connect --server 10.42.0.11 --password
```



If you are using ADB you can run

```
adb forward tcp:31415 tcp:31415
drozer console connect
```


Drozer is not being maintained anymore. So it might be time to move on to other tools.

