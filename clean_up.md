# Clean up



## On Linux


### Log files


**/etc/syslog.conf**

In this file you can read all the logs that syslog log. 


On linux systems a lot of logs are stored in:


```
/var/logs
```

For example:
```
/var/log/messages
```

### Apache

```
/var/log/apache2/access_log
```

Remove your own ip like this

```
grep -v '<src-ip-address>' /path/to/access_log > a && mv a /path/to/access_log
```

### Command history

All your commands are also stored.

```
echo $HISTFILE
echo $HISTSIZE
```
You can set your file-size like this to zero, to avoid storing commands.
```
export HISTSIZE=0
```
If you set it when you get shell you won't have to worry about cleaning up the history.

## Shred files
Shredding files lets you remove files in a more secure way.
```
shred -zu filename
```

## On windows


Clear env
https://www.offensive-security.com/metasploit-unleashed/event-log-management/