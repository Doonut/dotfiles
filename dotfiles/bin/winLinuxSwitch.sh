#!/bin/bash

TOGGLE=$HOME/.toggleWindows
DESKTOPS=(
    0x0040000A
    0x0040001D
    0x0040001E
    0x0040001F
    0x00400020
    0x00400021
)

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    sudo ddcutil -d 1 setvcp 60 0x0f
    killall synergy
    killall synergys
    killall glava
    xrandr --output DisplayPort-0 --mode 1920x1080 --set TearFree on --pos 1920x1440 --rotate normal \
        --output DisplayPort-1 --mode 1920x1080 --set TearFree on --pos 0x1440 --rotate normal \
        --output DisplayPort-2 --mode 1920x1080 --set TearFree on --pos 3840x1440 --rotate normal \
        --output HDMI-A-0 --off \
        --output DVI-D-0 --primary --mode 2560x1440_86 --set TearFree on --pos 1600x0 --rotate normal
    killall polybar
    polybar -c ~/.config/polybar/configLinux full &
    feh --bg-scale --no-xinerama ~/Pictures/solarizedBGtri.png
    glava &
    MONITOR="0x00400002"
    for DESKTOP in "${DESKTOPS[@]}"
    do
	    bspc desktop -m $MONITOR
	    bspc monitor -f $MONITOR
	    bspc desktop -f $DESKTOP
    done
else
    rm $TOGGLE
    sudo ddcutil -d 1 setvcp 60 0x03
    synergy &
    killall glava
    xrandr --output DisplayPort-0 --off \
        --output DisplayPort-1 --mode 1920x1080 --set TearFree on --pos 1988x0 --rotate normal \
        --output DisplayPort-2 --mode 1920x1080 --set TearFree on --pos 0x0 --rotate normal \
        --output HDMI-A-0 --off \
        --output DVI-D-0 --primary --mode 2560x1440_86 --set TearFree on --pos 0x1121 --rotate normal
    killall polybar
    polybar full &
    feh --bg-scale --no-xinerama ~/Pictures/LinuxOnWin.png
    glava -r "setgeometry 0 1121 2560 1440" &
    MONITOR="0x00400008"
    for DESKTOP in "${DESKTOPS[@]}"
    do
    	bspc desktop -m $MONITOR
    	bspc monitor -f $MONITOR
    	bspc desktop -f $DESKTOP
    done
fi
