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

Another way to write this is by using the program `seq`. Seq is pretty much like `range()` in python. So it can be used like this:

```
for x in `seq 1 100`; do
  echo $x
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