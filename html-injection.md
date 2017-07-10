## HTML-Injection

This attack is really similar to to Cross-Site Scripting attacks.

What we can do:

* Create a fake login-page, that tricks the user to log in again, but the post-is sent to a server that the attacker controls. And can thereby steal the credentials of the user.
* Inject javacript.

### Injecting Javascript

Javascript can be injected into html-tags, which can be used to steal cookies and other things.

### Injecting HTML

The attacker can inject html forms that tricks the user into giving up sensitive data.

See eventhandlers for more ways: https://www.owasp.org/index.php/XSS\_Filter\_Evasion\_Cheat\_Sheet\#Event\_Handlers

```
<IMG SRC=# onmouseover="alert('xxs')">

```



