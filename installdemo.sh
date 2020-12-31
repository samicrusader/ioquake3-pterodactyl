#!/bin/ash

# ioquake3 install script for pterodactyl egg dockerfile
# send bug reports to whatever git repo i choose for this thing
# i hate docker

printf "I am currently running as $(whoami) in $(pwd)\n"

cd /home/container
git clone https://github.com/ioquake/ioq3.git /home/container/ioq3
cd /home/container/ioq3
make
mv build/release-linux-x86_64 /home/container/ioquake3
cd /home/container
mkdir -p /home/container/.q3a
rm -rf /home/container/ioq3
ash -c 'wget -nv --header="Referer: https://ioquake3.org/extras/patch-data/" "https://www.ioquake3.org/data/quake3-latest-pk3s.zip" -O- | unzip -'
rm -rf quake3-latest-pk3s.zip
mv /home/container/quake3-latest-pk3s/* /home/container/.q3a/.
wget 'https://konch.ie/W2rhjV0gPgAC.pk3' -O /home/container/.q3a/baseq3/pak0.pk3
