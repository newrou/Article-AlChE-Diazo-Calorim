set ylabel "Heat flow (P), mW/g" font "Helvetica-Bold,26"
set xlabel "T, ^oC" font "Helvetica-Bold,26"

set terminal svg size 1200,900 font "Helvetica,26"
set datafile separator ";"

set linestyle 1 lt 1 lw 3 lc rgb "red" dashtype 1
set linestyle 2 lt 2 lw 3 lc rgb "blue" dashtype 1
set linestyle 3 lt 3 lw 3 lc rgb "green" dashtype 1

set output "1b.svg"
plot "1b.csv" using 2:($4) with lines linestyle 2 ti "Heat flow", \
     "1b.csv" using 2:($5*10) with lines linestyle 1 ti " dT"

quit
