# dotb + args

$ErrorActionPreference = 'Stop'
$a_args = $PsBoundParameters.Values + $args

if (Test-Path "c:/bin/dotc/dotnet.exe") {
    $dotnet = "c:/bin/dotc/dotnet.exe"
} else {
    $dotnet = "c:\Program Files\dotnet\dotnet.exe"
}

write-host -f magenta "$dotnet msbuild /p:GenerateFullPaths=true $a_args"

& $dotnet msbuild /p:GenerateFullPaths=true $a_args
