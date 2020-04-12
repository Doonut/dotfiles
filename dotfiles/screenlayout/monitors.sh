#!/bin/sh
xrandr --newmode "2560x1440_86" 330.00 2560 2608 2640 2652  1440 1441 1444 1445 +hsync +vsync
xrandr --addmode DVI-D-0 2560x1440_86
xrandr --output DisplayPort-0 --off --output DisplayPort-1 --mode 1920x1080 --set TearFree on --pos 1988x0 --rotate normal --output DisplayPort-2 --mode 1920x1080 --set TearFree on --pos 0x0 --rotate normal --output HDMI-A-0 --off --output DVI-D-0 --primary --mode 2560x1440_86 --set TearFree on --pos 0x1121 --rotate normal
