#!/bin/bash

list="ssid1 ssid2"
connected_ssid=`networksetup -getairportnetwork  en0  | awk '{print $4}'`
[[ $list =~ (^|[[:space:]])$connected_ssid($|[[:space:]]) ]] && /usr/local/bin/blueutil -p 1 || /usr/local/bin/blueutil -p 0