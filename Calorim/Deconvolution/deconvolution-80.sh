#!/bin/bash

./deconvolution -n 100 -k 1.00 -A01 0.0035185 -C0 0.0020 -H 500000 -f o-NO2-Ph-N2-OTf-80.dat | tee deconvolution-80.csv
tail -n 1 deconvolution-80.csv
#gnuplot deconvolution-svg.gnu
#eog deconvolution.svg
