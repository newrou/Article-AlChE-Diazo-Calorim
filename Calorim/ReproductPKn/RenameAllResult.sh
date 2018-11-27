#!/bin/bash

mkdir -p RightNames

for i in *.dat; do
 Name=`basename "$i" .dat`
 echo $Name
 RName=`./MakeNameCalorym.py "$Name"`
 cp "$i" "RightNames/$RName.dat"
done
