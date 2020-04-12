#!/bin/bash
echo \$$(printf "%.2f" $(echo `curl -s https://poloniex.com/public?command=returnTicker` | jq -r .USDT_BTC.last))
