#!/bin/sh
git config --global user.name "Ingress NGINX build system" 
git config --global user.email "ingress@kubernetes.io" 
mkdir /home/build/.abuild

cp /keys/* /home/build/.abuild/
echo 'PACKAGER_PRIVKEY="/home/build/.abuild/key.rsa"' > /home/build/.abuild/abuild.conf
chmod -R 0700 /home/build/.abuild

cd /home/build
git clone https://gitlab.alpinelinux.org/alpine/aports