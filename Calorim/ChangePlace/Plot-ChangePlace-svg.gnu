#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set ylabel "Heat flow (P), mW/g" font "Helvetica-Bold,18"
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

set linestyle 1 lt 1 lw 2 lc -1 dashtype 1
set linestyle 2 lt 2 lw 2 lc -1 dashtype 2
set linestyle 3 lt 3 lw 2 lc -1 dashtype 3
set linestyle 4 lt 4 lw 2 lc -1 dashtype 4
set linestyle 5 lt 5 lw 2 lc -1 dashtype 5
set linestyle 6 lt 6 lw 2 lc -1 dashtype 6
set linestyle 7 lt 7 lw 2 lc -1 dashtype 7
set linestyle 8 lt 8 lw 2 lc -1 dashtype 8


set output "ChangePlace.svg"
set xrange [0:100]
plot "Ampoule (7-1-16) o-NO2-Ph-N2-OTf-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " o", \
 "Ampoule (7-21-16) m-NO2-Ph-N2-OTf-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " m", \
 "Ampoule (2-9-16) NO2-Ph-N2-OTf-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " p"
# "Ampoule (8-15-16) p-NO2-Ph-N2-OTf-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " p"

quit
