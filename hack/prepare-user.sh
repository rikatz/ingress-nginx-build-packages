#!/bin/sh
apk update && apk add alpine-sdk
adduser -D build && addgroup build abuild 

### Add build user repos so we can use later
sed -i '1s;^;/home/build/packages/community\n;' /etc/apk/repositories
sed -i '1s;^;/home/build/packages/testing\n;' /etc/apk/repositories

### Copy the public keys to the right location
cp /keys/*.pub /etc/apk/keys

mkdir -p /var/cache/distfiles && chgrp abuild /var/cache/distfiles \
   && chmod g+w /var/cache/distfiles


