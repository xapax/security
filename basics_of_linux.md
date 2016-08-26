# Basics of linux

https://linuxjourney.com/

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
 
 
 A. Add binary to the path file
 Show the current path-variable
 `echo $PATH`
 
 Add new 
 
 ### sudo
 
 List what rights the sudo user has.
 ```
 sudo -l
```
 
 
## 2. Text-fu
 - https://linuxjourney.com/lesson/stderr-standard-error-redirect

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


 3. Vim
 - https://linuxjourney.com/lesson/regular-expressions-regex

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
