
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Strong(!)Pass' -e 'MSSQL_PID=Express' -p 1433:1433 -d microsoft/mssql-server-linux:latest

# docker rm sql1433 -f
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Strong@2019' --name sql1433 -e 'MSSQL_PID=Express' -p 1433:1433 -d microsoft/mssql-server-linux:latest
