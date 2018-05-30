#!/bin/bash

./test-deconvolution -n 12000 -dt 1500000 -k1 0.9 -A01 0.0035185 -C01 0.0005 -H1 -25000 -k2 0.07 -A02 0.0035185 -C02 0.001 -H2 400000 > test-deconvolution-85.csv
gnuplot test-deconvolution-svg-85.gnu
gnuplot test-C-svg-85.gnu
eog test-deconvolution-85.svg
#eog test-C-svg-85.svg
