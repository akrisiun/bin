
Get-NetFirewallRule | Select DisplayGroup -Unique | Sort DisplayGroup

write-host 'Get-NetFirewallRule | Select DisplayName, Description | findstr "[TCP " | ft'
