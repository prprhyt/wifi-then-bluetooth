#!/bin/bash

list="ssid1 ssid2"
wifi_state=`networksetup -getairportpower en0  | awk '{print $4}'`
if [[ $wifi_state == *Off* ]]; then networksetup -setairportpower en0 on && sleep 1; fi
connected_ssid=`networksetup -getairportnetwork  en0  | awk '{print $4}'`
[[ $list =~ (^|[[:space:]])$connected_ssid($|[[:space:]]) ]] && /usr/local/bin/blueutil -p 1 || /usr/local/bin/blueutil -p 0