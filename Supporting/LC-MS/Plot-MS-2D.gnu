#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "Integrate MS Spectr"
set ylabel "Ambulanse, abs." font "Helvetica-Bold,22"
#set y2label "Ambulanse, %" font "Helvetica-Bold,22"
set xlabel "M/Z, a.e.m." font "Helvetica-Bold,22"
set bars small
#set xrange [`echo $MZRANGE`]
#set y2range [0:100]
#set y2tics 10
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20
set xtics axis nomirror out scale 0.5
set ytics axis nomirror out scale 0.5

set terminal svg size 1800,900 font "Helvetica,28"
set key autotitle columnhead
set datafile separator "\t"

set termoption dash

set linestyle 1 lt 1 lw 3 lc -1 dashtype 1
set linestyle 2 lt 2 lw 3 lc -1 dashtype 2
set linestyle 3 lt 3 lw 3 lc -1 dashtype 3
set linestyle 4 lt 4 lw 2 lc -1 dashtype 4
set linestyle 5 lt 5 lw 2 lc -1 dashtype 5
set linestyle 6 lt 6 lw 2 lc -1 dashtype 6
set linestyle 7 lt 7 lw 2 lc -1 dashtype 7
set linestyle 8 lt 8 lw 2 lc -1 dashtype 8
set linestyle 9 lt 9 lw 2 lc -1 dashtype 9

set style arrow 1 heads filled size screen 0.008,20,30 ls 1 lw 0.5
set style arrow 2 nohead ls 2 lw 0.8
set style arrow 3 head filled size screen 0.008,20,30 ls 1 lw 0.5



unset key
unset label
unset arrow
#set key outside
set nokey

set output 'APCI_Pos_2-NO2C6H4N2+_OTf-.svg'

set arrow from 394,0 to 394,60 as 2
set label "394" at 414,7 center font "Helvetica,20"
set arrow from 515,0 to 515,60 as 2
set label "515" at 535,55 center font "Helvetica,20"
set arrow from 636,0 to 636,60 as 2
set label "636" at 656,52 center font "Helvetica,20"
set arrow from 757,0 to 757,60 as 2
set label "757" at 776,32 center font "Helvetica,20"
set arrow from 879,0 to 879,60 as 2
set label "879" at 898,33 center font "Helvetica,20"
set arrow from 1000,0 to 1000,60 as 2
set label "1000" at 1019,13 center font "Helvetica,20"

set arrow from 394,42 to 515,42 as 3
set label "+[M]" at 455,44 center font "Helvetica,20"
set arrow from 515,42 to 636,42 as 3
set label "+[M]" at 576,44 center font "Helvetica,20"
set arrow from 636,42 to 757,42 as 3
set label "+[M]" at 697,44 center font "Helvetica,20"
set arrow from 757,42 to 879,42 as 3
set label "+[M]" at 818,44 center font "Helvetica,20"
set arrow from 879,42 to 1000,42 as 3
set label "+[M]" at 939,44 center font "Helvetica,20"

set xrange [200:1400]
set yrange [0:]
plot 'APCI_Pos_2-NO2C6H4N2+_OTf-.dta2d' using 2:($3/1000) with impulses lw 5 lc -1



unset key
unset label
unset arrow
#set key outside
set nokey

set output 'ESI_Neg_2-NO2C6H4N2_TfO-.svg'

set arrow from 380,0 to 380,60 as 2
set label "380" at 360,31 center font "Helvetica,20"
set arrow from 501,0 to 501,60 as 2
set label "501" at 481,19 center font "Helvetica,20"
set arrow from 622,0 to 622,60 as 2
set label "622" at 602,49 center font "Helvetica,20"
set arrow from 743,0 to 743,60 as 2
set label "743" at 723,12 center font "Helvetica,20"
set arrow from 864,0 to 864,60 as 2
set label "864" at 844,9 center font "Helvetica,20"

set arrow from 380,52 to 501,52 as 3
set label "+[M]" at 441,54 center font "Helvetica,20"
set arrow from 501,52 to 622,52 as 3
set label "+[M]" at 562,54 center font "Helvetica,20"
set arrow from 622,52 to 743,52 as 3
set label "+[M]" at 683,54 center font "Helvetica,20"
set arrow from 743,52 to 864,52 as 3
set label "+[M]" at 804,54 center font "Helvetica,20"

set xrange [200:1400]
set yrange [0:60]
plot 'ESI_Neg_2-NO2C6H4N2_TfO-.dta2d' using 2:($3/100) with impulses lw 5 lc -1



unset key
unset label
unset arrow
#set key outside
set nokey

set output 'ESI_Pos_2-NO2C6H4N2+_TfO-.svg'

set arrow from 432,0 to 432,60 as 2
set label "432" at 452,1.2 center font "Helvetica,20"
set arrow from 553,0 to 553,60 as 2
set label "553" at 573,6.3 center font "Helvetica,20"
set arrow from 674,0 to 674,60 as 2
set label "674" at 694,9.2 center font "Helvetica,20"
set arrow from 795,0 to 795,60 as 2
set label "795" at 815,6.9 center font "Helvetica,20"
set arrow from 916,0 to 916,60 as 2
set label "916" at 936,13.1 center font "Helvetica,20"
set arrow from 1037,0 to 1037,60 as 2
set label "1037" at 1057,2.2 center font "Helvetica,20"
set arrow from 1158,0 to 1158,60 as 2
set label "1158" at 1178,0.7 center font "Helvetica,20"

set arrow from 432,14 to 553,14 as 3
set label "+[M]" at 493,14.5 center font "Helvetica,20"
set arrow from 553,14 to 674,14 as 3
set label "+[M]" at 614,14.5 center font "Helvetica,20"
set arrow from 674,14 to 795,14 as 3
set label "+[M]" at 735,14.5 center font "Helvetica,20"
set arrow from 795,14 to 916,14 as 3
set label "+[M]" at 856,14.5 center font "Helvetica,20"
set arrow from 916,14 to 1037,14 as 3
set label "+[M]" at 977,14.5 center font "Helvetica,20"
set arrow from 1037,14 to 1158,14 as 3
set label "+[M]" at 1098,14.5 center font "Helvetica,20"

set xrange [200:1400]
set yrange [0:16]
plot 'ESI_Pos_2-NO2C6H4N2+_TfO-.dta2d' using 2:($3/10000) with impulses lw 5 lc -1



unset key
unset label
unset arrow
#set key outside
set nokey

set output 'ESI_Neg_4-NO2C6H4N2_TfO-.svg'

set label "292.030" at 292.2,8.0 center font "Helvetica,20"
set label "293.033" at 293.2,2.1 center font "Helvetica,20"

set xrange [290:295]
set yrange [0:10]
plot 'ESI_Neg_4-NO2C6H4N2_TfO-.dta2d' using 2:($3/1000) with impulses lw 5 lc -1


quit

