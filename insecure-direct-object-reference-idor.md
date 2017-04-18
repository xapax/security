## Insecure Direct Object Reference

The vulnerability arises when the user has direct access to objects from user-supplied data.

The classic example of this would be something like the follwoing

```
http://foo.bar/changepassword?user=someuser
```

Imagine that you know anothers username , then you can just change the username and be able to change the password for that user. The data you can access can be anything, maybe private comments, messages, images, user data.



### How to discover

If you have access to the source-code that is an easy way to do it. Check the sections where restricted data is presented. And see if there is any access-control in that code.



### Examples



https://hackerone.com/reports/53858



