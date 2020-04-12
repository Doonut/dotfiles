#!/bin/bash
NUM=$(pactl list sink-inputs | grep Spotify -B 17 | grep "Sink Input" | cut -d " " -f 3)
NUM="${NUM:1}"
if [ $1 = "up" ]
then
    pactl set-sink-input-volume $NUM "+5%"
else
    pactl set-sink-input-volume $NUM "-5%"
fi