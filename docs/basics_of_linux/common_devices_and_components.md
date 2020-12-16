

# Load balancer

Load balancers can performs a few different functions. But these are the more common ones.


## Loan balancing
Well a load balancer principally works with load balancing. It initially receives traffic and then direct that traffic onward towards different instances/server of an app. So in order to increase the amount of traffic a webserver can handle you can just add a new instance of your app, and then tell the load balancer to direct the traffic to the new server as well.
Without a load balancer the way to scale up the capacity of an application would be to buy a bigger server that can handle more traffic, not a very smooth way to scale an application.

The group of servers that the load balancer directs the traffic to is usually called **server farm** or **server pool**.

Load balancers can be roughly divided up n those that direct traffic on Layer 4 or Layer 7.
Layer 4 load balancers act upon network traffic on layer 4, like IP, TCP, UDP.

Layer 7 load balancers balance the traffic based on data found in the HTTP. It could be HTTP headers, or even URL Paths, or cookie. It is common to see when you remove the Load balancing Cookie that you get different responds. It could for example be that you are authenticated on one server, but not the other.

Load balancers can assure the health of a server, in order to only direct a request to a server that is up and running.


### Common load balancers
The most common load balancers are F5 and Nginx. Also HA Proxy
Nginx can also work as a webserver or a reverse proxy. It depends on how you configure it.



# Reverse proxy

From many to one.

Deploying a load balancer make sense when you have multiple server.
Deploying a reverse proxy in front of an application can provide some really nice features. Examples of such features are:

- IP whitelisting/blacklisting
- Limiting number of connetions from each client

It can also increase the performance by doing the following:
- Compression (GZIP compression - which decreases the amount of data that needs to be transfered)
- SSL Terminatation - terminating can be computationally expensive. So it might be beneficial to have a reverse proxy doing that, instead of the web server, which might not be specialized to do that.
- Caching - By caching certain content, it will reduce the traffic to the actual web server, and generate faster responses to the client.

### Common reverse proxies
F5 BIG-IP, Nginx

Increased security. 


# API Gateway

API gateway is usually used in order to route request to appropriate microservices. API gateways is usually used with microservices. It has the benefit that a client (or server) only needs to talk to one API server to get some data, instead of having to talk to 20 different microservices, which might be using different protocols. One speaking XML, the other JSON, and another SOAP.

API gateway works on OSI layer 7 protocols (HTTP)

Webserver ---> API Gateway --> Microservice 1, 2 or 3

Configurint the API gateway therefore becomes important. Because you need to translate the webrequest to all those different microservices, which might be using different protocols, and different authentications.

It performs some or all of the the following functions:
- Translates protocols. Like from JSON to XML. 
- Aggregates data from different microservices into one response.

- SSL termination
- Authentication
- IP whitelisting
- Client rate limiting (throttling)
- Logging and monitoring
- Response caching
- Web application firewall
- GZIP compression
- Servicing static content


What's the difference between an API gateway and a layer 7 load balancer? Well, it is not necessarily clear cut. They can act similar. Difference could be that a load balancer doesn't really translate between protocols.
An API gateway often performs the same functions as a reverse proxy or a load balancer. Maybe it is good to think of an API gateway as a advanced load balancer.

### Common API gateways
Nginx. Nginx is really versitile, and can be used as a load balancer, reverse proxy, web server, or api gateway. In fact Nginx can act as a reverse proxy, load balancer and API gateway all at the same time.
Kong, Tyk, Amassador, Amazon API gateway, HAPRoxy. Azure API Management (APIM)

Biztalk is a common windows bases API gateway.




