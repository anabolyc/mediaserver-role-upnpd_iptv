#!/bin/bash

url=

while getopts u: opt; do
  case $opt in
  u)
      url=$OPTARG
      ;;
  esac
done

# update data
echo "Starting data update from $M3U_URL every 300 seconds"
while true
do
	timeout -sHUP 1m wget "$M3U_URL" -P /xupnpd/src/playlists/
	sleep 300
done &

/xupnpd/src/xupnpd

