#!/bin/bash
echo $(printf "%.8f" $(echo `curl -s https://api.nanopool.org/v1/eth/balance/0x6a4cbfeee1301ca9223c17899928482af7d948d1` | jq -r .data))
