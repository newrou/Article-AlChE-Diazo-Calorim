set terminal postscript eps mono
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set ylabel "Heat flow (P), pW/g" font "Helvetica-Bold,26"
set xlabel "Time, year" font "Helvetica-Bold,26"
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

set xrange [0:96]
set output "eval-p-NO2-Ph-N2-Ax-black.svg"
set style line 1 lt 1 lw 3 pt 6 linecolor rgb "black"
set style line 2 lt 2 lw 3 pt 7 linecolor rgb "black"
set style line 3 lt 3 lw 3 pt 8 linecolor rgb "black"
unset label
set label "{/:Bold 3}" at 7.94,5.0
set label "{/:Bold 2}" at 5.48,32.0
set label "{/:Bold 1c}" at 54.8,4.0
set key samplen -1 spacing 1.3 font ",26" box lw 0
plot "eval-p-NO2-Ph-N2-OTf.csv" using (($1)/86400/365.25):(1e12*($2)) with lines linestyle 3 ti "4-NO_2C_6H_4N@_2^+ ^-OTf  {/:Bold 1c}", \
 "eval-p-NO2-Ph-N2-OTs.csv" using (($1)/86400/365.25):(1e12*($2)) with lines linestyle 2 ti "4-NO_2C_6H_4N@_2^+ ^-OTs  {/:Bold 2}", \
 "eval-p-NO2-Ph-N2-BF4.csv" using (($1)/86400/365.25):(1e12*($2)) with lines linestyle 1 ti "4-NO_2C_6H_4N@_2^+ BF@_4^-  {/:Bold 3}"

set xrange [0:164]
set output "eval-omp-NO2-Ph-N2-OTf-black.svg"
unset label
set label "{/:Bold 1a}" at 21.9,2.3
set label "{/:Bold 1b}" at 109.5,1.1
set label "{/:Bold 1c}" at 54.7,3.3
set key samplen -1 spacing 1.3 font ",26" box lw 0
plot  "eval-o-NO2-Ph-N2-OTf.csv" using (($1)/86400/365.25):(1e12*($2)) with lines linestyle 1 ti "2-NO_2C_6H_4N@_2^+ ^-OTf  {/:Bold 1a}", \
 "eval-m-NO2-Ph-N2-OTf.csv" using (($1)/86400/365.25):(1e12*($2)) with lines linestyle 2 ti "3-NO_2C_6H_4N@_2^+ ^-OTf  {/:Bold 1b}", \
 "eval-p-NO2-Ph-N2-OTf.csv" using (($1)/86400/365.25):(1e12*($2)) with lines linestyle 3 ti "4-NO_2C_6H_4N@_2^+ ^-OTf  {/:Bold 1c}"

quit




