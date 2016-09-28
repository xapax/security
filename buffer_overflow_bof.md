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

6. Set up breakpoints with hooks

```
define hook-stop
info registers  ;show the registers
x/24xw $esp  ;show the stack
x/2i $eip  ;show the new two instructions
end
```

7. Step through the whole program. Or at the breakpoints

```
si ;steps one forward, but follows functions
ni ;does not follow functions
```