#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set ylabel "-ln(k)" font "Helvetica-Bold,26"
set xlabel "1/T" font "Helvetica-Bold,26"
set bars small
#set xrange [0:50]
#set yrange [-100:0]
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20

set terminal svg size 1200,1200 font "Helvetica,28"
set key autotitle columnhead
set datafile separator ";"

set termoption dash

set linestyle 1 lt 1 lw 3 lc rgb "red" dashtype 1 pt 1
set linestyle 2 lt 2 lw 3 lc rgb "blue" dashtype 1 pt 2
set linestyle 3 lt 3 lw 3 lc rgb "green" dashtype 1 pt 3
set linestyle 4 lt 4 lw 3 lc rgb "orange" dashtype 1 pt 4
set linestyle 5 lt 5 lw 3 lc rgb "brown" dashtype 1 pt 5
#set linestyle 5 lt 5 lw 2 lc -1 dashtype 1
#set linestyle 6 lt 6 lw 2 lc -1 dashtype 1
#set linestyle 7 lt 7 lw 2 lc -1 dashtype 1
#set linestyle 8 lt 8 lw 2 lc -1 dashtype 1

#f1(x) = 16885.65*x-44.4928
#f2(x) = 15844.20*x-41.9588
#f3(x) = 20814.77*x-56.2805
#f4(x) = 22516.99*x-58.4522
#f5(x) = 19217.44*x-50.4957
#f6(x) = 13410.38*x-30.2888

f1(x) = 16885.65*x-39.0251
f2(x) = 15844.20*x-36.1864
f3(x) = 20814.77*x-50.5795
f4(x) = 22516.99*x-52.8025
f5(x) = 19217.44*x-44.7946
f6(x) = 13410.38*x-24.5878

set output "Arrhenius-color-Revision-1.svg"
set xrange [0.00278:0.00288]
set yrange [6:18]
plot "Arrhenius-Revision-1.dat" using 1:2 with points linestyle 1 ti " 4-NO_2C_6H_4N_2^+ BF_4^-  {/:Bold 3}", f1(x) with line linestyle 1, \
 "Arrhenius-Revision-1.dat" using 1:3 with points linestyle 2 ti " 4-NO_2C_6H_4N_2^+  TsO^-  {/:Bold 2}", f2(x) with line linestyle 2, \
 "Arrhenius-Revision-1.dat" using 1:4 with points linestyle 3 ti " 4-NO_2C_6H_4N_2^+  TfO^-  {/:Bold 1c}", f3(x) with line linestyle 3, \
 "Arrhenius-Revision-1.dat" using 1:6 with points linestyle 5 ti " 3-NO_2C_6H_4N_2^+  TfO^-  {/:Bold 1b}", f5(x) with line linestyle 5, \
 "Arrhenius-Revision-1.dat" using 1:7 with points linestyle 6 ti " 2-NO_2C_6H_4N_2^+  TfO^-  {/:Bold 1a}", f6(x) with line linestyle 6, \
 "Arrhenius-Revision-1.dat" using 1:5 with points linestyle 4 ti " 4-CH_3OC_6H_4N_2^+  TfO^-  {/:Bold 1d}", f4(x) with line linestyle 4

set output "Arrhenius-black-Revision-1.svg"
set xrange [0.00278:0.00288]
set yrange [6:18]
set linestyle 1 lt 1 lw 3 lc rgb "black" dashtype 1 pt 1
set linestyle 2 lt 2 lw 3 lc rgb "black" dashtype 1 pt 2
set linestyle 3 lt 3 lw 3 lc rgb "black" dashtype 1 pt 3
set linestyle 4 lt 4 lw 3 lc rgb "black" dashtype 1 pt 4
set linestyle 5 lt 5 lw 3 lc rgb "black" dashtype 1 pt 5
set linestyle 6 lt 6 lw 3 lc rgb "black" dashtype 1 pt 6
#set label "{/:Bold 3}" at 0.00286,9.5
#set label "{/:Bold 2}" at 0.00286,8.5
set label "{/:Bold 3}" at 0.0028,8.45
set label "{/:Bold 2}" at 0.0028,8.0
set label "{/:Bold 1c}" at 0.0028,7.5
set label "{/:Bold 1b}" at 0.0028,9.3
set label "{/:Bold 1a}" at 0.0028,13.2
set label "{/:Bold 1d}" at 0.0028,10.5
set key samplen -1 spacing 1.3 font ",26" box lw 0
plot "Arrhenius-Revision-1.dat" using 1:7 with points linestyle 6 ti " 2-NO_2C_6H_4N@_2^+ TfO^-  {/:Bold 1a}", f6(x) with line linestyle 6, \
 "Arrhenius-Revision-1.dat" using 1:6 with points linestyle 5 ti " 3-NO_2C_6H_4N@_2^+ TfO^-  {/:Bold 1b}", f5(x) with line linestyle 5, \
 "Arrhenius-Revision-1.dat" using 1:4 with points linestyle 3 ti " 4-NO_2C_6H_4N@_2^+ TfO^-  {/:Bold 1c}", f3(x) with line linestyle 3, \
 "Arrhenius-Revision-1.dat" using 1:5 with points linestyle 4 ti " 4-CH_3OC_6H_4N@_2^+ TfO^-  {/:Bold 1d}", f4(x) with line linestyle 4, \
 "Arrhenius-Revision-1.dat" using 1:3 with points linestyle 2 ti " 4-NO_2C_6H_4N@_2^+ TsO^-  {/:Bold 2}", f2(x) with line linestyle 2, \
 "Arrhenius-Revision-1.dat" using 1:2 with points linestyle 1 ti " 4-NO_2C_6H_4N@_2^+ BF@_4^-  {/:Bold 3}", f1(x) with line linestyle 1


set nolabel
set output "Arrhenius-black-nokey-Revision-1.svg"
set xrange [0.00278:0.00288]
set yrange [6.5:14.5]
set linestyle 1 lt 1 lw 3.5 lc rgb "black" dashtype 1 pt 1
set linestyle 2 lt 2 lw 3.5 lc rgb "black" dashtype 1 pt 2
set linestyle 3 lt 3 lw 3.5 lc rgb "black" dashtype 1 pt 3
set linestyle 4 lt 4 lw 3.5 lc rgb "black" dashtype 1 pt 4
set linestyle 5 lt 5 lw 3.5 lc rgb "black" dashtype 1 pt 5
set linestyle 6 lt 6 lw 3.5 lc rgb "black" dashtype 1 pt 6
#set label "{/:Bold 3}" at 0.00286,9.5
#set label "{/:Bold 2}" at 0.00286,8.5
set label "{/:Bold 3}" at 0.0028,8.45
set label "{/:Bold 2}" at 0.0028,8.0
set label "{/:Bold 1c}" at 0.0028,7.5
set label "{/:Bold 1b}" at 0.0028,9.3
set label "{/:Bold 1a}" at 0.0028,13.2
set label "{/:Bold 1d}" at 0.0028,10.5
#set key samplen -1 spacing 1.3 font ",26" box lw 0
set nokey
plot "Arrhenius-Revision-1.dat" using 1:7 with points linestyle 6 ti " 2-NO_2C_6H_4N@_2^+ TfO^-  {/:Bold 1a}", f6(x) with line linestyle 6, \
 "Arrhenius-Revision-1.dat" using 1:6 with points linestyle 5 ti " 3-NO_2C_6H_4N@_2^+ TfO^-  {/:Bold 1b}", f5(x) with line linestyle 5, \
 "Arrhenius-Revision-1.dat" using 1:4 with points linestyle 3 ti " 4-NO_2C_6H_4N@_2^+ TfO^-  {/:Bold 1c}", f3(x) with line linestyle 3, \
 "Arrhenius-Revision-1.dat" using 1:5 with points linestyle 4 ti " 4-CH_3OC_6H_4N@_2^+ TfO^-  {/:Bold 1d}", f4(x) with line linestyle 4, \
 "Arrhenius-Revision-1.dat" using 1:3 with points linestyle 2 ti " 4-NO_2C_6H_4N@_2^+ TsO^-  {/:Bold 2}", f2(x) with line linestyle 2, \
 "Arrhenius-Revision-1.dat" using 1:2 with points linestyle 1 ti " 4-NO_2C_6H_4N@_2^+ BF@_4^-  {/:Bold 3}", f1(x) with line linestyle 1


quit
