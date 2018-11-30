#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import shutil
import os

import NameCalorym

fname1 = sys.argv[1]
fname2 = NameCalorym.getNameCalorym(fname1)
print fname2
#shutil.copyfile(fname1, fname2)
