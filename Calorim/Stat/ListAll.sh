#!/bin/bash

for i in *.csv; do
 Name=`basename "$i" .csv`
 echo "$Name; ; ; ; ;"
done
