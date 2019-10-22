help:
	@echo "nuget ipinfo | cd_nuget"
ipinfo:
	curl ipinfo.io
nuget:
	cd /mnt/c/Work_Exe/NugetServer/
	@echo "xsp4 --port 9001 &"
