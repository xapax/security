# Meterpreter shell for post-exploitation

By now you probably has some kind of shell to the target. If it is not a meterpreter shell you should probably try to turn the current shell into a meterpreter shell, since it gives you a lot of tools available really easy.

So just create a meterpreter-shell from msfvenom or something like that. Maybe a php-shell. Or whatever you have access to. Then you just fire that script and get your meterpreter shell. Check out the chapter Exploiting/Msfvenom for more about creating payloads.


## Basics


### Sessions
So first some basics. You can put the shell into a background job with the command `background`. This might be useful if you have several shells going at the same time. Or if you want to move to a specific directory to upload or download some files.

List background sessions
```
background -l
```

Connect back to a background session
```
background -i 1
```

Upload and download files.
```
upload
download
```