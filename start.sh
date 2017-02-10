#!/bin/bash

# patch config

if [ ! -f /xupnpd/src/.xupnpd.lua.patched ]; then
	echo "Patching configuration file"
	sed -e "s/UPnP-IPTV/${FRONTEND_NAME}/" -e "s/4044/${FRONTEND_PORT}/" -i /xupnpd/src/xupnpd.lua
	touch /xupnpd/src/.xupnpd.lua.patched
else
	echo "Config file appears to be patched already"
fi

# update data
echo "Starting data update from $M3U_URL every 300 seconds"
while true
do
	sleep 300
	timeout -sHUP 1m wget "$M3U_URL" -O /xupnpd/src/playlists/list.m3u
done &

wget "$M3U_URL" -O /xupnpd/src/playlists/list.m3u && /xupnpd/src/xupnpd

