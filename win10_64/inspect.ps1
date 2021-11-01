# c:/bin/inspect .\?.csproj

$len = $args.Length
$csproj = $args[0]
$grep = $args[1]
$log = "./inspect.log"

write-host "
c:\bin\resharper\inspectcode.exe \"-o=$log\" \"-f=Text\" $csproj"
c:\bin\resharper\inspectcode.exe "-o=$log" "-f=Text" $csproj >> nil

if (test-path "nil") {
  remove-item nil
}

if ($grep -eq $null) {
   cat inspect.log
} else {
   cat inspect.log | findstr $grep
}
