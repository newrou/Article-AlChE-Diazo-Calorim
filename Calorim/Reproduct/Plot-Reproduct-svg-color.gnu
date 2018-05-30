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

set terminal svg size 1200,900 font "Helvetica,18"
set key autotitle columnhead
set datafile separator ","

set termoption dash

set linestyle 1 lt 1 lw 2 lc 1 dashtype 1
set linestyle 2 lt 2 lw 2 lc 2 dashtype 1
set linestyle 3 lt 3 lw 2 lc 3 dashtype 1
set linestyle 4 lt 4 lw 2 lc 4 dashtype 1
set linestyle 5 lt 5 lw 2 lc 5 dashtype 1
set linestyle 6 lt 6 lw 2 lc 6 dashtype 1
set linestyle 7 lt 7 lw 2 lc 7 dashtype 1
set linestyle 8 lt 8 lw 2 lc 8 dashtype 1

set output "Reproduct-V1-src-color.svg"
plot "Ampoule (2-1-16) NO2-Ph-N2-Ts-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " V0", \
 "Ampoule (3-11-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " Src v1", \
 "Ampoule (3-14-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " Src v2", \
 "Ampoule (3-16-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 4 ti " Src v3", \
 "Ampoule (3-18-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 5 ti " Src v4", \
 "Ampoule (3-22-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 7 ti " Src v5"

set output "Reproduct-V2-PK1-color.svg"
plot "Ampoule (2-1-16) NO2-Ph-N2-Ts-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " V0", \
 "Ampoule (4-9-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " PK1 v1", \
 "Ampoule (4-12-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " PK1 v2", \
 "Ampoule (4-14-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 4 ti " PK1 v3", \
 "Ampoule (4-18-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 5 ti " PK1 v4"

set output "Reproduct-All-color.svg"
plot "Ampoule (2-1-16) NO2-Ph-N2-Ts-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " V0", \
 "Ampoule (3-11-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " Src v1", \
 "Ampoule (3-14-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " Src v2", \
 "Ampoule (3-16-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " Src v3", \
 "Ampoule (3-18-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " Src v4", \
 "Ampoule (3-22-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " Src v5", \
 "Ampoule (4-9-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " PK1 v1", \
 "Ampoule (4-12-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " PK1 v2", \
 "Ampoule (4-14-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " PK1 v3", \
 "Ampoule (4-18-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " PK1 v4"

set output "Reproduct-All-civ-color.svg"
plot "Ampoule (2-1-16) NO2-Ph-N2-Ts-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " V0", \
 "Ampoule (3-14-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " Src v2", \
 "Ampoule (3-16-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " Src v3", \
 "Ampoule (3-18-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " Src v4", \
 "Ampoule (3-22-16) NO2-Ph-N2-OTs V.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " Src v5", \
 "Ampoule (4-9-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " PK1 v1", \
 "Ampoule (4-14-16) NO2-Ph-N2-OTs V2 PK1.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " PK1 v3"

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
