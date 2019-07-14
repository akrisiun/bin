@REM # if Code = 1056 then begin // Service already started

net stop TermService

takeown.exe /A /F rfxvmt.dll 
takeown.exe /A /F termsrv.dll

icacls.exe rfxvmt.dll /grant "PCADDR\user:F"

icacls.exe rfxvmt.dll /inheritance:d
icacls.exe rfxvmt.dll /setowner "NT SERVICE\TrustedInstaller"
icacls.exe rfxvmt.dll /grant "NT SERVICE\TrustedInstaller:F"

icacls.exe rfxvmt.dll /remove "NT AUTHORITY\SYSTEM"
icacls.exe rfxvmt.dll /grant "NT AUTHORITY\SYSTEM:RX"

icacls.exe rfxvmt.dll /remove "BUILTIN\Administrators"
icacls.exe rfxvmt.dll /grant "BUILTIN\Administrators:RX"

@REM icacls.exe rfxvmt.dll /remove "PCADDR\user"
