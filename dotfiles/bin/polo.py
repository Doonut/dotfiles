#!/bin/python
import poloniex
polo = poloniex.Poloniex('7QV50NEP-MGCU503C-OLHPNS5G-EE4IDEFB','43b4109214e428b7f587f73f2fa66daa4e4be36b5d54eff1163530ed8bf1edaeb9490daeaa55346dcc4f609bdbdf528df1c8ce54b115f884ffa9f3317ab46f6f');
balance = polo.returnCompleteBalances();
value = (float(balance['BTC']['btcValue']) + float(balance['ETH']['btcValue'])) * float(polo.returnTicker()['USDT_BTC']['last']);
print("$%.2f" % value);