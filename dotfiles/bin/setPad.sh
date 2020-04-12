#!/bin/bash
sleep 1
DISPLAY=":0.0"
HOME=/home/kyle/
XAUTHORITY=$HOME/.Xauthority
export DISPLAY XAUTHORITY HOME
num=$(xinput | grep UGTAB | grep pointer | grep -v Mouse | cut -f 2 | cut -c 4-5)
xinput map-to-output $num DisplayPort-0
