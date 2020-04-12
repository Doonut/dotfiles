#!/bin/bash
while true
  do
    if test -f "/home/kyle/.rebootLoopbacks"; then
      /home/kyle/bin/rebootLoopbacks.sh
      rm /home/kyle/.rebootLoopbacks
    fi
    sleep 5
done
