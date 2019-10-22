
$msbuild="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\MSBuild.exe"
if (-not (test-path $msbuild)) {
    $msbuild="$env:ProgramFiles (x86)\MSBuild\15.0\Bin\MSBuild.exe"
}
$os = "win32"
if ($PSVersionTable.Platform -eq "Unix") {
    $os = "Unix"
}

if ($os -eq "win32" -and -not (test-path $msbuild)) {
    # Install-Module VSSetup -Scope CurrentUser -Force
    # $vspath = (Get-VSSetupInstance -All -Prerelease | Select-VSSetupInstance).InstallationPath
	$vspath = "c:\Program Files (x86)"
    $msbuild="$vspath\MSBuild\15.0\Bin\MSBuild.exe"
	# Write-host "$msbuild"
} elseif ($os -eq "Unix") {
    $msbuild = "msbuild"
    if ($IsMacOS) { 
        # $PSVersionTable.OS.BeginsWith("Darwin")
        $env:FrameworkPathOverride="/Library/Frameworks/Mono.framework/Versions/Current/lib/mono/4.5"
    }
    # dotnet add package Microsoft.TargetingPack.NETFramework.v4.6.2  --version 1.0.1 --source https://dotnet.myget.org/F/dotnet-core/api/v3/index.json
}

Write-host "$msbuild"
& $msbuild /v:m