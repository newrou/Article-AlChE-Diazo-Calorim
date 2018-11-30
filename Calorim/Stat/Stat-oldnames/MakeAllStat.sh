#!/bin/bash

for i in *.csv; do
 Name=`basename "$i" .csv`
 ./start-R.sh StatKinetic.R $Name
 grep "\[1\]" < $Name.log > $Name.ext
done
