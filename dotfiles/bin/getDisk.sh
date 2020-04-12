#!/bin/sh
df -h $1 | tail -1 | awk '{ print $4 }'