# Basics of linux

https://linuxjourney.com/
https://github.com/jlevy/the-art-of-command-line


## 1. Basic commands
### pwd
 Print working directory
### cd
 Change directory
### ls
 list
 
 Sort list by time. -time -reverse

 ```
 ls -ltr
 ```
 
### touch
 Create a new file
### file 
 Show info about file
### cat
 Output file.
### less
Output file but thest little bit at a time
### cp
Copy
### mkdir
Make directory 
### rm
Remove
### rmdir
Remove directory
### history
Show commands history
### find
This must be by far one of the most useful programs. But I tend to always forget how it works. 
  
 ### sudo
 
 List what rights the sudo user has.
 ```
 sudo -l
```
 
## Finding files
There are three ways to find files on linux. Locate, find and which.
Locate is really fast because it relies on an internal database. So in order to have it updated you need to run
```
updatedb
```

 
## 2. Text-fu
 - https://linuxjourney.com/lesson/stderr-standard-error-redirect

### cut
 This is a useful command to cut in text. 
  
 Let's say that we have the following text, and we want to cut out the ip-address. 

```
64 bytes from 192.168.0.1: icmp_req=1 ttl=255 time=4.86 ms
```

```
cut -d" " -f4
```
 
 `-d` stands for delimiter. and `-f` for field.  

### sed - Stream editor
 
sed can perform basic editing on streams, that is to say, text.



### Show all lines just once
You have a list of passwords, or ip-addresses or whatever. And you want to remove all duplicates. How do you do it?


You have list:
```
aa
aa
bb
bb
cc
```

And you want to see: 
```
aa
bb
cc
```

Command:

```
sort file | uniq
```

`cat filename | sort -u > newFileName`


### tr - translate

Transform all letter into capital letters
```
tr "[:lower:]" "[:upper:]" < file1 > file2 
```

http://www.thegeekstuff.com/2012/12/linux-tr-command/

## Vim

### Search

In command-mode:
```
/
```

### Show line-number

```
:set number
```

```
:set nonumber
```

### Go to line
 - https://linuxjourney.com/lesson/regular-expressions-regex

### To to last line

```
G
```

## 4. User management

To add a user we write:
```
adduser NameOfUser
```

To add user to sudo-group
```
adduser NameOfUser sudo
```

Check which users are in the sudo group
```
cat /etc/group | grep sudo 
```

Switch user in terminal
```
su NameOfUser
```

Remove/delete user
```
sudo userdel NameOfUser
```

## 5. Permissions

```
ls -la
```
Shows all the files and directories and their permission settings.

```
drwxrwxrwt 2 root root 4,0K ago  3 17:33 myfile
```

Here we have 10 letters in the beginning. The first one `d` shows that it is a directory.
The next three letters are `r`for read, `w` for write and `x` for execute. The first three belong to the owner, the second three to the group, and the last three to alla users.


 - https://linuxjourney.com/lesson/file-permissions

## 6. Processes
A important job for a developer and sysadmin is to monitor process. A great way to do that is to use `htop` instead of `top`. The F1-10 keys might trigger OS-events. So you can use the shortcuts instead.  

``` 
Shortcut Key	Function Key	Description
h	                F1       	Invoke htop Help
S	                F2       	Htop Setup Menu
/	                F3       	Search for a Process
I	                F4       	Invert Sort Order
t	                F5       	Tree View
>	                F6       	Sort by a column
[	                F7       	Nice – (change priority)
]	                F8       	Nice + (change priority)
k	                F9       	Kill a Process
q	                F10     	Quit htop
 
 ```

http://www.thegeekstuff.com/2011/09/linux-htop-examples/


## 7. Packages

## Organizing your $path variable

I am talking about debian/ubuntu here. On other systems I don't know.

You can define your path in `/etc/environment`. If you don't have it you can create it and add the path like this:
```
source /etc/environment && export PATH
```
If you are using zsh (which you should) you have to add it here

```
sudo vim /etc/zsh/zshenv
```
And add this line somewhere:

```
source /etc/environment
```


### Adding a path

This is a non-persistent way to add binaries to your path. Might be useful if you have entered a system that has limited binaries in the path.

```
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

### Install package
```
sudo apt-get install
```

If you only have a .deb file you do this to install from the terminal:
```
sudo dpkg -i /path/to/deb/file
```

```
sudo apt-get install -f
```

### Remove packages
This can be tricky. First find the package
```
dpkg --list
```
Then you find it in your list.
```
sudo apt-get --purge remove nameOfProgram
```

When you remove some package it might have requires some other dependencies. To remove those you run
```
sudo apt-get autoremove
```

### Installing custom packages

If you download a package that is not in the official repository you can put the binary in `/opt`. That is good place to put your binaries.

Now you need to add that path to your path-variable. Remember how we set that in `/etc/environment`. So now open up that file and add `/opt` to it, so i looks like this.

```
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt"
```

I always add custom binaries last. That means that if we have to binaries with the same name the machine will first select the original binary. This way you won't have to fear screwing up, by accidentally creating a new `ls` binary for example.


## 8. Cronjobs

There are two ways to configure cronjobs. The first one is by putting scripts in the following folders.
```
/etc/cron.daily
/etc/cron.hourly
/etc/cron.weekly
/etc/cron.monthly
```

The second way is ti write the command in the crontab

```
crontab -l #list cronjobs
crontab -e # Edit or create new cronjobs
```

## 8. Devices

List all devices

```
fdisk -l
```


## 9. The Filesystem

### The Filesystem Hierarchy Standard

![](fss.jpg)
This image is copied from here: http://askubuntu.com/questions/138547/how-to-understand-the-ubuntu-file-system-layout/138551#138551

#### Difference between sbin and bin

sbin is system binaries. A normal user do not have access to these binaries. It is only root and users with sudo privileges that do. 

```
pelle@mymachine:/bin$ ls -la /bin
total 4092
drwxr-xr-x  2 root root   4096 2012-02-04 19:12 .
drwxr-xr-x 21 root root   4096 2012-02-06 18:41 ..
-rwxr-xr-x  1 root root 702160 2008-05-12 14:33 bash
-rwxr-xr-x  3 root root  26300 2008-03-21 06:32 bunzip2
-rwxr-xr-x  3 root root  26300 2008-03-21 06:32 bzcat
lrwxrwxrwx  1 root root      6 2012-02-04 09:51 bzcmp -> bzdiff
-rwxr-xr-x  1 root root   2128 2008-03-21 06:32 bzdiff
lrwxrwxrwx  1 root root      6 2012-02-04 09:51 bzegrep -> bzgrep
-rwxr-xr-x  1 root root   4874 2008-03-21 06:32 bzexe
lrwxrwxrwx  1 root root      6 2012-02-04 09:51 bzfgrep -> bzgrep
-rwxr-xr-x  1 root root   3642 2008-03-21 06:32 bzgrep
-rwxr-xr-x  3 root root  26300 2008-03-21 06:32 bzip2
-rwxr-xr-x  1 root root   8064 2008-03-21 06:32 bzip2recover
lrwxrwxrwx  1 root root      6 2012-02-04 09:51 bzless -> bzmore
-rwxr-xr-x  1 root root   1297 2008-03-21 06:32 bzmore
-rwxr-xr-x  1 root root  27312 2008-04-04 02:42 cat
-rwxr-xr-x  1 root root  45824 2008-04-04 02:42 chgrp
-rwxr-xr-x  1 root root  42816 2008-04-04 02:42 chmod
-rwxr-xr-x  1 root root  47868 2008-04-04 02:42 chown
-rwxr-xr-x  1 root root  71664 2008-04-04 02:42 cp
-rwxr-xr-x  1 root root 110540 2007-11-13 05:54 cpio
-rwxr-xr-x  1 root root  79988 2009-03-09 09:03 dash
-rwxr-xr-x  1 root root  55820 2008-04-04 02:42 date
-rwxr-xr-x  1 root root  48308 2008-04-04 02:42 dd
-rwxr-xr-x  1 root root  45588 2008-04-04 02:42 df
-rwxr-xr-x  1 root root  92376 2008-04-04 02:42 dir
-rwxr-xr-x  1 root root   4496 2008-09-26 08:43 dmesg
-rwxr-xr-x  1 root root   8800 2007-11-15 13:01 dnsdomainname
-rwxr-xr-x  1 root root  24684 2008-04-04 02:42 echo
-rwxr-xr-x  1 root root  40560 2008-02-29 02:19 ed
-rwxr-xr-x  1 root root  96440 2007-10-23 16:58 egrep
-rwxr-xr-x  1 root root  22192 2008-04-04 02:42 false
-rwxr-xr-x  1 root root   5740 2008-02-06 17:49 fgconsole
-rwxr-xr-x  1 root root  53396 2007-10-23 16:58 fgrep
-rwxr-xr-x  1 root root  22536 2007-11-23 05:15 fuser
-rwsr-xr--  1 root fuse  20056 2008-02-26 13:25 fusermount
-rwxr-xr-x  1 root root 100536 2007-10-23 16:58 grep
-rwxr-xr-x  2 root root     63 2007-11-15 06:49 gunzip
-rwxr-xr-x  1 root root   5874 2007-11-15 06:49 gzexe
-rwxr-xr-x  1 root root  53488 2007-11-15 06:49 gzip
-rwxr-xr-x  1 root root   8796 2007-11-15 13:01 hostname
```

We have echo, cp, grep. The normal stuff a user needs.

In sbin we have binaries that control the system. 
```
pelle@mymachine:/bin$ ls -la /sbin
total 5884
drwxr-xr-x  2 root root     4096 2012-02-04 10:01 .
drwxr-xr-x 21 root root     4096 2012-02-06 18:41 ..
-rwxr-xr-x  1 root root    18164 2008-03-27 13:25 badblocks
-rwxr-xr-x  1 root root     8276 2008-03-27 13:25 blkid
-rwxr-xr-x  1 root root     9476 2008-09-26 08:43 blockdev
-rwxr-xr-x  1 root root    53864 2008-09-26 08:43 cfdisk
-rwxr-xr-x  1 root root     3600 2008-09-26 08:43 ctrlaltdel
-rwxr-xr-x  1 root root    67712 2008-03-27 13:25 debugfs
-rwxr-xr-x  1 root root   199164 2007-07-26 06:57 debugreiserfs
-rwxr-xr-x  1 root root    31448 2008-10-06 08:51 depmod
lrwxrwxrwx  1 root root        9 2012-02-04 09:51 dhclient -> dhclient3
-rwxr-xr-x  1 root root   352392 2008-04-02 09:38 dhclient3
-rwxr-xr-x  1 root root     8170 2008-04-02 09:38 dhclient-script
-rwxr-xr-x  1 root root    43508 2008-03-12 08:24 dosfsck
-rwxr-xr-x  1 root root    12140 2008-03-27 13:25 dumpe2fs
-rwxr-xr-x  3 root root   156076 2008-03-27 13:25 e2fsck
-rwxr-xr-x  1 root root    12332 2008-03-27 13:25 e2image
-rwxr-xr-x  3 root root    23840 2008-03-27 13:25 e2label
-rwxr-xr-x  1 root root    85064 2008-09-26 08:43 fdisk
-rwxr-xr-x  3 root root    23840 2008-03-27 13:25 findfs
-rwxr-xr-x  1 root root    20020 2008-03-27 13:25 fsck
-rwxr-xr-x  1 root root     7028 2008-09-26 08:43 fsck.cramfs
-rwxr-xr-x  3 root root   156076 2008-03-27 13:25 fsck.ext2
-rwxr-xr-x  3 root root   156076 2008-03-27 13:25 fsck.ext3
-rwxr-xr-x  1 root root    22288 2008-09-26 08:43 fsck.minix
lrwxrwxrwx  1 root root        7 2012-02-04 09:57 fsck.msdos -> dosfsck
-rwxr-xr-x  1 root root      333 2009-01-23 10:01 fsck.nfs
-rwxr-xr-x  1 root root      112 2007-07-26 06:57 fsck.reiserfs
lrwxrwxrwx  1 root root        7 2012-02-04 09:57 fsck.vfat -> dosfsck
-rwxr-xr-x  1 root root    15168 2008-09-26 08:43 getty
-rwxr-xr-x  1 root root      375 2009-12-10 10:55 grub-install
lrwxrwxrwx  1 root root        6 2012-02-04 09:51 halt -> reboot
-rwxr-xr-x  1 root root    69228 2008-03-28 18:26 hdparm
-rwxr-xr-x  1 root root    31620 2008-09-26 08:43 hwclock
-rwxr-xr-x  1 root root    61808 2007-12-13 05:51 ifconfig
-rwxr-xr-x  2 root root    27372 2007-09-19 20:25 ifdown
-rwxr-xr-x  2 root root    27372 2007-09-19 20:25 ifup
-rwxr-xr-x  1 root root    89604 2008-04-11 09:50 init
-rwxr-xr-x  1 root root    56484 2008-04-11 09:50 initctl
-rwxr-xr-x  1 root root     4632 2008-10-06 08:51 insmod
-rwxr-xr-x  1 root root     1542 2008-03-31 17:11 installkernel
lrwxrwxrwx  1 root root        7 2012-02-04 09:51 ip -> /bin/ip
-rwxr-xr-x  1 root root    47448 2008-01-28 08:49 ip6tables
-rwxr-xr-x  1 root root    51680 2008-01-28 08:49 ip6tables-restore
-rwxr-xr-x  1 root root    51644 2008-01-28 08:49 ip6tables-save
-rwxr-xr-x  1 root root    10948 2007-12-13 05:51 ipmaddr
-rwxr-xr-x  1 root root    47480 2008-01-28 08:49 iptables
-rwxr-xr-x  1 root root    51712 2008-01-28 08:49 iptables-restore
-rwxr-xr-x  1 root root    49308 2008-01-28 08:49 iptables-save
-rwxr-xr-x  1 root root    14048 2008-01-28 08:49 iptables-xml
-rwxr-xr-x  1 root root    14944 2007-12-13 05:51 iptunnel
-rwxr-xr-x  1 root root     6012 2008-09-26 08:43 isosize
-rwxr-xr-x  1 root root    20596 2007-12-21 09:36 iwconfig
-rwxr-xr-x  1 root root    11784 2007-12-21 09:36 iwevent
-rwxr-xr-x  1 root root     7764 2007-12-21 09:36 iwgetid
-rwxr-xr-x  1 root root    26376 2007-12-21 09:36 iwlist
-rwxr-xr-x  1 root root     9164 2007-12-21 09:36 iwpriv
-rwxr-xr-x  1 root root     8420 2007-12-21 09:36 iwspy
-rwxr-xr-x  1 root root     6300 2008-02-06 17:49 kbdrate
```

### Mount

So everything on the linux-filesystem belongs to some part of the filesystem-tree. So if we plug in some device we need to mount it to the filesystem. That pretty much means that we need to connect it to the filesystem. Mount is like another word for connect.

So if you want to connect a CD-rom or USB to your machine. You need to mount it to a specific path on the filesystem.

So if you plug in the usb it might be accessible at `/dev/usb`. But that it not enough for you to be able to browse the usb content. You need to mount it. You do this by writing

```
mount /dev/usb /media/usb
```
Or whereever you want to mount it.

So when you click on Eject or Safetly remove you are just unmounting. 

Knowing how to mount and unmount might be useful if you want to get access to a remote NFS-directory. You will need to mount it to your filesystem to be able to browse it.


## 10. Boot the system

## 11. Kernel

## 12. Init

## 13. Process utilization

## 14. Logging

## 15. network sharing

## 16. Network basics

## 17. Subnetting

## 18. Routing

## 19. Network config

## 20. Troubleshooting

## 21. DNS
