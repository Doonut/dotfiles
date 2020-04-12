#!/bin/bash
echo "scale=5;" $(echo `curl -s 'https://api.etherscan.io/api?module=account&action=balance&address=0xc9Be024a701229Fafbaf436a484B3243039749DC&tag=latest&apikey=E1PUZ7Q83TASVKH89181ZNSRHQT5J9E1IR'` | jq -r .result) "/ 1000000000000000000" | bc
