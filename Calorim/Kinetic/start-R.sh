#!/bin/bash

name=`basename $1 .R`

Rscript --vanilla $name.R $2 $3 $4 | tee $2.log
##R -q --vanilla <$name.R $2 $3  | tee $name.log
