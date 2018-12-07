#!/bin/bash

mkdir -p cont
list=`ls *.log`
for i in $list
do
   Name=`basename $i .log`
   InName=cont/`basename $i .log`-T353.gjf
   echo "New file: "$Name
   cat head-gaussian > $InName
   echo "$Name-$1-$2" >> $InName
   echo "" >> $InName
   Charge="0 1"
   if [[ $i =~ "-.mol" ]] ; then 
      Charge="-1 1"
   fi
   if [[ $i =~ "+.mol" ]] ; then 
      Charge="1 1"
   fi
   echo "Charge: [$Charge]"
   echo "$Charge" >> $InName
   babel -ig09 $i -ogjf - | tail -n +6 >> $InName
   cat tail-gaussian >> $InName
done
