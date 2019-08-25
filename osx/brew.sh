#!/bin/bash

# OK SSL
# /usr/local/etc/openssl/certs
# openssl is keg-only, which means it was not symlinked into /usr/local,
# because Apple has deprecated use of OpenSSL in favor of its own TLS and crypto libraries.
# /usr/local/opt/openssl/bin/c_rehash

echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.bash_profile

# For compilers to find openssl you may need to set:

echo 'export LDFLAGS="-L/usr/local/opt/openssl/lib"' >> ~/.bash_profile
echo 'export CPPFLAGS="-I/usr/local/opt/openssl/include"' >> ~/.bash_profile

#  /usr/local/etc/openssl/certs

source ~/.bash_profile
env

