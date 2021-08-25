
# https://github.com/dotnet/install-scripts | # https://dot.net/v1/dotnet-install.ps1

# curl 
invoke-webrequest https://dot.net/v1/dotnet-install.ps1 -OutFile dotnet-install.ps1
# -Version '3.1.404'

# Invoke-WebRequest 'https://dot.net/v1/dotnet-install.ps1' -Proxy $env:HTTP_PROXY -ProxyUseDefaultCredentials -OutFile 'dotnet-install.ps1';
# ./dotnet-install.ps1 -InstallDir '~/.dotnet' -Version '3.1.14' -ProxyAddress $env:HTTP_PROXY -ProxyUseDefaultCredentials;

# https://dotnetcli.blob.core.windows.net/dotnet/release-metadata/releases-index.json
echo "./dotnet-install -Version '3.1.404'"
./dotnet-install --dry-run

# https://github.com/dotnet/core/blob/main/release-notes/3.1/3.1.10/3.1.404-download.md
./dotnet-install -Version '3.1.404'
