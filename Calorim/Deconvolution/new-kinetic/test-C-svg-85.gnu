set terminal postscript eps mono
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "Deconvolution for 85 C" 
set ylabel "n, mol" font "Helvetica-Bold,26"
set xlabel "Time, h" font "Helvetica-Bold,26"
set bars small
#set xrange [0:0.1]
#set yrange [-100:0]
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20

set terminal svg size 1200,900 font "Helvetica,26"
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

set output "test-C-svg-85.svg"
plot "test-deconvolution-85.csv" using (($1)/3600):(1000*($4)) with lines linestyle 4 ti "A1", \
 "test-deconvolution-85.csv" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti "C1", \
 "test-deconvolution-85.csv" using (($1)/3600):(1000*($6)) with lines linestyle 2 ti "C2", \
 "test-deconvolution-85.csv" using (($1)/3600):(1000*($7)) with lines linestyle 1 ti "C3"

quit
