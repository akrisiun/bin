# dotc + args

$ErrorActionPreference = 'Stop'
$a_args = $PsBoundParameters.Values + $args

write-host -f magenta "c:/bin/dotc/dotnet.exe $a_args | $args"

# MSBuild.exe  /t:Build /p:OutDir=c:\custom_build_out\;Configuration=Release;Platform=x64

c:/bin/dotc/dotnet.exe $a_args