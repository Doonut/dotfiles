#!/bin/bash

TOGGLE=$HOME/.toggleWindows
DESKTOPS=(
    "4/a"
	"4/b"
	"4/c"
	"4/d"
	"4/e"
	"4/f"
    "4/g"
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
	    bspc desktop -f $DESKTOP
		bspc desktop -m $MONITOR
    done
    bspc desktop -f "4/a"
else
    rm $TOGGLE
    sudo ddcutil -d 1 setvcp 60 0x11
    sed -i 's:^configFile.*$:configFile=/home/kyle/.thinkSynergy.conf:g' /home/kyle/.config/Synergy/Synergy.conf
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
    	bspc desktop -f $DESKTOP
		bspc desktop -m $MONITOR
    done
    bspc desktop -f "3/a"
fi
