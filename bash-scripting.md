# Bash-scripting

## Iterate over a file

This script will iterate over a file and echo out every single line

```bash
for line in $(cat file.txt);do
echo $line
done
```


```bash
#!/bin/bash

while read p; do
  echo  $p
done <onlyIps.txt
```

## For-loops

```bash
for ((i = 0; i < 10; i++)); do
    echo $i
done
```

Another way to write this is by using the program `seq`. Seq is pretty much like `range()` in python. So it can be used like this:

```bash
for x in `seq 1 100`; do
  echo $x
done
```

## If statement

```bash
if [ "$1" == "" ]; then
    echo "This happens"
fi
```

## If/Else

```bash
if [ "$1" == "" ]; then
echo "This happens"
else
echo "Something else happens"
fi
```


## Command line arguments

Command line arguments are represented like this

```bash
$1
```
This is the first command line argument.

## Deamonize an execution

If you do a ping-sweep with host the command will take about a second to complete. ANd if you run that against 255 hosts I will take a long time to complete. To avoid this we can just deamonize every execution to ake it faster

```
#!/bin/bash

for ip in $(cat ips.txt); do
ping -c 1 $ip &
done
```