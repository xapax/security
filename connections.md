# Useful scripts


## Make request
Sometimes we might want to make a request to a website. In python we can to it the following way.

If you don't have the module requests installed you can install it like this.

`pip install requests`

```python
import requests

req = requests.get("http://site.com")
print req.status_code
print req.text
```

