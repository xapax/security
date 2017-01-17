# Broken Authentication or Session Management

### Password reset link does not expire

1. You create an account in example.com. You add email a@email.com
2. Your email account gets hacked.
3. The hacker figures out you have a user on example.com. The hacker clicks the reset-password-link. But does not use it.
4. The hacked person figures out that he is hacked and thus goes to example.com to change his password.
5. The hacker now clicks on the link and manage to reset the password.  

The problem here is that the first reset-link should be blocked once the second is sent.

#### Relevant bug bounty reports
https://hackerone.com/reports/23579
https://hackerone.com/reports/39203
https://hackerone.com/reports/23921

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
https://hackerone.com/reports/18503