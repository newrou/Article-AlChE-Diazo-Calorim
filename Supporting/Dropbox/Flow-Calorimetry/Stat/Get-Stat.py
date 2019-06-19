#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import re

def PrintStat(s):
    delim = re.compile(r"[ ]")
    m = delim.split(s)
    r = '%s %s %s' % (m[3], m[4], m[5])
    return r

fname = sys.argv[1]

f = open(fname, "r")
lines = f.readlines()
#print len(lines)
f.close()

k = PrintStat(lines[2])
dH = PrintStat(lines[3])
P0 = PrintStat(lines[1])
C0 = PrintStat(lines[4])

print '<tr> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> </tr>' % (fname, k, dH, P0, C0)
