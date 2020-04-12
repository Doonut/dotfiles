#!/bin/bash
sshpass -p asdqwe ssh kyle@10.0.0.25 -t "psexec -i 1 C:\Users\kyle\LCDoff.exe"
sleep 1 && /usr/bin/sudo xset dpms force off
