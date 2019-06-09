#!/bin/bash

# virtualbox
vboxmanage list vms
vboxmanage startvm win22 --type headless

# docker mssql
docker ps
docker start sql1

# totalcmd &
wine c:/bin/totalcmd/totalcmd.exe &
