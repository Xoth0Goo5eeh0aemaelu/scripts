#!/bin/sh
# Simple script to deactivate VPN on suspend
# It will be executed both at suspend and at resume
# Put this in /lib/systemd/system-sleep/

for x in $(/usr/bin/nmcli connection show --active | grep vpn | awk '{print $1}')
do
  /usr/bin/nmcli connection down "${x}"
  sleep 2
done
