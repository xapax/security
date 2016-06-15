# Cross Site Request Forgery

Cross site Request Forgery (CSRF) attacks forces the user to perform action the he did not intend to perform. This usually (only?) possible by creating a malicious URL-address that the victim executes in his browser, while he is logged in.

## What's the worst that can happen?

The attacker can make actions for the user. For example change the email-address, make a purchase, or something like that. So it could be used to change the adress, and reset the password by sending an email.


## How to perform it?

1. Investigate how the website works
First you need to know how the application works. What the endpoints are.

2. Construct your malicious URL
Now you just construct the URL. Either using get or post.

- `GET`
If you use only `GET` you can construct the URL like this:

http://example.com/api/createUser?name=Jose

- `POST`

If the requests are sent as `POST` you need to make the victim run a link that where you control the server. So that you can add the arguments in the body.

There is one creat trick for this. It is to use the image-tag. Because the image-tag can be used to automatically retrieve information from other sites. If you have an image on your site but it is referenced to

`<img style="display: none" src="http://example.com/image.jpg">`


## Protection

The only real solution is to use unique tokens for each request.



### References


http://tipstrickshack.blogspot.cl/2012/10/how-to-exploit-csfr-vulnerabilitycsrf.html

https://www.owasp.org/index.php/Testing_for_CSRF_(OTG-SESS-005)

https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)