#!/bin/bash

list="ssid1 ssid2"
wifi_state=`networksetup -getairportpower en0  | awk '{print $4}'`
if [[ $wifi_state == Off ]]; then networksetup -setairportpower en0 on; fi
for ((i=0; i < 5; i++)); do
    connected_ssid=`networksetup -getairportnetwork  en0`
    if [[ $connected_ssid == *"You are not associated with an AirPort network."* ]]; then sleep 1 && continue; fi
    connected_ssid=`echo $connected_ssid | awk '{print $4}'`
    [[ $list =~ (^|[[:space:]])$connected_ssid($|[[:space:]]) ]] && /usr/local/bin/blueutil -p 1 || /usr/local/bin/blueutil -p 0
    exit
done
networksetup -setairportpower en0 off
/usr/local/bin/blueutil -p 0
