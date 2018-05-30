#!/bin/bash

./difur2 -dt 5e8 -k 1.39e-8 -A0 0.0035185 -C0 0.000239 > eval-p-CH3O-Ph-N2-OTf.csv
./difur2 -dt 1e6 -k 5.33e-6 -A0 0.0042208 -C0 0.000404 > eval-p-NO2-Ph-N2-BF4.csv
./difur2 -dt 1e7 -k 1.33e-6 -A0 0.0033424 -C0 0.00000502 > eval-p-NO2-Ph-N2-OTf.csv
./difur2 -dt 1e6 -k 1.39e-5 -A0 0.0031123 -C0 0.0000220 > eval-p-NO2-Ph-N2-OTs.csv
./difur2 -dt 1e7 -k 8.66e-7 -A0 0.0033424 -C0 0.00000139 > eval-m-NO2-Ph-N2-OTf.csv
./difur2 -dt 1e7 -k 4.17e-7 -A0 0.0033424 -C0 0.00121 > eval-o-NO2-Ph-N2-OTf.csv

gnuplot difur3-svg.gnu
#mv k2.svg k-all.svg
