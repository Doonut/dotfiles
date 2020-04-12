#!/bin/bash
num=$(aconnect -i | grep "Alesis" | grep "client" | cut -c 8-9)
aconnect $num 128
