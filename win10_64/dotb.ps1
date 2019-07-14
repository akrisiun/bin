# dotb + args

$ErrorActionPreference = 'Stop'
$a_args = $PsBoundParameters.Values + $args

write-host -f magenta "c:/bin/dotb/dotnet.exe $a_args | $args"

c:/bin/dotb/dotnet.exe $a_args