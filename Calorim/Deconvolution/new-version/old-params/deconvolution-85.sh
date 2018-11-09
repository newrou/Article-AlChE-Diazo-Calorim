#!/bin/bash


rm trace/trace*.csv
echo "*** ORIG ***"
./deconvolution -n 0 -Dp 0.1 -k1 0.65 -k2 0.070 -C01 0.0009 -C02 0.0027 -H1 48000 -H2 -430000 -f o-NO2-Ph-N2-OTf-85.dat | tee deconvolution-85.csv
tail -n 1 deconvolution-85.csv > test.sh
chmod a+x ./test.sh
./test.sh
cp test-deconvolution.csv test-deconvolution-85.csv
gnuplot test-deconvolution-svg-85.gnu
cp test-deconvolution-85.svg test-deconvolution-85-orig.svg

#rm trace/trace*.csv
echo "*** 50% ***"
./deconvolution -n 10 -Dp 50.0 -Accuracy 0.001 -k1 0.65 -k2 0.070 -C01 0.0009 -C02 0.0027 -H1 48000 -H2 -430000 -f o-NO2-Ph-N2-OTf-85.dat | tee deconvolution-85.csv

tail -n 1 deconvolution-85.csv > test.sh
chmod a+x ./test.sh
./test.sh
cp test-deconvolution.csv test-deconvolution-85.csv
gnuplot test-deconvolution-svg-85.gnu
cp test-deconvolution-85.svg test-deconvolution-85-opt.svg
