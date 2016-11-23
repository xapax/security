# Vim

## Core concepts

In vim you have the concept of buffers.

```
# List buffers
:buffers

# Close/delete a buffer
:bdelete
:bd
```

## Movement

**Left,up,down,right**
hjkl

**start of line**
0 (zero)

**end of line**
$

**beginning of next word**
w

**beginning of next word, defined by white space**
W

**end of the next word**
e

**end of the next word, defined by white space**
E

**back to the beginning of previous word**
b

**back to the end of previous word**
B

**go to next character of your choice**
If you want to go to the next comma
f,


## .vimrc

Here is all your vim-configuration.


## Plugins

Install vundle here
https://github.com/VundleVim/Vundle.vim

**Add plugin**

Add plugin to your .vimrc-file and then open vim and write

**:PluginInstall**