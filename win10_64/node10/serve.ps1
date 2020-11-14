#!/usr/bin/env pwsh
$basedir=Split-Path $MyInvocation.MyCommand.Definition -Parent

if (-not (Test-Path "$basedir/node$exe")) {
  $basedir="c:\bin\node10\";
}

$exe=""
if ($PSVersionTable.PSVersion -lt "6.0" -or $IsWindows) {
  # Fix case when both the Windows and Linux builds of Node
  # are installed in the same directory
  $exe=".exe"
}
$ret=0
if (Test-Path "$basedir/node$exe") {
  & "$basedir/node$exe"  "$basedir/node_modules/serve/bin/serve.js" $args
  $ret=$LASTEXITCODE
} else {
  & "node$exe"  "$basedir/node_modules/serve/bin/serve.js" $args
  $ret=$LASTEXITCODE
}
exit $ret
