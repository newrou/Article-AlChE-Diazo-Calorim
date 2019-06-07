set terminal postscript eps mono
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
set ylabel "Heat flow" font "Helvetica Bold,30"
set xlabel "Time" font "Helvetica Bold,30"
set bars small
#set xrange [0:100]
#set yrange [-100:0]
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20

set terminal svg size 1200,900 font "Helvetica,26"
set key autotitle columnhead
set datafile separator ","
set termoption dash

set style line 1 lt 1 lw 6 pt 6 linecolor rgb "red"
set style line 2 lt 2 lw 6 pt 7 linecolor rgb "brown"
set style line 3 lt 3 lw 6 pt 8 linecolor rgb "green"

set xrange [0:96]
set output "Cover-Image.svg"
set label "ArN_2^+ BF_4^-" at 7.94,5.0 font "Arial Bold,32" tc rgb "red"
set label "ArN_2^+ TsO^-" at 5.48,32.0 font "Arial Bold,32" tc rgb "brown"
set label "ArN_2^+ TfO^-" at 54.8,4.0 font "Arial Bold,32" tc rgb "green"
set label "Increased Stability" at 55,30 center font "Arial Bold,32" tc rgb "#005500"
set label "Increased Safety" at 35,21 center font "Arial Bold,32" tc rgb "#005500" rotate by -90
set arrow from 30,32 to 80,32 lw 4 lc rgb "#005500"
set arrow from 30,32 to 30,10 lw 4 lc rgb "#005500"
set key samplen -1 spacing 1.3 font ",26" box lw 0
unset key
unset xtics
unset ytics
#unset border
#unset tics
set xzeroaxis lt -1
set yzeroaxis lt -1
plot  "eval-p-NO2-Ph-N2-BF4.csv" using (($1)/86400/365.25):(1e12*($2)) with lines linestyle 1 ti "4-NO2-Ph-N2+ -BF4", \
 "eval-p-NO2-Ph-N2-OTs.csv" using (($1)/86400/365.25):(1e12*($2)) with lines linestyle 2 ti "4-NO2-Ph-N2+ -OTs", \
 "eval-p-NO2-Ph-N2-OTf.csv" using (($1)/86400/365.25):(1e12*($2)) with lines linestyle 3 ti "4-NO2-Ph-N2+ -OTf"

quit




