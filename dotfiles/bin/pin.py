#!/usr/bin/python
 
import time
import sys
import os
import re
 
def read_file(filename):
    with open(filename) as file:
        data = file.read().rstrip()
        return data
 
def parse_affinity(str):
    values = set()
 
    if str == '-':
        return values
 
    for value in str.split(","):
        values.add(int(value.strip()))
 
    return values
 
qemu_cpu_regex = re.compile('CPU (\d+)/KVM')
 
 
delay = 0.5
print("sleeping for {0} seconds...".format(delay))
time.sleep(delay)
 
pid = int(read_file(sys.argv[1]))
default_affinity = parse_affinity(sys.argv[2])
core_affinities = []
 
for value in sys.argv[3:]:
    core_affinities.append(parse_affinity(value))
 
 
print("pid = {0}".format(pid))
print("default affinity = {0}".format(default_affinity))
 
for index, value in enumerate(core_affinities):
    print("core affinity {0}: {1}".format(index, value))
 
 
 
   
 
threads = os.listdir("/proc/{0}/task".format(pid))
 
 
print("threads: {0}".format(threads))
 
for thread in threads:
    thread = int(thread)
    name = read_file("/proc/{0}/task/{1}/comm".format(pid, thread))
    current_affinities = os.sched_getaffinity(thread)
    match = qemu_cpu_regex.match(name)
   
    if match:
        core = int(match.group(1))
       
        try:
            target_affinities = core_affinities[core]
        except IndexError:
            target_affinities = default_affinity
    else:
        target_affinities = default_affinity
 
    update = len(target_affinities) > 0 and current_affinities != target_affinities
 
    print("thread: {0} name: {1} affinity: {2} target = {3} update = {4}".format(thread, name, current_affinities, target_affinities, update))
 
    if update:
        try:
            os.sched_setaffinity(thread, target_affinities)
        except OSError as err:
            print("sched_setaffinity({0}, {1}): {2}".format(thread, target_affinities, err))
