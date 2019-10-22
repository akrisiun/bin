function Get-NetworkStatistics 
{ 
    $properties = 'Protocol','LocalAddress','LocalPort' 
    $properties += 'RemoteAddress','RemotePort','State','ProcessName','PID'

    # TCP|UDP
    netstat -ano | Select-String -Pattern '\s+(TCP)' | ForEach-Object {

        $item = $_.line.split(" ",[System.StringSplitOptions]::RemoveEmptyEntries)

        if($item[1] -notmatch '^\[::') 
        {            
            if (($la = $item[1] -as [ipaddress]).AddressFamily -eq 'InterNetworkV6') 
            { 
               $localAddress = $la.IPAddressToString 
               $localPort = $item[1].split('\]:')[-1] 
            } 
            else 
            { 
                $localAddress = $item[1].split(':')[0] 
                $localPort = $item[1].split(':')[-1] 
            } 

            if (($ra = $item[2] -as [ipaddress]).AddressFamily -eq 'InterNetworkV6') 
            { 
               $remoteAddress = $ra.IPAddressToString 
               $remotePort = $item[2].split('\]:')[-1] 
            } 
            else 
            { 
               $remoteAddress = $item[2].split(':')[0] 
               $remotePort = $item[2].split(':')[-1] 
            } 

            $state = if($item[0] -eq 'tcp') {$item[3]} else {$null} 
            $proc  = (Get-Process -Id $item[-1] -ErrorAction SilentlyContinue).Name 
            # Get-Help about_Comparison_Operators
            # -eq -ne  -gt -lt
            
            if ($proc -ne 'Idle')
            {
                New-Object PSObject -Property @{ 
                    PID = $item[-1] 
                    ProcessName = $proc
                    Protocol = $item[0] 
                    LocalAddress = $localAddress 
                    LocalPort = $localPort 
                    RemoteAddress =$remoteAddress 
                    RemotePort = $remotePort 
                    State = $state
                } | Select-Object -Property $properties 
            }
        } 
    } 
}

Get-NetworkStatistics | 
    Sort-Object  -Property ProcessName,RemotePort,RemoteAddress,LocalPort,LocalAddress |
    Format-Table -Property LocalAddress,LocalPort,RemoteAddress,RemotePort,ProcessName,PID -AutoSize

# Get-Process | Sort-Object -Property WS | Select-Object -Last 5    