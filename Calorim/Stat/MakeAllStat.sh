#!/bin/bash

for i in *.csv; do
 Name=`basename "$i" .csv`
 ./start-R.sh StatKinetic.R $Name
 grep "\[1\]" < $Name.log > $Name.ext
done

echo "<html>" > Stat.html
echo "<body>" >> Stat.html
echo "<table border=1>" >> Stat.html
echo "<tr> <td>Sample</td> <td>k</td> <td>dH</td> <td>P0</td> <td>C0</td> </tr>" >> Stat.html
./Get-Stat.py Stat-Sample1.ext >> Stat.html
./Get-Stat.py Stat-Sample2.ext >> Stat.html
./Get-Stat.py Stat-Sample3.ext >> Stat.html
./Get-Stat.py Stat-Air.ext >> Stat.html
./Get-Stat.py Stat-Argon.ext >> Stat.html
./Get-Stat.py Stat-Nitrogen.ext >> Stat.html
./Get-Stat.py Stat-Source.ext >> Stat.html
./Get-Stat.py Stat-Reprecipitation1.ext >> Stat.html
./Get-Stat.py Stat-Reprecipitation2.ext >> Stat.html
./Get-Stat.py Stat-All.ext >> Stat.html
echo "</table>" >> Stat.html
echo "</body>" >> Stat.html
echo "</html>" >> Stat.html
