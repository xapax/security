# take a file...
$Path = "C:\Users\pelle\aaa.dll"
# read all bytes...
$bytes = [System.IO.File]::ReadAllBytes($Path)
# turn bytes into Base64 string:
$string = [System.Convert]::ToBase64String($bytes)
$string | set-clipboard
# the result is a VERY long string. It is much longer
# than the original file:
$file = Get-Item -Path $Path
[PSCustomObject]@{
    'Original File Length' = $file.Length
    'Base64 String Length' = $string.Length
    'Size Increase' = ('{0:p}' -f ($string.Length / $file.Length))
} | Format-List