#!/bin/bash


#list=`cat Diazo.list`
#for Name in $list
#do
#  echo "$Name";
#  cvs
#done

php ./Print-TD-Prop.php < Diazo.list
php ./csv-2-html.php -t "X-Ar-N2-Y = X-Ar-Y + N2" < Table-td-prop.csv > Table-td-prop.html
libreoffice --headless --writer --convert-to odt Table-td-prop.html
