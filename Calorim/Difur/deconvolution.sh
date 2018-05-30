#!/bin/bash

./deconvolution -dt 0.1 -k1 2.5 -A01 0.0035185 -C01 0.0003 -H1 -20 -k2 1.0 -A02 0.0035185 -C02 0.0003 -H2 100 > deconvolution.csv
gnuplot deconvolution-svg.gnu
eog deconvolution.svg
