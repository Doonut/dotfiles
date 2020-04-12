#!/usr/bin/python

import requests, json, time, threading, sys, os

def main():
    if len(sys.argv) > 1:
        ip = '10.0.0.100'
        apiKey = 'NYjTX05rcNnD9ngYIbZMmDd6oKeSr3YeJRZmMjNJ'
        lights = Hue(ip, apiKey)
        argCase = {
            "lightshow": lambda: lights.colorShow(),
            "lightswitch": lambda: lights.lightSwitch(not lights.lightState()),
            "lightup": lambda: lights.up(),
            "lightdown": lambda: lights.down(),
            "satup": lambda: lights.satup(),
            "satdown": lambda: lights.satdown(),
            "ctup": lambda: lights.ctup(),
            "ctdown": lambda: lights.ctdown(),
            "colup": lambda: lights.colup(),
            "coldown": lambda: lights.coldown()
        }
        func = argCase.get(sys.argv[1], lambda: argTable())
        func()
    else:
        argTable()   

def argTable():
    print("Args: lightshow lightswitch lightup lightdown")    

class Hue:
    def __init__(self, ip, apiKey):
        self.bridge = 'http://' + ip + '/api/' + apiKey + '/'

    def lightState(self):
        url = self.bridge + 'groups/1'
        response = requests.get(url=url)
        desel = response.json()
        return desel["state"]["all_on"]

    def lightSwitch(self, state):
        url = self.bridge + 'groups/1/action'
        body = {"on": state}
        requests.put(url=url, data=json.dumps(body))

    def colorShow(self):
        self.lightSwitch(True)
        url = self.bridge + 'groups/1/action'
        while True:
            for x in range(66):
                time.sleep(1)
                body = {"hue": x * 1000}
                resp = requests.put(url=url, data=json.dumps(body))

    def down(self):
        url = self.bridge + 'groups/1/action'
        body = {"bri_inc": -25}
        resp = requests.put(url=url, data=json.dumps(body))

    def up(self):
        url = self.bridge + 'groups/1/action'
        body = {"bri_inc": 25}
        requests.put(url=url, data=json.dumps(body))

    def satdown(self):
        url = self.bridge + 'groups/1/action'
        body = {"sat_inc": -15}
        resp = requests.put(url=url, data=json.dumps(body))

    def satup(self):
        url = self.bridge + 'groups/1/action'
        body = {"sat_inc": 15}
        requests.put(url=url, data=json.dumps(body))

    def coldown(self):
        url = self.bridge + 'groups/1/action'
        body = {"hue_inc": -1000}
        resp = requests.put(url=url, data=json.dumps(body))

    def colup(self):
        url = self.bridge + 'groups/1/action'
        body = {"hue_inc": 1000}
        requests.put(url=url, data=json.dumps(body))

    def ctdown(self):
        url = self.bridge + 'groups/1/action'
        body = {"ct_inc": -35}
        resp = requests.put(url=url, data=json.dumps(body))

    def ctup(self):
        url = self.bridge + 'groups/1/action'
        body = {"ct_inc": 35}
        requests.put(url=url, data=json.dumps(body))

if __name__ == "__main__":
    main()
