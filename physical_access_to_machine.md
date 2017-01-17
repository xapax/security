# Physical access to machine

So if you have physical access to a machine that is not encrypted it is really trivial to gain access to the hard-drive and all files on it.

This is how you do it

## Create linux-usb

Just follow this guide for ubuntu
http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-ubuntu

## Boot into live-usb on victim machine

If the machine doesn't automatically detect the usb you might have to enter into the bios. This can usually be done by pressing F12 or F1 on boot. Bios looks different from machine to machine. But you need to just choose to boot from the USB-device.

## Mount disk

Now you have booted into the live-usb, now we need to mount the hard-drive to the usb-linux-filesystem.
First we want to find out what partitions we have:

```
sudo su
fdisk -l
```
This will give you a list of partitions. They will look something like this

```
/dev/sda1
/dev/sda2
```

Identify from the list the partition you want to mount.

Here we create a space for where we want to mount the partition.
```
mkdir /media/windows
```

```
mount -t ntfs /dev/sda1 /media/windows
```

`-t`means type, and refers to the filesystem-type. And we choose ntfs which is the windows-filesystem.

Now you can access all the files from the harddrive in `/media/windows`

## Umount the disk

Notice that is is `umount` and not unmount.

```
umount /media/windows
```


## Dump the hashes

https://prakharprasad.com/windows-password-cracking-using-john-the-ripper/