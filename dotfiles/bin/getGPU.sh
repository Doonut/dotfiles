#!/bin/bash
nvidia-settings -q gpucoretemp | grep gpu:0 | awk '{ print $4 }' |  rev | cut -c 2- | rev

