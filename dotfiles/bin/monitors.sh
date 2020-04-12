#!/bin/bash
sleep 1
if [ $(xset -q dpms | grep Monitor | awk  '{print $3}') == "On" ]; then
	xset dpms force off
else
	xset dpms force on
fi
