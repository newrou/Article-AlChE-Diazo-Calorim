#!/bin/bash

#./test-deconvolution -n 12000 -dt 1500000 -k1 0.65 -A01 0.0035185 -C01 0.0009 -H1 48000 -k2 0.070 -A02 0.0035185 -C02 0.0027 -H2 -430000 > test-deconvolution-85.csv

./test-deconvolution -n 12000 -dt 1500000 -k1 0.6565 -A01 0.0035185 -C01 0.0009072 -H1 48384 -k2 0.0707 -A02 0.0035185 -C02 0.002727 -H2 -433440 > test-deconvolution-85.csv
cp test-deconvolution-85.csv 1
./test-deconvolution -n 12000 -dt 1500000 -k1 6.565000e-01 -A01 3.518500e-03 -C01 9.072000e-04 -H1 4.838400e+04 -k2 7.070000e-02 -A02 3.518500e-03 -C02 2.727000e-03 -H2 -4.334400e+05 > test-deconvolution-85.csv
cp test-deconvolution-85.csv 2


gnuplot test-deconvolution-svg-85.gnu
eog test-deconvolution-85.svg
