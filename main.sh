#!/bin/bash

list="ssid1 ssid2"
connected_ssid=`networksetup -getairportnetwork  en0  | awk '{print $4}'`
echo $connected_ssid
[[ $list =~ (^|[[:space:]])$connected_ssid($|[[:space:]]) ]] && blueutil -p 1