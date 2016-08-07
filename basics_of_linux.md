# Basics of linux

https://linuxjourney.com/

1. Basic commands
 - pwd
 - cd
 - ls
 - touch
 - file 
 - cat
 - less
 - cp
 - mkdir 
 - rm
 - rmdir
 - history
 - find
 This must be by far one of the most useful programs. But I tend to always forget how it works.
 
 A. Add binary to the path file
 Show the current path-variable
 `echo $PATH`
 
 Add new 
 
 2. Text-fu
 - https://linuxjourney.com/lesson/stderr-standard-error-redirect

### Show all lines just once
You have a list of passwords, or ip-addresses or whatever. And you want to remove all duplicates. How do you do it?


You have list:
```aa
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


 - https://linuxjourney.com/lesson/file-permissions

 ### 6. Processes
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

##

## 7. Packages


### Install package
sudo apt-get install

If you onyl have a .deb file you do this to install form the terminal:
`sudo dpkg -i /path/to/deb/file`

`sudo apt-get install -f`

### Remove packages
This can be tricky. First find the package
`dpkg --list`
Then you find it in your list.
`sudo apt-get --purge remove nameOfProgram`

When you remove some package it might have requires some other dependencies. To remove those you run
`sudo apt-get autoremove`

 8. Devices

 9. The Filesystem

 10. Boot the system

 11. Kernel

 12. Init

 13. Process utilization

 14. Logging

 15. network sharing

 16. Network basics

 17. Subnetting

 18. Routing

 19. Network config

 20. Troubleshooting

 21. DNS
