#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set ylabel "Heat flow, mW/g" font "Helvetica-Bold,18"
set xlabel "Time, h" font "Helvetica-Bold,18"
set bars small
set xrange [0:50]
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

set output "Reproduct-V1-src.gif"
plot "Ampoule (2-1-16) NO2-Ph-N2-Ts-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 7 ti " V0", \
 "Ampoule (3-11-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " Src v1", \
 "Ampoule (3-14-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " Src v2", \
 "Ampoule (3-16-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " Src v3", \
 "Ampoule (3-18-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 4 ti " Src v4", \
 "Ampoule (3-22-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 5 ti " Src v5"

set output "Reproduct-V2-PK1.gif"
plot "Ampoule (2-1-16) NO2-Ph-N2-Ts-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 7 ti " V0", \
 "Ampoule (4-9-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " PK1 v1", \
 "Ampoule (4-12-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " PK1 v2", \
 "Ampoule (4-14-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " PK1 v3", \
 "Ampoule (4-18-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 4 ti " PK1 v4"

set output "Reproduct-All.gif"
plot "Ampoule (2-1-16) NO2-Ph-N2-Ts-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 7 ti " V0", \
 "Ampoule (3-11-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " Src v1", \
 "Ampoule (3-14-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " Src v2", \
 "Ampoule (3-16-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " Src v3", \
 "Ampoule (3-18-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " Src v4", \
 "Ampoule (3-22-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " Src v5", \
 "Ampoule (4-9-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 4 ti " PK1 v1", \
 "Ampoule (4-12-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 4 ti " PK1 v2", \
 "Ampoule (4-14-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 4 ti " PK1 v3", \
 "Ampoule (4-18-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 4 ti " PK1 v4"

set output "Reproduct-All-civ.gif"
plot "Ampoule (2-1-16) NO2-Ph-N2-Ts-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 7 ti " V0", \
 "Ampoule (3-14-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " Src v2", \
 "Ampoule (3-16-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " Src v3", \
 "Ampoule (3-18-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " Src v4", \
 "Ampoule (3-22-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " Src v5", \
 "Ampoule (4-9-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 4 ti " PK1 v1", \
 "Ampoule (4-14-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 4 ti " PK1 v3"

quit

#Ampoule (3-11-16) NO2-Ph-N2-OTs V.dat
#Ampoule (3-14-16) NO2-Ph-N2-OTs V.dat
#Ampoule (3-16-16) NO2-Ph-N2-OTs V.dat
#Ampoule (3-18-16) NO2-Ph-N2-OTs V.dat
#Ampoule (3-22-16) NO2-Ph-N2-OTs V.dat

#Ampoule (4-9-16) NO2-Ph-N2-OTs V2 PK1.dat
#Ampoule (4-12-16) NO2-Ph-N2-OTs V2 PK1.dat
#Ampoule (4-14-16) NO2-Ph-N2-OTs V2 PK1.dat
#Ampoule (4-18-16) NO2-Ph-N2-OTs V2 PK1.dat

#Ampoule (2-1-16) NO2-Ph-N2-Ts-85.dat
