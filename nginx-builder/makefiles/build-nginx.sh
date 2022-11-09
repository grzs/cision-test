#!/usr/bin/bash

# build nginx
echo "Building and installing Nginx..."
makepkg -i --noconfirm $*

echo "Collecting dependencies..."
ldd `which nginx` | grep '/usr/lib' | cut -d ' ' -f 3 | tee to_pack.txt
file -f to_pack.txt | grep 'symbolic link' | \
    sed -E 's/.*link to (.*)$/\/usr\/lib\/\1/' | tee -a to_pack.txt

echo "Collecting installed files..."
pacman -Ql nginx-cision | cut -d ' ' -f 2 | grep '.*[^/]$' | tee -a to_pack.txt
echo "/etc/nginx/mime.types" >> to_pack.txt

echo "Saving version info..."
nginx -v | tee nginx-version.txt

echo "Creating tarball /nginx.tar.gz..."
sudo tar cvzf /nginx.tar.gz `cat to_pack.txt`

exit 0
