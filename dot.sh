@echo "https://www.microsoft.com/net/download/linux"

wget  https://dot.net/v1/dotnet-install.sh

chmod  +x  dotnet-install.sh
./dotnet-install.sh --shared-runtime
