#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set ylabel "Heat flow, mW/g" font "Helvetica-Bold,18"
set xlabel "Time, h" font "Helvetica-Bold,18"
set bars small
#set xrange [0:200]
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

set output "ChangePlace.gif"
set xrange [0:100]
plot "Ampoule (7-1-16) o-NO2-Ph-N2-OTf-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 7 ti " o", \
 "Ampoule (7-21-16) m-NO2-Ph-N2-OTf-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " m", \
 "Ampoule (8-15-16) p-NO2-Ph-N2-OTf-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " p"

quit

