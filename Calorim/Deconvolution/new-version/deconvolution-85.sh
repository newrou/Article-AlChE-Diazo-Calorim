#!/bin/bash

#./deconvolution -n 20 -k1 1.00 -k2 0.08 -C01 0.0009 -C02 0.002 -H1 25000 -H2 -430000 -f o-NO2-Ph-N2-OTf-85.dat # | tee deconvolution-85.csv

./deconvolution -n 10 -Dp 50.0 -k1 0.65 -k2 0.070 -C01 0.0009 -C02 0.0027 -H1 48000 -H2 -430000 -f o-NO2-Ph-N2-OTf-85.dat | tee deconvolution-85.csv

tail -n 1 deconvolution-85.csv > test.sh
chmod a+x ./test.sh
./test.sh
gnuplot test-deconvolution-svg-85.gnu
eog test-deconvolution-85.svg
