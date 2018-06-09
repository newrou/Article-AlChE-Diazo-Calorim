#!/bin/bash

mkdir -p prop

rm -f prop/*.prop
rm -f prop/*.mo

cd out
list=`ls *.log`
for i in $list
do
 Neg=`grep " Frequencies --" < $i | awk '{printf "%f\n%f\n%f\n", $3, $4, $5}' | grep "\-" | wc -l`
 if [[ $Neg == "0" ]] ; then 

    echo "Extract Gaussian file: "`basename $i .log`
    Name=../td/`basename $i .log`.td
    Prop=../prop/`basename $i .log`.prop
    MO=../prop/`basename $i .log`.mo

 babel -ig09 $i -omol ../mol/`basename $i .log`.mol
 babel -ig09 $i -oxyz 2> /dev/null | php ../Find-C-N-N.php > $Prop
 php ../Extract-Gaussian-LUMO-HOMO.php <$i >> $Prop
 php ../Extract-Gaussian-MO.php <$i >> $MO

# sed -e "s/\./\,/" <$Name >$Name.csv
# mv $Name td
 else
    echo Not optimized [$Name]
    mkdir -p ../cont
    cp $i ../cont
 fi
done

cd ..
#rename 's/B3LYP-aug-cc-pVDZ-//' prop/*.prop
#rename 's/B3LYP-aug-cc-pVDZ-//' prop/*.mo
