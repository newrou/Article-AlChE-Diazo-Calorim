#!/bin/bash

mkdir -p RightNames

for i in *.rslt; do
 Name=`basename "$i" .rslt`
 echo $Name
 RName=`./MakeNameCalorym.py "$Name"`
 cp "$i" "RightNames/$RName.rslt"
done
