# Bash-scripting

### Iterate over a file

This script will iterate over a file and echo out every single line


```bash
#!/bin/bash

while read p; do
  echo  $p
done <onlyIps.txt
```

### If statement

```
if [ "$1" == "" ]; then
echo "This happens"
fi
```