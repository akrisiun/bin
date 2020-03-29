# dotb + args

$ErrorActionPreference = 'Stop'
$a_args = $PsBoundParameters.Values + $args

write-host -f magenta "c:/bin/dotc/dotnet.exe msbuild /p:GenerateFullPaths=true $a_args"

if (Test-Path "c:/bin/dotc/dotnet.exe") {
    $dotnet = "c:/bin/dotc/dotnet.exe"
} else {
    $dotnet = "c:\Program Files\dotnet\dotnet.exe"
}

& $dotnet msbuild /p:GenerateFullPaths=true $a_args