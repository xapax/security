# SMTP



http://null-byte.wonderhowto.com/how-to/hack-like-pro-extract-email-addresses-from-smtp-server-0160814/

## Nmap NSE

Check what commands you can use on SMTP

**Check for commands**
```
nmap -script smtp-commands.nse 192.168.1.101
```

**Enumerate users**
```
nmap -script smtp-enum-users.nse 192.168.1.101
```