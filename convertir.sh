#!/bin/bash

TARGETS="cunaguaro Cunaguaro CUNAGUARO guacharo Guacharo GUACHARO"

dir=$( pwd )

for target in ${TARGETS}
do

[ ${target} == "cunaguaro" ] && sustituir="cunaguaro"
[ ${target} == "Cunaguaro" ] && sustituir="Cunaguaro"
[ ${target} == "CUNAGUARO" ] && sustituir="CUNAGUARO"
[ ${target} == "guacharo" ] && sustituir="guacharo"
[ ${target} == "Guacharo" ] && sustituir="Guacharo"
[ ${target} == "GUACHARO" ] && sustituir="GUACHARO"

for file in $( grep -lr ${target} ${dir} )
do

sed -i 's/'${target}'/'${sustituir}'/g' ${file}

done

for i in $( find ${dir} -name "*${target}*" )
do

j=$( echo $i | sed 's/'${target}'/'${sustituir}'/g' )

echo $i" > "$j

mv ${i} ${j}

done

done
