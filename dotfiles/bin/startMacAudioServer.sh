#!/bin/bash
while true
	do nc -l 16002 | pacat --latency-msec=1
done
