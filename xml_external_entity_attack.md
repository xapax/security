# XML External Entity Attack

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
| &amp; | & | ampersand  |
| &apos; | ' | apostrophe |
| &quot; | " | quotation mark |

* Whitespace is perserved in XML
* 


