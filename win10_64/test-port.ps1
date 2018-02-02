 # https://stackoverflow.com/questions/9566052/how-to-check-network-port-access-and-display-useful-message
 # Test-NetConnection -Computername prekes -DiagnoseRouting 
 
 $t3 = New-Object Net.Sockets.TcpClient
 $t3.Connect('192.168.2.106', 81)
 
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

 Write-Host $t3.Client.RemoteEndPoint