# dotc + args

$ErrorActionPreference = 'Stop'
$a_args = $PsBoundParameters.Values + $args

write-host -f magenta "c:/bin/dotc/dotnet.exe build --no-restore /p:GenerateFullPaths=true $a_args"

c:/bin/dotc/dotnet.exe build --no-restore /p:GenerateFullPaths=true $a_args
