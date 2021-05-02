
#!/bin/bash

curl https://dot.net/v1/dotnet-install.sh
curl https://dot.net/v1/dotnet-install.ps1

chmod +x ~/bin/dotnet-install.sh

# ~/bin/dotnet-install.sh --version 3.1.404
sudo ~/bin/dotnet-install.sh --install-dir /usr/local/share/dotnet --version 3.1.404

dotnet --info
