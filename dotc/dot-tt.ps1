# dot-tt | trx

param(
    [string]$parm1, [string]$parm2, [string]$parm3
)

$csproj = $parm1
$name = $parm1
$xml = "$PWD\$name.xml"
$html = "$PWD\$name.html"
echo $name into $html

dotnet test $csproj --no-restore --no-build -v n --logger:"trx;LogFileName=$xml"

c:\bin\nxslt.exe $PWD\$name.xml c:\bin\test.xslt $html
