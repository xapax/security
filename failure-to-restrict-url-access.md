## Failure to Restrict URL Access



This basically means that a normal user has access to areas on a webpage that should only be accessible to an administrator, or another user. This can happen when the website hides functionality from its users, instead of restricting it with authentication. So if the user finds out the hidden URL the user will be able to access that part of the website.



### 

### How to exploit it

It kind of depends on what access you have to the service. If you have access to an installation you can just create a list of all URLs that the admin-account, or low-privilege accounts have access too. And then check if a non-authenticated users can access those pages.

If you are testing it black-box style you can force browse it.



### References



https://www.owasp.org/index.php/Top\_10\_2010-A8-Failure\_to\_Restrict\_URL\_Access







