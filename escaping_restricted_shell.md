# Escaping Restricted Shell

Some sysadmins don't want their users to have access to all commands. So they get a restriced shell. If the hacker get access to a user with a restriced shell we need to be able to break out of that, escape it, in order to have more power.

Many linux distros include rshell, which is a restriced shell.

To access the restried shell you can do this:

```
sh -r 
rsh

rbash
bash -r
bash --restricted

rksh
ksh -r
```

http://securebean.blogspot.cl/2014/05/escaping-restricted-shell_3.html?view=sidebar
http://pen-testing.sans.org/blog/pen-testing/2012/06/06/escaping-restricted-linux-shells