# get-coder.sh
# https://dev.to/babak/how-to-run-vs-code-on-the-server-3c7h
# https://github.com/cdr/code-server/releases
# export LINK_TO_DESIRED_BINARY
export CODER="https://github.com/cdr/code-server/releases/download/2.1665-vsc1.39.2/code-server2.1665-vsc1.39.2-darwin-x86_64.zip"

mkdir ~/code-server
wget -qO- $CODER | tar xvz --strip-components=1 -C ~/.code-server

ls ~/.code-server
