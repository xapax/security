# Buffer overflow (BOF)

##Methodology

1. Investigate the file
```
file
strings
```

2. Test it out - what does the program do?

3. Look at its functions in GDB

```
info functions
```

4. Look at the assembly of a function

```
disass main
disass otherfunction
```

5. Look for the flow of the program. Look for cmp