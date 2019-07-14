 # https://stackoverflow.com/questions/9566052/how-to-check-network-port-access-and-display-useful-message
 # Test-NetConnection -Computername prekes -DiagnoseRouting 

param([string]$host_, [int]$port = 80)
 
 $t1 = New-Object Net.Sockets.TcpClient
 $len = $args.Length
 # Write-Host "args= $len , original= $host_, port= $port"
 if ($len > 0) {
    $host1 = $args[0] }
 else { $host1 = $host_ }
 
 Write-Host " Connect($host1, $port)" 
 $ok = "-"
 try {
        $t1.Connect($host1, $port)
 } catch {}
 if($t1.Connected)
 {
    $ok = "OK"
 }

 Write-Host $t1.Client.RemoteEndPoint
 $t1.Close()
 Write-Host $ok
 
 ## function 1 ####
 function Test-Port1($host, $port)
 {
    $t = New-Object Net.Sockets.TcpClient
    try {
        $t.Connect($host, $port)
    } catch {}
    
    if($t.Connected)
    {
        $msg = "Port $port is operational"
        Write-Host- $msg
        $t.Close()
        return
    }
 }

 # Write-Host $t3.Client.RemoteEndPoint