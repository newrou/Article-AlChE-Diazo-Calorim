#!/bin/bash

./test-deconvolution -n 12000 -dt 1500000 -k1 1.50 -A01 0.0035185 -C01 0.0001 -H1 -5000 -k2 0.05 -A02 0.0035185 -C02 0.0045 -H2 390000 > test-deconvolution-85.csv
gnuplot test-deconvolution-svg-85.gnu
eog test-deconvolution-85.svg
