#!/usr/bin/bash

# build nginx
makepkg -i $*

echo "Collecting dependencies..."
ldd `which nginx` | grep '/usr/lib' | cut -d ' ' -f 3 | tee to_pack.txt

echo "Collecting installed files..."
pacman -Ql nginx | cut -d ' ' -f 2 | grep '.*[^/]$' | tee -a to_pack.txt

echo "Saving version info..."
nginx -v | tee nginx-version.txt

echo "Creating tarball /nginx.tar.gz..."
sudo tar cvzf /nginx.tar.gz `cat to_pack.txt`

exit 0
