# Vim

[http://www.viemu.com/a-why-vi-vim.html](http://www.viemu.com/a-why-vi-vim.html)  
And also this classic answer: [https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim](https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim)

## Core concepts

In vim you have the concept of buffers.

```bash
# List buffers
:buffers

# Switch buffer
# By number
b1
b2
# By name
b [name]


# Close/delete a buffer
:bdelete
:bd
```

## Movement - Motion commands

**Left,up,down,right**

`hjkl`

**start of line**

`0` \(zero\)

**end of line**

`$`

**beginning of next word**

`w`

**beginning of next word, defined by white space**

`W`

**end of the next word**

`e`

**end of the next word, defined by white space**

`E`

**back to the beginning of previous word**

`b`

**back to the end of previous word**

`B`

**go to next character of your choice**

If you want to go to the next comma

`f,`

**start of file**

`gg`

**end of file**

`G`

## Operators

Operators are commands that do things. Like delete, change or copy.

`c` - change  
`ce` - change until end of the word.  
`c$` - change until end of line.

## Combining Motions and Operators

Now that you know some motion commands and operator commands. You can start combining them.

`dw` - delete word  
`d$` - delete to the end of the line

## Count - Numbers

You can add numbers before motion commands. To move faster.

`4w` - move cursor three words forward  
`0` - move curso to the start of the line

You can use numbers to perform operations.  
`d3w` - delete three words

`3dd` - delete three lines

## Replace

If you need to replace a character, there is no need to enter insert-mode. You can just use replace

Go to a character and the press `r` followed by the character you want instead.

`rp` if you want to replace p.

`R`

## Clipboard

In order to copy something FROM vim to the OS-clipboard you can do this:

The `"` means that we are not entering a registry. And the `*` means the OS-clipboard. So we are yanking something and putting it in the OS-clipboard registry.

```
"*y
```

## Substitute - Search and replace

:s/thee/the/g

## Entering insert-mode

`i` - current character  
`o` - next line  
`O` - line before  
`a` - end of word  
`A` - end of line

## .vimrc

Here is all your vim-configuration.

## Plugins

Install vundle here  
[https://github.com/VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)

**Add plugin**

Add plugin to your .vimrc-file and then open vim and write

`:PluginInstall`

