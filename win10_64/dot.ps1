# dotnet + args

$ErrorActionPreference = 'Stop'

$a_args = $PsBoundParameters.Values + $args
# [string[]]  # $args=@() | @() | $args

write-host -f magenta "~.dotnet\x64\dotnet.exe $a_args | $args"

# @()
c:\Users\akris\.dotnet\x64\dotnet.exe $a_args