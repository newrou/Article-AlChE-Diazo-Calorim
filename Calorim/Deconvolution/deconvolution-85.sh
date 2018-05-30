#!/bin/bash

./deconvolution -n 3 -k1 1.00 -k2 0.08 -C01 0.0009 -C02 0.002 -H1 25000 -H2 430000 -f o-NO2-Ph-N2-OTf-85.dat > deconvolution-85.csv
tail -n 1 deconvolution-85.csv
#gnuplot deconvolution-svg.gnu
#eog deconvolution.svg
