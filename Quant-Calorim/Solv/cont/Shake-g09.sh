#!/bin/bash

new=`basename $1 -orig`
echo "New file: $new"
./ShakeMol-g09 -d 0.007 <$1 >$new
