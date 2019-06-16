#set terminal postscript eps
set terminal postscript eps color
#set terminal postscript eps mono
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set ylabel "Heat flow (P), mW/g" font "Helvetica-Bold,26"
set xlabel "Time, h" font "Helvetica-Bold,26"
set bars small
#set xrange [0:100]
#set yrange [-100:0]
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20

set terminal svg size 1200,900 font "Helvetica,26"
set key autotitle columnhead
set datafile separator ","
#set termoption dash

set style line 1 lt 1 lw 3 pt 6 linecolor rgb "red"
set style line 2 lt 2 lw 3 pt 7 linecolor rgb "blue"
set style line 3 lt 3 lw 3 pt 8 linecolor rgb "green"
set style line 4 lt 4 lw 2 pt 9
set style line 5 lt 5 lw 2 pt 10
set style line 6 lt 6 lw 2 pt 11
set style line 7 lt 7 lw 2 pt 12
set style line 8 lt 8 lw 2 pt 13

set output "ChangeAnion-75-color2.svg"
set xrange [0:50]
plot "Ampoule (12-16-15) NO2-Ph-N2-BF4-75.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " 4-NO2-Ph-N2+ -BF4", \
 "Ampoule (12-19-15) NO2-Ph-N2-OTs-75.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " 4-NO2-Ph-N2+ -OTs", \
 "Ampoule (12-22-15) NO2-Ph-N2-OTf-75.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " 4-NO2-Ph-N2+ -OTf"

set output "ChangeAnion-80-color2.svg"
set xrange [0:30]
plot "Ampoule (2-11-16) NO2-Ph-N2-BF4-80.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " 4-NO2-Ph-N2+ -BF4", \
 "Ampoule (2-12-16) NO2-Ph-N2-OTs-80.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " 4-NO2-Ph-N2+ -OTs", \
 "Ampoule (2-13-16) NO2-Ph-N2-OTf-80.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " 4-NO2-Ph-N2+ -OTf"

set output "ChangeAnion-85-black.svg"
set xrange [0:15]
set style line 1 lt 1 lw 3 pt 6 linecolor rgb "black"
set style line 2 lt 2 lw 3 pt 7 linecolor rgb "black"
set style line 3 lt 3 lw 3 pt 8 linecolor rgb "black"
set label "{/:Bold 3}" at 2.2,70
set label "{/:Bold 1c}" at 4.7,100
set label "{/:Bold 2}" at 6.5,60

set key samplen -1 spacing 1.3 font ",26" box lw 0
plot "Ampoule (2-9-16) NO2-Ph-N2-OTf-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " 4-NO_2C_6H_4N@_2^+ TfO^-  {/:Bold 1c}", \
 "Ampoule (2-1-16) NO2-Ph-N2-OTs-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " 4-NO_2C_6H_4N@_2^+ TsO^-  {/:Bold 2}", \
 "Ampoule (1-21-16) NO2-Ph-N2-BF4-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1 ti " 4-NO_2C_6H_4N@_2^+ BF_4^-  {/:Bold 3}"

#set nokey
#set label " 4-NO_2C_6H_4N_2^+ BF_4^- (3)" at 10.5,115 font ",22"
#plot "Ampoule (1-21-16) NO2-Ph-N2-BF4-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 1, \
# "Ampoule (2-1-16) NO2-Ph-N2-OTs-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 2 ti " 4-NO_2C_6H_4N_2^+ TsO^- (2)", \
# "Ampoule (2-9-16) NO2-Ph-N2-OTf-85.dat" using (($1)/3600):(1000*($5)) with lines linestyle 3 ti " 4-NO_2C_6H_4N_2^+ TfO^- (1c)"


quit

