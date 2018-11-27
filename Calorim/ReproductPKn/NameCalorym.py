#!/usr/bin/python
# -*- coding: utf-8 -*-

import re

def getNameCalorym(name):
    dic = {}
    
    # Sample1 R1 Nitrogen (1)
    dic['3-31-16'] = 'Sample1 R1 Nitrogen'
    dic['4-4-16'] = 'Sample1 R1 Nitrogen'
    dic['4-7-16'] = 'Sample1 R1 Nitrogen'
    
    # Sample2 R0 Nitrogen (2-1)
    
    dic['4-12-16'] = 'Sample2 R0 Nitrogen'
    dic['4-18-16'] = 'Sample2 R0 Nitrogen'
    
    # Sample2 R1 Nitrogen (2-2)
    dic['3-24-16'] = 'Sample2 R1 Nitrogen'
    dic['4-14-16'] = 'Sample2 R1 Nitrogen'
    dic['4-9-16'] = 'Sample2 R1 Nitrogen'
    
    # Sample3 R0 Nitrogen (3-1)
    dic['3-18-16'] = 'Sample3 R0 Nitrogen'
    dic['3-22-16'] = 'Sample3 R0 Nitrogen'
    dic['3-11-16'] = 'Sample3 R0 Nitrogen'
    
    # Sample3 R1 Nitrogen (3-2)
    dic['3-16-16'] = 'Sample3 R1 Nitrogen'
    dic['2-1-16'] = 'Sample3 R1 Nitrogen'
    
    # Sample3 R2 Nitrogen (3-3)
    dic['5-13-16'] = 'Sample3 R2 Nitrogen'
    dic['5-17-16'] = 'Sample3 R2 Nitrogen'
    
    # Sample3 R2 Nitrogen (3-4)
    dic['6-13-16'] = 'Sample3 R2 Argon'
    dic['6-15-16'] = 'Sample3 R2 Argon'
    dic['6-17-16'] = 'Sample3 R2 Argon'
    dic['6-21-16'] = 'Sample3 R2 Argon'
    dic['6-2-16'] = 'Sample3 R2 Argon'
    
    # Sample3 R2 Air (3-4)
    dic['4-29-16'] = 'Sample3 R2 Air'
    dic['5-19-16'] = 'Sample3 R2 Air'
    dic['3-14-16'] = 'Sample3 R2 Air'
    
    delim = re.compile(r"[ .]")
    m = delim.split(name)
    sdate = m[1]
    date = sdate[1:-1]
    comment = dic.get(date, 'Nitrogen')

    return( '4-NO2C6H4N2+ TsO- 85 %s %s' % (comment, date) )
