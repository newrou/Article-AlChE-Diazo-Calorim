#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import shutil
import os
import re

import NameCalorym

fname = sys.argv[1]
f = open(fname, "r")
#lines = f.readlines()
lines = f.read().splitlines()
f.close()

delim = re.compile(r"[;]")

print lines[0]
for line in lines[1:] :
    m = delim.split(line)
#    print m,
    print NameCalorym.getNameCalorym(m[0]),
    for s in m[1:]:
	print (';%s' % s),
    print ''
