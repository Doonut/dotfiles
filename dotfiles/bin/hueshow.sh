#!/bin/sh
if ps aux | grep '[h]ue.py' > /dev/null ; then
    killall hue.py
else
    hue.py lightshow &
    disown
fi