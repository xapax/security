# Networking with powershell

## Connect TCP

```
$tcp = New-Object System.Net.Sockets.TcpClient("<ip>", <port>)
```

## Send data

```
[Byte[]] $buffer = [Text.Encoding]::ASCII.GetBytes("<string>")
$tcp = New-Object System.Net.Sockets.TcpClient("<ip>", <port>)
$stream = $tcp.GetStream()
$stream.Write($buffer, 0, $buffer.Length)
```

## Send file 

```
$bytes = [System.IO.File]::ReadAllBytes("<filepath>")
$tcp = New-Object System.Net.Sockets.TcpClient("<ip>", <port>)
$stream = $tcp.GetStream()
$stream.Write($bytes, 0, $bytes.Length)
```

