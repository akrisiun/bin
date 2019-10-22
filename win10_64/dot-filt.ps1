# dot-test filter  trx + xslt
param(
    [string]$parm1, [string]$filt, [string]$name
)

$csproj = $parm1
if ($name -eq $null) {
    $name = $parm1
}
$xml = "$PWD\$name.xml"
$html = "$PWD\$name.html"
echo $name into $html

write-host "dotnet test $csproj --no-restore --no-build -v n --logger:'trx;LogFileName=$xml' --filter Name~$filt"

dotnet test $csproj --no-restore --no-build -v n --logger:"trx;LogFileName=$xml" --filter Name~$filt

c:\bin\nxslt.exe $PWD\$name.xml c:\bin\test.xslt $html
