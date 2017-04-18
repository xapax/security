# Broken Authentication or Session Management



### Authentication



### Logout management

* Log out in one tab but you stay logged in in another tab.

* Click on log out and then go back in your browser, if you enter in the session again that is a problem.



### Session management

##### Session does not die after password reset

https://hackerone.com/reports/145430

##### Cookie is usable after session is killed

This might be an issue if you save the cookie, and then log out. And then inject the cookie into your request again. If you can enter the session you have an issue. The issue here might be that the cookie is cleared on the client-side but not on the server-side.

##### HttpOnly

HttpOnly is a optional flag in the Set-Cookie response header. If the flag is set javascript code is not able to access the cookie. Which might prevent XSS. HttpOnly works if the browser honors that flag of course. But most browsers today do. You can see this behaviour if you open up the devetools in your browser and go to storage and look at the cookies. Then you can do 

`console.log(document.cookie)` and it will only print out the cookie that has the HttpOnly flag set to `false`.

##### SecureFlag

This is another optional flag for cookies. It is the application server that set it. By setting this flag the browser will not send the cookie unencrypted.

##### Session-ID in URL

Session ID:s should never be showed in URLs. The risk is that if you pass the session-id in the URL and then share the link with someone that person might inherit the session. But if you put the session-id in the cookie that risk is avoided.







### Password reset link does not expire

1. You create an account in example.com. You add email a@email.com
2. Your email account gets hacked.
3. The hacker figures out you have a user on example.com. The hacker clicks the reset-password-link. But does not use it.
4. The hacked person figures out that he is hacked and thus goes to example.com to change his password.
5. The hacker now clicks on the link and manage to reset the password.  

The problem here is that the first reset-link should be blocked once the second is sent.

#### Relevant bug bounty reports

[https://hackerone.com/reports/23579](https://hackerone.com/reports/23579)  
[https://hackerone.com/reports/39203](https://hackerone.com/reports/39203)  
[https://hackerone.com/reports/23921](https://hackerone.com/reports/23921)

### Cookie does not expire

An easy way to test this is by using burp-suite.

1. Open burp-suite
2. Login to a website you want to test
3. Intercept the request, anyone will do.
4. Right click on the request in burp-suite and click on "Send to repeater". Now you have saved that request for later. With the current cookie.
5. Log out from the website
6. Go to the Repeater-tab in burp and click on "Go".
7. Verify that you are redirected to the login.

#### Relevant reports on hackerone

[https://hackerone.com/reports/18503](https://hackerone.com/reports/18503)

