#!/bin/bash
pactl unload-module module-loopback 
sleep 2
pactl load-module module-loopback latency_msec=1 source="alsa_input.usb-BurrBrown_from_Texas_Instruments_USB_AUDIO_CODEC-00.analog-stereo" sink="alsa_output.usb-SteelSeries_Arctis_Pro_Wireless-00.iec958-stereo"
# pactl load-module module-loopback latency_msec=1 source="alsa_output.usb-BurrBrown_from_Texas_Instruments_USB_AUDIO_CODEC-00.analog-stereo.monitor" sink="alsa_output.usb-SteelSeries_Arctis_Pro_Wireless-00.iec958-stereo"
# pactl load-module module-loopback latency_msec=1 source="alsa_input.usb-SteelSeries_Arctis_Pro_Wireless-00.multichannel-input" sink="mic"
# pactl load-module module-loopback latency_msec=1 source="alsa_output.usb-BurrBrown_from_Texas_Instruments_USB_AUDIO_CODEC-00.analog-stereo.monitor" sink="mic"
