
# https://devblogs.microsoft.com/nuget/deprecating-tls-1-0-and-1-1-on-nuget-org/
# Versions of nuget.exe older than 3.4.4, however, may default to using TLS 1.0. 
# Additionally, PowerShell also defaults to TLS 1.0. 
# This can be fixed by changing your .NET Framework default TLS version, which is configured in your registry keys:
# 
# reg add HKLM\SOFTWARE\Microsoft\.NETFramework\v4.0.30319 /v SystemDefaultTlsVersions /t REG_DWORD /d 1 /f /reg:64
# reg add HKLM\SOFTWARE\Microsoft\.NETFramework\v4.0.30319 /v SystemDefaultTlsVersions /t REG_DWORD /d 1 /f /reg:32
# If you are using PowerShell and are writing a custom script but cannot edit your system’s registry keys, you can also set your TLS settings using ServicePointManager.SecurityProtocol:

[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bOR [Net.SecurityProtocolType]::Tls12

# .NET apps
# If you interact with our APIs using your own app, consider upgrading to .NET Core or .NET Framework 4.7.2 or higher. 
# This will ensure that your app defaults to using your operating system’s default TLS version. Alternatively, you can also set your TLS settings using ServicePointManager.SecurityProtocol:
# 

# ServicePointManager.SecurityProtocol |= SecurityProtocolType.Tls12;
#  https://github.com/PowerShell/PowerShell/issues/7827

$PSDefaultParameterValues["*:proxy"]=$env:http_proxy

# [System.AppContext]::SetSwitch("System.Net.Http.UseSocketsHttpHandler", $false)
# [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bOR [Net.SecurityProtocolType]::Tls12

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$proto = [Net.ServicePointManager]::SecurityProtocol
$proxy = $PSDefaultParameterValues["*:proxy"]
echo "[Net.ServicePointManager]::SecurityProtocol = $proto, $PSDefaultParameterValues['*:proxy'] $proxy"

# Set-ExecutionPolicy RemoteSigned

refreshenv

