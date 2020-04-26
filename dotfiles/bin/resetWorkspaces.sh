#!/bin/bash
MONITORS=(
	"0x00400004"
	"0x00400006"
	"0x00400008"
	"0x00400002"
)
DESKTOPS=(
	"a"
	"b"
	"c"
	"d"
	"e"
	"f"
)
i=1
for MONITOR in "${MONITORS[@]}"
do
	for DESKTOP in "${DESKTOPS[@]}"
	do
		bspc desktop -f $i/$DESKTOP
		bspc desktop -m $MONITOR
	done
	i=$((i+1))
done
