#!/bin/bash
num=$(xinput | grep Tartarus | grep keyboard | grep "            " | cut -f 2 | cut -c 4-5)
xinput --disable $num
actkbd -c /home/kyle/.actkbd.conf -s -d /dev/input/$(cat /proc/bus/input/devices | grep Razer -A 4 | grep leds | cut -d " " -f 4)

