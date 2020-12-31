#!/bin/ash

# ioquake3 install script for pterodactyl egg dockerfile
# send bug reports to whatever git repo i choose for this thing
# i hate docker

cd ~
git clone https://github.com/ioquake/ioq3.git ~/ioq3
cd ~/ioq3
make
mv build/release-linux-x86_64 ~/ioquake3
cd ~
mkdir -p ~/.q3a
rm -rf ~/ioq3
ash -c 'wget --header="Referer: https://ioquake3.org/extras/patch-data/" "https://www.ioquake3.org/data/quake3-latest-pk3s.zip" -O- | unzip -'
mv ~/quake3-latest-pk3s/* ~/.q3a/.
wget 'https://konch.ie/W2rhjV0gPgAC.pk3' -O ~/.q3a/baseq3/pak0.pk3
