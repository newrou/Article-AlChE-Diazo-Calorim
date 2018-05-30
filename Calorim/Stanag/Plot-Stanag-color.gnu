#set terminal postscript eps
#set terminal postscript eps color
set terminal postscript eps mono
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set ylabel "Heat flow, mW/g" font "Helvetica-Bold,18"
set xlabel "Time, h" font "Helvetica-Bold,18"
set bars small
#set xrange [0:100]
#set yrange [-100:0]
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20

set terminal gif giant size 1200,900 transparent linewidth 2 font "Helvetica,18"
set key autotitle columnhead
set datafile separator ","

set style line 1 lt 1 pt 6
set style line 2 lt 2 pt 7
set style line 3 lt 3 pt 8
set style line 4 lt 4 pt 9
set style line 5 lt 5 pt 10
set style line 6 lt 6 pt 11
set style line 7 lt 7 pt 12
set style line 8 lt 8 pt 13

set output "Stanag-75.gif"
plot "Ampoule (12-16-15) NO2-Ph-N2-BF4-75.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " NO2-Ph-N2-BF4", \
 "Ampoule (12-19-15) NO2-Ph-N2-Ts-75.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " NO2-Ph-N2-OTs", \
 "Ampoule (12-22-15) NO2-Ph-N2-Tf-75.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " NO2-Ph-N2-OTf", \
 "Ampoule (12-25-15) CH3O-Ph-N2-Tf-75.dat" using (($1)/3600):(1000*($5)) with lines linestyle 4 ti " CH3O-Ph-N2-OTf"

set output "Stanag-80.gif"
set xrange [0:200]
plot "Ampoule (2-11-16) NO2-Ph-N2-BF4-80.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " NO2-Ph-N2-BF4", \
 "Ampoule (2-12-16) NO2-Ph-N2-Ts-80.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " NO2-Ph-N2-OTs", \
 "Ampoule (2-13-16) NO2-Ph-N2-Tf-80.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " NO2-Ph-N2-OTf", \
 "Ampoule (2-15-16) CH3O-Ph-N2-Tf-80.dat" using (($1)/3600):(1000*($5)) with lines linestyle 4 ti " CH3O-Ph-N2-OTf"

set output "Stanag-85.gif"
set xrange [0:100]
plot "Ampoule (1-21-16) NO2-Ph-N2-BF4-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " NO2-Ph-N2-BF4", \
 "Ampoule (2-1-16) NO2-Ph-N2-Ts-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " NO2-Ph-N2-OTs", \
 "Ampoule (2-9-16) NO2-Ph-N2-Tf-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " NO2-Ph-N2-OTf", \
 "Ampoule (1-12-16) CH3O-Ph-N2-Tf-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 4 ti " CH3O-Ph-N2-OTf"


set output "Stanag-NO2-Ph-N2-BF4.gif"
set xrange [0:60]
plot "Ampoule (12-16-15) NO2-Ph-N2-BF4-75.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " 75", \
 "Ampoule (2-11-16) NO2-Ph-N2-BF4-80.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " 80", \
 "Ampoule (1-21-16) NO2-Ph-N2-BF4-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " 85"

set output "Stanag-NO2-Ph-N2-OTs.gif"
set xrange [0:60]
plot "Ampoule (12-19-15) NO2-Ph-N2-Ts-75.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " 75", \
 "Ampoule (2-12-16) NO2-Ph-N2-Ts-80.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " 80", \
 "Ampoule (2-1-16) NO2-Ph-N2-Ts-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " 85"

set output "Stanag-NO2-Ph-N2-OTf.gif"
set xrange [0:60]
plot "Ampoule (12-22-15) NO2-Ph-N2-Tf-75.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " 75", \
 "Ampoule (2-13-16) NO2-Ph-N2-Tf-80.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " 80", \
 "Ampoule (2-9-16) NO2-Ph-N2-Tf-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " 85"

set output "Stanag-CH3O-Ph-N2-OTf.gif"
set xrange [0:350]
set yrange [-1:6]
plot "Ampoule (12-25-15) CH3O-Ph-N2-Tf-75.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " 75", \
 "Ampoule (2-15-16) CH3O-Ph-N2-Tf-80.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " 80", \
 "Ampoule (1-12-16) CH3O-Ph-N2-Tf-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " 85"

quit

#Ampoule (12-16-15) NO2-Ph-N2-BF4-75.dat
#Ampoule (12-19-15) NO2-Ph-N2-Ts-75.dat
#Ampoule (12-22-15) NO2-Ph-N2-Tf-75.dat
#Ampoule (12-25-15) CH3O-Ph-N2-Tf-75.dat

#Ampoule (2-11-16) NO2-Ph-N2-BF4-80.dat
#Ampoule (2-12-16) NO2-Ph-N2-Ts-80.dat
#Ampoule (2-13-16) NO2-Ph-N2-Tf-80.dat
#Ampoule (2-15-16) CH3O-Ph-N2-Tf-80.dat

#Ampoule (1-21-16) NO2-Ph-N2-BF4-85.dat
#Ampoule (2-1-16) NO2-Ph-N2-Ts-85.dat
#Ampoule (2-9-16) NO2-Ph-N2-Tf-85.dat
#Ampoule (1-12-16) CH3O-Ph-N2-Tf-85.dat
