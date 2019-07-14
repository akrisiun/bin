@echo off
@REM set path=
echo %~dp1bin

dotnet build -o %~dp1bin
dotnet exec "%~dp0/dotnet-iis.dll" %*
