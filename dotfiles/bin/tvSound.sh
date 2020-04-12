#!/bin/bash
pactl load-module module-null-sink sink_name=remote
pacmd update-sink-proplist remote device.description=TV
sleep 1
ffmpeg -f pulse -i "remote.monitor" -ac 2 -acodec pcm_u8 -ar 48000 -f u8 "udp://10.0.0.50:18181"
