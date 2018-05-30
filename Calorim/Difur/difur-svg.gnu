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

set terminal svg size 1200,900 font "Helvetica,18"
set key autotitle columnhead
set datafile separator ","
set termoption dash

set linestyle 1 lt 1 lw 2 lc 0
set linestyle 2 lt 2 lw 2 lc 1
set linestyle 3 lt 3 lw 2 lc 2
set linestyle 4 lt 4 lw 2 lc 3
set linestyle 5 lt 5 lw 2 lc 4
set linestyle 6 lt 6 lw 2 lc 5
set linestyle 7 lt 7 lw 2 lc 6
set linestyle 8 lt 8 lw 2 lc 7

set output "k.svg"
plot "k1.csv" using (($1)/3600):(1000*($2)) with lines linestyle 1, \
 "k2.csv" using (($1)/3600):(1000*($2)) with lines linestyle 2, \
 "k3.csv" using (($1)/3600):(1000*($2)) with lines linestyle 2, \
 "k4.csv" using (($1)/3600):(1000*($2)) with lines linestyle 3

quit
