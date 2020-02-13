@echo "https://www.microsoft.com/net/download/linux"

# wget https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh
curl -sSL https://dot.net/v1/dotnet-install.sh > dotnet-install.sh

chmod  +x  dotnet-install.sh
# ./dotnet-install.sh --shared-runtime
./dotnet-install.sh --runtime dotnet
