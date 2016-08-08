# Bash-scripting

### Iterate over a file

This script will iterate over a file and echo out every single line


```bash
#!/bin/bash

while read p; do
  echo  $p
done <onlyIps.txt
```

### For-loops

```
for ((i = 0; i < 10; i++)); do
    echo $i
done
```

### If statement

```
if [ "$1" == "" ]; then
    echo "This happens"
fi
```

### If/Else

```
if [ "$1" == "" ]; then
echo "This happens"
else
echo "Something else happens"
fi
```

### Command line arguments

Command line arguments are represented like this
```
$1
```
This is the first command line argument.