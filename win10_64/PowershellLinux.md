
https://github.com/PowerShell/PowerShell/blob/master/docs/installation/linux.md#ubuntu-1604

## Powershell deb libicu55 require for 16.04 ubuntu

https://github.com/PowerShell/PowerShell/issues/3876  - powershell deb 
for ubuntu require libicu55 (not 52)  for 16.04 
success...
```
# sudo ps  # refreshing password for curl
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
# not 14 : 16.04
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list
sudo apt-get update
sudo apt-get install -y powershell
# failure:
# Depends: libicu52 but it is not installable

eval "echo \"deb [arch=amd64] https://packages.microsoft.com/ubuntu/16.04/prod xenial main\"" > microsoft.list
sudo mv microsoft.list /etc/apt/sources.list.d/microsoft.list.microsoft
cat /etc/apt/sources.list.d/microsoft.list.microsoft                                

$ cat /etc/apt/sources.list.d/microsoft.list
deb [arch=amd64] https://packages.microsoft.com/ubuntu/14.04/prod trusty main
$ lsb_release -r -c
Release:        16.04
Codename:       xenial

$ eval "echo \"deb [arch=amd64] https://packages.microsoft.com/ubuntu/16.04/prod xenial main\"" > microsoft.list
$ sudo mv microsoft.list /etc/apt/sources.list.d/microsoft.list.microsoft
$ cat /etc/apt/sources.list.d/microsoft.list.microsoft                                                  
deb [arch=amd64] https://packages.microsoft.com/ubuntu/16.04/prod xenial main

$ sudo apt-get install -y powershell
Reading package lists... Done
```

powershell is already the newest version (6.0.1-1.ubuntu.16.04).


## then again:
```
sudo apt-get update
sudo apt-get install -y powershell
sudo apt-get install -y dotnet-runtime-2.0.0
```

### pwsh workaround

```
$ sudo ls /opt/microsoft/powershell/6.0.1/pw*
$ sudo ln -s /opt/microsoft/powershell/6.0.1/pwsh /usr/local/bin/powershell
```

### https://github.com/PowerShell/PowerShell/blob/master/docs/installation/linux.md

UNIX: On Linux and macOS, the XDG Base Directory Specification is respected.
https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

```
powershell
PowerShell v6.0.1
Copyright (c) Microsoft Corporation. All rights reserved.
https://aka.ms/pscore6-docs
PS> $PSVersionTable
 Error reading or writing history file '/home/andriusk/.local/share/powershell/PSReadLine/ConsoleHost_history.txt':
    Access to the path '/home/andriusk/.local/share/powershell/PSReadLine/ConsoleHost_history.txt' is denied.

Name                           Value
----                           -----
PSVersion                      6.0.1
PSEdition                      Core
GitCommitId                    v6.0.1
OS                             Linux 4.4.0-43-Microsoft #1-Microsoft Wed Dec 31 14:42:53 PST 2014
Platform                       Unix
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
WSManStackVersion              3.0
```


### Windows 1709

```
>winver
Windows 10, version 1709 (16299.98)                             
> ubuntu.exe run "/bin/bash"                                                            
andriusk@GREEN:/mnt/c/Users/Andrius$ screenfetch                                   
The program 'screenfetch' is currently not installed. You can install it by typing:
sudo apt install screenfetch                                                       
andriusk@GREEN:/mnt/c/Users/Andrius$ screenfetch-dev                                    
screenfetch-dev: command not found                                                 
andriusk@GREEN:/mnt/c/Users/Andrius$ /mnt/c/bin/bin/screenfetch-dev                     
                  yyyyy. 'yyyyyy+      OS: Ubuntu 16.04 xenial [Ubuntu on Windows 10]
              .;//+/////h yyyyyyo      Kernel: x86_64 Linux 4.4.0-43-Microsoft       
           .++ .:/++++++/-.`sss/`      Uptime: 55m                                   
         .:++o: `\++++++++/:---:/-     Packages: 676                                 
        o:+o+:++. `````'-/ooo+++++\    Shell: bash 4.3.48                               
       .:+o:+o/.          `+sssooo+\   CPU: Intel Core i7 920 @ 8x 2.793GHz          
  .++/+ +oo+o:`             \sssooo;   RAM: 4069MiB / 8190MiB 
```


https://github.com/PowerShell/PowerShell/blob/master/docs/installation/linux.md#ubuntu-1604
  
## or 

```
sudo apt-get install -y libicu55
sudo apt-get install -y libicu52
```

### OR: https://shazwazza.com/post/installing-net-core-101-on-ubuntu-1610/ 

```
sudo apt-get install -y apt-transport-https dirmngr
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanag... yakkety main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
sudo apt-get update
sudo apt-get install -y dotnet-dev-1.0.0-preview2.1-003177
```
