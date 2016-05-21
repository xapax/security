# Tools

These are our tools:
- ltrace
- strings
- file
- objdump
- gdb

#### Objdump
Objdump is a program that outputs the assembly code of a compiled program. It ca be executed like this.
example: `objdump -D myProgram`
example: `objdump -M myProgram` - This is to read the assembly in intel-syntax

#### GDB? GNU Debugger
`break main` - set a break at the main-function

`run` - Runs the program
 
`list` - show code if you have compile it with the -g flag
`list 10` - will show the code around line 10. five lines before, and five lines after.
`list 1,20` - will list all lines between the numbers.

`disassemble main` - this shows the code in assembly. It is pretty much the same as running objdump.

`info register eip` - shows info about instruct pointer. this can be written as `i r eip`. On 64bit machines it is called `rip`instead of `eip`. It basically shows to what address eip is pointing at. So the output might be something like this:
`(gdb) i r rip
rip            0x4004aa	0x4004aa <main+4>
`
Which means that rip at this moment is pointing at 0x4004aa. Which means that this is going to be the next instruct that gets executed.

The strucutre is like this:
`examine/[format] address`
`x` - examine. If you at any point want to examine the memory, of a varaible or funciton or something. You can use `x`.
Format is how you want to display the memory. Here are the following formats:
```
    o - octal
    x - hexadecimal
    d - decimal
    u - unsigned decimal
    t - binary
    f - floating point
    a - address
    c - char
    s - string
    i - instruction
```

Example:
`x/s myVariable` - This means: examine myVariable, and output the content in that memory in the form of a string.
Now this does not work for values that does not have a memory address. It will just give you `0x16:	Cannot access memory at address 0x16`
That is because the varible is not a pointer (it does not point to an memory-address), but instead it is a hardcoded value.

`x/i $rip` examine/info instruction pointer register. This command can be used to examine a specifc part of memory. In this example it was the instruct pointer, but it can also be a specific address in memory. 

#### GCC
Compile the program in debugger mode, so that the debugger has access to the code.
`gcc -g program.c`

