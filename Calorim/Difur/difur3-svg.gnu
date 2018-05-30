set terminal postscript eps mono
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set ylabel "Heat flow, mW/g" font "Helvetica-Bold,26"
set xlabel "Time, day" font "Helvetica-Bold,26"
set bars small
#set xrange [0:100]
#set yrange [-100:0]
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20

set terminal svg size 1200,900 font "Helvetica,26"
set key autotitle columnhead
set datafile separator ","
set termoption dash

set linestyle 1 lt 1 lw 3 lc 0
set linestyle 2 lt 2 lw 3 lc 1
set linestyle 3 lt 3 lw 3 lc 2
set linestyle 4 lt 4 lw 3 lc 3
set linestyle 5 lt 5 lw 3 lc 4
set linestyle 6 lt 6 lw 3 lc 5
set linestyle 7 lt 7 lw 3 lc 6
set linestyle 8 lt 8 lw 3 lc 7

#set output "k.svg"
#plot "eval-CH3O-Ph-N2-OTf.csv" using (($1)/3600):(1000*($2)) with lines linestyle 1, \
# "eval-NO2-Ph-N2-BF4.csv" using (($1)/3600):(1000*($2)) with lines linestyle 2, \
# "eval-NO2-Ph-N2-OTf.csv" using (($1)/3600):(1000*($2)) with lines linestyle 2, \
# "eval-NO2-Ph-N2-OTs.csv" using (($1)/3600):(1000*($2)) with lines linestyle 3

set output "eval-p-CH3O-Ph-N2-OTf.svg"
plot "eval-p-CH3O-Ph-N2-OTf.csv" using (($1)/86400):(1000*($2)) with lines linestyle 1 ti "4-CH3O-Ph-N2+ -OTf"

set output "eval-p-NO2-Ph-N2-BF4.svg"
plot "eval-p-NO2-Ph-N2-BF4.csv" using (($1)/86400):(1000*($2)) with lines linestyle 1 ti "4-NO2-Ph-N2+ -BF4"

set output "eval-p-NO2-Ph-N2-OTf.svg"
plot "eval-p-NO2-Ph-N2-OTf.csv" using (($1)/86400):(1000*($2)) with lines linestyle 1 ti "4-NO2-Ph-N2+ -OTf"

set output "eval-p-NO2-Ph-N2-OTs.svg"
plot "eval-p-NO2-Ph-N2-OTs.csv" using (($1)/86400):(1000*($2)) with lines linestyle 1 ti "4-NO2-Ph-N2+ -OTs"

set output "eval-m-NO2-Ph-N2-OTf.svg"
plot "eval-m-NO2-Ph-N2-OTf.csv" using (($1)/86400):(1000*($2)) with lines linestyle 1 ti "3-NO2-Ph-N2+ -OTf"

set output "eval-o-NO2-Ph-N2-OTf.svg"
plot "eval-o-NO2-Ph-N2-OTf.csv" using (($1)/86400):(1000*($2)) with lines linestyle 1 ti "2-NO2-Ph-N2+ -OTf"

set xrange [0:35000]
set output "eval-p-NO2-Ph-N2-Ax.svg"
plot  "eval-p-NO2-Ph-N2-BF4.csv" using (($1)/86400):(1000*($2)) with lines linestyle 1 ti "4-NO2-Ph-N2+ -BF4", \
 "eval-p-NO2-Ph-N2-OTs.csv" using (($1)/86400):(1000*($2)) with lines linestyle 2 ti "4-NO2-Ph-N2+ -OTs", \
 "eval-p-NO2-Ph-N2-OTf.csv" using (($1)/86400):(1000*($2)) with lines linestyle 3 ti "4-NO2-Ph-N2+ -OTf"

set xrange [0:60000]
set output "eval-omp-NO2-Ph-N2-OTf.svg"
plot  "eval-o-NO2-Ph-N2-OTf.csv" using (($1)/86400):(1000*($2)) with lines linestyle 1 ti "2-NO2-Ph-N2+ -OTf", \
 "eval-m-NO2-Ph-N2-OTf.csv" using (($1)/86400):(1000*($2)) with lines linestyle 2 ti "3-NO2-Ph-N2+ -OTf", \
 "eval-p-NO2-Ph-N2-OTf.csv" using (($1)/86400):(1000*($2)) with lines linestyle 3 ti "4-NO2-Ph-N2+ -OTf"

set xrange [0:35000]
set output "eval-p-NO2-Ph-N2-Ax-black.svg"
set style line 1 lt 1 lw 3 pt 6 linecolor rgb "black"
set style line 2 lt 2 lw 3 pt 7 linecolor rgb "black"
set style line 3 lt 3 lw 3 pt 8 linecolor rgb "black"
set label "(3)" at 2900,5.0e-9
set label "(2)" at 2000,3.2e-8
set label "(1c)" at 20000,4.0e-9
plot  "eval-p-NO2-Ph-N2-BF4.csv" using (($1)/86400):(1000*($2)) with lines linestyle 1 ti "4-NO_2-Ph-N@_2^+ BF@_4^- (3)", \
 "eval-p-NO2-Ph-N2-OTs.csv" using (($1)/86400):(1000*($2)) with lines linestyle 2 ti "4-NO_2-Ph-N@_2^+ ^-OTs (2)", \
 "eval-p-NO2-Ph-N2-OTf.csv" using (($1)/86400):(1000*($2)) with lines linestyle 3 ti "4-NO_2-Ph-N@_2^+ ^-OTf (1c)"

set xrange [0:60000]
set output "eval-omp-NO2-Ph-N2-OTf-black.svg"
set label "(1a)" at 8000,2.3e-9
set label "(1b)" at 40000,1.1e-9
set label "(1c)" at 20000,3.3e-9
plot  "eval-o-NO2-Ph-N2-OTf.csv" using (($1)/86400):(1000*($2)) with lines linestyle 1 ti "2-NO_2-Ph-N@_2^+ ^-OTf (1a)", \
 "eval-m-NO2-Ph-N2-OTf.csv" using (($1)/86400):(1000*($2)) with lines linestyle 2 ti "3-NO_2-Ph-N@_2^+ ^-OTf (1b)", \
 "eval-p-NO2-Ph-N2-OTf.csv" using (($1)/86400):(1000*($2)) with lines linestyle 3 ti "4-NO_2-Ph-N@_2^+ ^-OTf (1c)"

quit




