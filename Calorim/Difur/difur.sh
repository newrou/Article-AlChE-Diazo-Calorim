#!/bin/bash

./difur -k 0.05 -A0 0.5 -C0 0.001 > k1.csv
./difur -k 0.1 -A0 0.5 -C0 0.001 > k2.csv
./difur -k 0.2 -A0 0.5 -C0 0.001 > k3.csv
./difur -k 0.4 -A0 0.5 -C0 0.001 > k4.csv

gnuplot difur-svg.gnu
mv k.svg f-k.svg

./difur -k 0.1 -A0 0.5 -C0 0.00001 > k1.csv
./difur -k 0.1 -A0 0.5 -C0 0.001 > k2.csv
./difur -k 0.1 -A0 0.5 -C0 0.1 > k3.csv
./difur -k 0.1 -A0 0.5 -C0 0.2 > k4.csv

gnuplot difur-svg.gnu
mv k.svg f-C0.svg

