#!/bin/bash

./difur2 -dt 1e10 -k 1.2e-14 -A0 0.0035185 -C0 0.000239 > eval-CH3O-Ph-N2-OTf.csv
./difur2 -dt 1e10 -k 6.3e-11 -A0 0.0042208 -C0 0.000404 > eval-NO2-Ph-N2-BF4.csv
./difur2 -dt 1e10 -k 1.8e-15 -A0 0.0033424 -C0 0.00000502 > eval-NO2-Ph-N2-OTf.csv
./difur2 -dt 1e10 -k 2.6e-11 -A0 0.0031123 -C0 0.0000220 > eval-NO2-Ph-N2-OTs.csv

gnuplot difur2-svg.gnu
mv k2.svg k-all.svg

