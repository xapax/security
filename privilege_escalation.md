# Privilege Escalation

So you have a limited shell on the machine. But it is limited. For example: 

You can't hide very effectivly. 
You can't bind ports below 1024.
Read and write any file
Persist easily between reboots.

These are all things we want to be able to do.
Watch this video!
http://www.irongeek.com/i.php?page=videos/bsidesaugusta2016/its-too-funky-in-here04-linux-privilege-escalation-for-fun-profit-and-all-around-mischief-jake-williams

http://www.slideshare.net/nullthreat/fund-linux-priv-esc-wprotections

http://netsec.ws/?p=309

https://www.rebootuser.com/?page_id=1721

**Don't use binary exploits if you can avoid it. If you use it it might crash the machine. So binary exploits should be the last resort. Always use a simpler priv-esc if you can. They can also produce a lot of stuff in the sys.log**