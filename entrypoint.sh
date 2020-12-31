#!/bin/ash
cd /home/container

# ioquake3 start script for pterodactyl egg dockerfile
# send bug reports to whatever git repo i choose for this thing
# i hate docker

export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# idfk if this is docker or pterodactyl but /home/container gets overridden upon pull so i now get to handle that
if [ -f "/home/container/.gameexists" ]; then
    break
else
    echo 'Game is not installed, installing...'
    /bin/ash /installdemo.sh
    /bin/ash /installconfig.sh
fi

# if end user hasn't change configuration things (checking RCON pwd), then yell at them to actually change it
if grep -xq 'seta rconpassword "secret"' ~/.q3a/baseq3/q3config_server.cfg ; then echo "Please edit your server's configuration files (and change the RCON password)."; exit; fi

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# run server
eval ${MODIFIED_STARTUP}
