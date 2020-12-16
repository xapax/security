# Shut down windows defender

On Windows 10 it can be difficult to turn off windows defender. The service cannot simply be stopped as an administrative user.

## Turn off via registry

Set the option DisabloeAntiSpyware to 1 in HKLM:\Software\Policies\Microsoft\Windows Defender

This required a restart for me, and defender was subsequently turned on again after a few minutes.

## Turn off via high privileges

This is based on the fact that you already have local administrative access.

Windows defender can be turned off by a process running in a security context similar to TrustedInstaller. 

From an administrative console:

```
Start-Service TrustedInstaller

# Get a LocalSystem shell
psexec -s -i cmd.exe
# Or using
AccessTokenCLI start -s -e
```

From a LocalSystem console (for example psexec from sysinternals helps here)

```
AccessTokenCLI start -p <PID of trusted installer process> -e
```

From the console running as TrustedInstaller:

```
sc stop windefend
```
