# dotb + args

$ErrorActionPreference = 'Stop'
$a_args = $PsBoundParameters.Values + $args

write-host -f magenta "c:/bin/dotc/dotnet.exe msbuild /t:build /p:GenerateFullPaths=true $a_args"

c:/bin/dotc/dotnet.exe msbuild /p:GenerateFullPaths=true /t:build $a_args