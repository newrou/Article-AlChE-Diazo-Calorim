#!/bin/bash


rm trace/trace*.csv
echo "*** ORIG ***"
./deconvolution -n 0 -Dp 0.1 -k1 0.30 -A01 0.0035185 -C01 0.0020 -H1 45000 -k2 0.055 -A02 0.0035185 -C02 0.0020 -H2 -430000 -f o-NO2-Ph-N2-OTf-80.dat | tee deconvolution-80.csv
tail -n 1 deconvolution-80.csv > test.sh
chmod a+x ./test.sh
./test.sh
cp test-deconvolution.csv test-deconvolution-80.csv
gnuplot test-deconvolution-svg-80.gnu
cp test-deconvolution-80.svg test-deconvolution-80-orig.svg

#rm trace/trace*.csv
echo "*** 50% ***"
./deconvolution -n 10 -Dp 50.0 -Accuracy 0.001 -k1 0.30 -A01 0.0035185 -C01 0.0020 -H1 45000 -k2 0.055 -A02 0.0035185 -C02 0.0020 -H2 -430000 -f o-NO2-Ph-N2-OTf-80.dat | tee deconvolution-80.csv

tail -n 1 deconvolution-80.csv > test.sh
chmod a+x ./test.sh
./test.sh
cp test-deconvolution.csv test-deconvolution-80.csv
gnuplot test-deconvolution-svg-80.gnu
cp test-deconvolution-80.svg test-deconvolution-80-opt.svg
