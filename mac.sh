#!/bin/bash

echo "Changing Mac Address..."

sudo /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -z
sudo ifconfig en0 ether $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
sudo networksetup -detectnewhardware

echo "New Mac Address: `ifconfig en0 |grep ether`"

