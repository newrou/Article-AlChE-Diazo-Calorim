#!/bin/bash

./test-deconvolution -n 12000 -dt 1500000 -k1 1.650 -A01 0.0035185 -C01 0.002 -H1 40000 -k2 0.044 -A02 0.0002 -C02 0.0045 -H2 -430000 > test-deconvolution-85.csv
gnuplot test-deconvolution-svg-85.gnu
eog test-deconvolution-85.svg
