Add-Type -AssemblyName System.Windows.Forms

Function Get-SystemSpecifications() 
{

    $UserInfo = Get-UserInformation;
    $OS = Get-OS;
    $Kernel = Get-Kernel;
    $Uptime = Get-Uptime;
    $Motherboard = Get-Mobo;
    $Shell = Get-Shell;
    $Displays = Get-Displays;
    $WM = Get-WM;
    $Font = Get-Font;
    $CPU = Get-CPU;
    $GPU = Get-GPU;
    $RAM = Get-RAM;
    $Disks = Get-Disks;


    [System.Collections.ArrayList] $SystemInfoCollection = 
        $UserInfo, 
        $OS, 
        $Kernel,
        $Uptime,
        $Motherboard,
        $Shell,
        $Displays,
        $WM,
        $Font,
        $CPU,
        $GPU,
        $RAM;

    foreach ($Disk in $Disks)
    {
        [void]$SystemInfoCollection.Add($Disk);
    }
    
    return $SystemInfoCollection;
}

Function Get-LineToTitleMappings() 
{ 
    $TitleMappings = @{
        0 = "";
        1 = "OS: "; 
        2 = "Kernel: ";
        3 = "Uptime: ";
        4 = "Motherboard: ";
        5 = "Shell: ";
        6 = "Resolution: ";
        7 = "Window Manager: ";
        8 = "Font: ";
        9 = "CPU: ";
        10 = "GPU ";
        11 = "RAM: ";
    };

    return $TitleMappings;
}

Function Get-UserInformation()
{
    return $env:USERNAME + "@" + (Get-WmiObject Win32_OperatingSystem).CSName;
}

Function Get-OS()
{
    return (Get-WmiObject Win32_OperatingSystem).Caption + " " + 
        (Get-WmiObject Win32_OperatingSystem).OSArchitecture;
}

Function Get-Kernel()
{
    return (Get-WmiObject  Win32_OperatingSystem).Version;
}

Function Get-Uptime()
{
    $Uptime = ((Get-WmiObject Win32_OperatingSystem).ConvertToDateTime(
        (Get-WmiObject Win32_OperatingSystem).LocalDateTime) - 
        (Get-WmiObject Win32_OperatingSystem).ConvertToDateTime(
            (Get-WmiObject Win32_OperatingSystem).LastBootUpTime));

    $FormattedUptime =  $Uptime.Days.ToString() + "d " + $Uptime.Hours.ToString() + "h " + $Uptime.Minutes.ToString() + "m " + $Uptime.Seconds.ToString() + "s ";
    return $FormattedUptime;
}

Function Get-Mobo()
{
    $Motherboard = Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer, Product;
    return $Motherboard.Manufacturer + " " + $Motherboard.Product;

}

Function Get-Shell()
{
    return "PowerShell $($PSVersionTable.PSVersion.ToString())";
}

Function Get-Display()
{
    # This gives the current resolution
    $videoMode = Get-WmiObject -Class Win32_VideoController;
    $Display = $videoMode.CurrentHorizontalResolution.ToString() + " x "
        	+ $videoMode.CurrentVerticalResolution.ToString() + " (" + $videoMode.CurrentRefreshRate.ToString() + "Hz)";
    return $Display;
}

Function Get-Displays()
{ 
    $Displays = New-Object System.Collections.Generic.List[System.Object];

    # This gives the available resolutions
	Try {
		$monitors = Get-WmiObject -N "root\wmi" -Class WmiMonitorListedSupportedSourceModes

		foreach($monitor in $monitors) 
		{
			# Sort the available modes by display area (width*height)
			$sortedResolutions = $monitor.MonitorSourceModes | sort -property {$_.HorizontalActivePixels * $_.VerticalActivePixels}
			$maxResolutions = $sortedResolutions | select @{N="MaxRes";E={"$($_.HorizontalActivePixels) x $($_.VerticalActivePixels) "}}

			$Displays.Add(($maxResolutions | select -last 1).MaxRes);
		}

		if ($Displays.Count -eq 1) {
			return Get-Display
		}

	} Catch {
		# //  $monitors = Get-WmiObject -N "root\wmi" -Class WmiMonitorListedSuppor ...
		# InvalidOperation: (:) [Get-WmiObject], ManagementException
	}
    return $Displays;
}

Function Get-WM() 
{
    return "DWM";
}

Function Get-Font() 
{
    return "Segoe UI";
}

Function Get-CPU() 
{
    return (((Get-WmiObject Win32_Processor).Name) -replace '\s+', ' ');
}

Function Get-GPU() 
{
    return (Get-WmiObject Win32_DisplayConfiguration).DeviceName;
}

Function Get-RAM() 
{
    $FreeRam = ([math]::Truncate((Get-WmiObject Win32_OperatingSystem).FreePhysicalMemory / 1KB)); 
    $TotalRam = ([math]::Truncate((Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory / 1MB));
    $UsedRam = $TotalRam - $FreeRam;
    $FreeRamPercent = ($FreeRam / $TotalRam) * 100;
    $FreeRamPercent = "{0:N0}" -f $FreeRamPercent;
    $UsedRamPercent = ($UsedRam / $TotalRam) * 100;
    $UsedRamPercent = "{0:N0}" -f $UsedRamPercent;

    return $UsedRam.ToString() + "MB / " + $TotalRam.ToString() + " MB " + "(" + $UsedRamPercent.ToString() + "%" + ")";
}

Function Get-Disks() 
{     
    $FormattedDisks = New-Object System.Collections.Generic.List[System.Object];

    $NumDisks = (Get-WmiObject Win32_LogicalDisk).Count;

    if ($NumDisks) 
    {
        for ($i=0; $i -lt ($NumDisks); $i++) 
        {
            $DiskID = (Get-WmiObject Win32_LogicalDisk)[$i].DeviceId;

            $DiskSize = (Get-WmiObject Win32_LogicalDisk)[$i].Size;
			$FreeDiskSizeGB = 0;
			$FreeDiskPercent = 0;
			$UsedDiskSizeGB = 0;
			$UsedDiskPercent = 100;
			
			Try 
			{
				if ($DiskSize -and $DiskSize -ne 0)
				{
					$FreeDiskSize = (Get-WmiObject Win32_LogicalDisk)[$i].FreeSpace
					$FreeDiskSizeGB = $FreeDiskSize / 1073741824;
					$FreeDiskSizeGB = "{0:N0}" -f $FreeDiskSizeGB;

					$DiskSizeGB = $DiskSize / 1073741824;
					$DiskSizeGB = "{0:N0}" -f $DiskSizeGB;

					$FreeDiskPercent = ($FreeDiskSizeGB / $DiskSizeGB) * 100;
					$FreeDiskPercent = "{0:N0}" -f $FreeDiskPercent;

					$UsedDiskSizeGB = $DiskSizeGB - $FreeDiskSizeGB;
					$UsedDiskPercent = ($UsedDiskSizeGB / $DiskSizeGB) * 100;
					$UsedDiskPercent = "{0:N0}" -f $UsedDiskPercent;
				}
				else {
					$DiskSizeGB = 0;
					$FreeDiskSizeGB = 0;
					$FreeDiskPercent = 0;
					$UsedDiskSizeGB = 0;
					$UsedDiskPercent = 100;
				}
			} 
			Catch {
				if ($FreeDiskSizeGB -eq 0) {
				    $FreeDiskSizeGB = -1;
			    }
			}
			
            $FormattedDisk = "Disk " + $DiskID.ToString() + " " + 
                $UsedDiskSizeGB.ToString() + "GB" + " / " + $DiskSizeGB.ToString() + "GB " + 
                "(" + $UsedDiskPercent.ToString() + "%" + ")";
            $FormattedDisks.Add($FormattedDisk);
        }
    }
    else 
    {
        $DiskID = (Get-WmiObject Win32_LogicalDisk).DeviceId;

        $FreeDiskSize = (Get-WmiObject Win32_LogicalDisk).FreeSpace
        $FreeDiskSizeGB = $FreeDiskSize / 1073741824;
        $FreeDiskSizeGB = "{0:N0}" -f $FreeDiskSizeGB;

        $DiskSize = (Get-WmiObject Win32_LogicalDisk).Size;
        $DiskSizeGB = $DiskSize / 1073741824;
        $DiskSizeGB = "{0:N0}" -f $DiskSizeGB;

        if ($DiskSize -gt 0) 
        {
            $FreeDiskPercent = ($FreeDiskSizeGB / $DiskSizeGB) * 100;
            $FreeDiskPercent = "{0:N0}" -f $FreeDiskPercent;

            $UsedDiskSizeGB = $DiskSizeGB - $FreeDiskSizeGB;
            $UsedDiskPercent = ($UsedDiskSizeGB / $DiskSizeGB) * 100;
            $UsedDiskPercent = "{0:N0}" -f $UsedDiskPercent;

            $FormattedDisk = "Disk " + $DiskID.ToString() + " " +
                $UsedDiskSizeGB.ToString() + "GB" + " / " + $DiskSizeGB.ToString() + "GB " +
                "(" + $UsedDiskPercent.ToString() + "%" + ")";
            $FormattedDisks.Add($FormattedDisk);
        } 
        else 
        {
            $FormattedDisk = "Disk " + $DiskID.ToString() + " Empty";
            $FormattedDisks.Add($FormattedDisk);
        }
    }

    return $FormattedDisks;
}

Function Get-WindowsArt()
{
    [string[]] $ArtArray  =
            "                         ....::::       ",
            "                 ....::::::::::::       ",
            "        ....:::: ::::::::::::::::       ",
            "....:::::::::::: ::::::::::::::::       ",
            ":::::::::::::::: ::::::::::::::::       ",
            ":::::::::::::::: ::::::::::::::::       ",
            ":::::::::::::::: ::::::::::::::::       ",
            ":::::::::::::::: ::::::::::::::::       ",
            "................ ................       ",
            ":::::::::::::::: ::::::::::::::::       ",
            ":::::::::::::::: ::::::::::::::::       ",
            ":::::::::::::::: ::::::::::::::::       ",
            "'''':::::::::::: ::::::::::::::::       ",
            "        '''':::: ::::::::::::::::       ",
            "                 ''''::::::::::::       ",
            "                         ''''::::       ",
            "                                        ",
            "                                        ",
            "                                        ";
    
    return $ArtArray;
}

Function Screenfetch($distro)
{
    $AsciiArt = "";

    if (-not $distro) 
    {
        $AsciiArt = . Get-WindowsArt;
    }

    if (([string]::Compare($distro, "mac", $true) -eq 0) -or 
        ([string]::Compare($distro, "macOS", $true) -eq 0) -or 
        ([string]::Compare($distro, "osx", $true) -eq 0)) {
            
        $AsciiArt = . Get-MacArt;
    }
    else 
    {
        $AsciiArt = . Get-WindowsArt;
    }

    $SystemInfoCollection = . Get-SystemSpecifications;
    $LineToTitleMappings = . Get-LineToTitleMappings;

    if ($SystemInfoCollection.Count -gt $AsciiArt.Count) 
    { 
        Write-Error "System Specs occupies more lines than the Ascii Art resource selected"
    }

    for ($line = 0; $line -lt $AsciiArt.Count; $line++) 
    {
        Write-Host $AsciiArt[$line] -f Cyan -NoNewline;
        Write-Host $LineToTitleMappings[$line] -f Red -NoNewline;

        if ($line -eq 0) 
        {
            Write-Host $SystemInfoCollection[$line] -f Red;
        }

        elseif ($SystemInfoCollection[$line] -like '*:*') 
        {
            $Seperator = ":";
            $Splitted = $SystemInfoCollection[$line].Split($seperator);

            $Title = $Splitted[0] + $Seperator;
            $Content = $Splitted[1];

            Write-Host $Title -f Red -NoNewline;
            Write-Host $Content;
        }
        else 
        {
            Write-Host $SystemInfoCollection[$line];            
        }
    }
}

## Fetch
# $art = Get-WindowsArt 
# write-host $art

Screenfetch
