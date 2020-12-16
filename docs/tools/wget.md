# wget

Wget is just an incredible useful tool. It be used to download stuff.

If you need to use wget through a proxy you can do the following:

```
wget "http://example.com/get_album_item.php?size=version%28%29%20;%20--" -O output.txt -e use_proxy=yes -e http_proxy=192.168.101.8:3128 --proxy-user "username" --proxy-password "password"
```
