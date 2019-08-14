write-host c:\bin\dotc\dotnet.exe msbuild /t:build /p:GenerateFullPaths=true $args -ForegroundColor Green
$ErrorActionPreference = 'Stop'

c:\bin\dotc\dotnet.exe msbuild /t:build /p:GenerateFullPaths=true $args
