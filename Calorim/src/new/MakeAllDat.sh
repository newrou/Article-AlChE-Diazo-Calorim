#!/bin/bash

list=`ls *.csv`
for i in *.csv; do
 Name=`basename "$i" .csv`
 echo "Run file: "$Name
 ./sect < "$Name.csv" > "$Name.dat"
done
