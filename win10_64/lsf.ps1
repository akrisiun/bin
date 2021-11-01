
Write-Host "$PWD : Get-ChildItem -Path ? -File | Sort-Object -Property Length -Descending"
Get-ChildItem -Path $PWD  -File | Sort-Object -Property Length -Descending | Select-Object -First 50
