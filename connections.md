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

### Custom headers
WE might receive a 403 error if we don't include a user-agent. Or we might want to send a specific header. We can do that the following way.

```python
import requests

headers = {
"Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
"Accept-Encoding": "gzip, deflate, sdch",
"Accept-Language": "en-US,en;q=0.8,es;q=0.6,sv;q=0.4",
"Cache-Control": "max-age=0",
"Connection": "keep-alive",
"Cookie": "_gauges_unique_hour=1; _gauges_unique_day=1; _gauges_unique_month=1; _gauges_unique_year=1; _gauges_unique=1",
"Host": "docs.python-requests.org",
"If-Modified-Since": "Wed, 03 Aug 2016 20:05:34 GMT",
"If-None-Match": 'W/"57a24e8e-e1f3"',
"Referer": "https://www.google.com/",
"Upgrade-Insecure-Requests": "1",
"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.82 Safari/537.36"
}

req = requests.get("http://site.com", headers=headers)
print req.status_code
print req.text
```

## Read and write to files
Many times we want to read through files and do stuff do it. This can of course be done using bash but we can also do it in python.

```python
file_open = open("readme.txt", "r")
for line in file_open:
    print line.strip("\n")
    if line.strip("\n") == "rad 4":
        print "last line"
```