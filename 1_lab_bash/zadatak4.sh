#!/bin/bash
# 4. zadatak

if [ $# -ne 1 ]
    then echo "Potrebno navesti direktorij sa slikama."
    exit 1
fi

dir=$1
if ! [ -d $dir ]
    then echo "Zadani direktorij ne postoji."
    exit 1
fi

files=`ls $dir | grep . | wc -l`
if [ $files -eq 0 ]
    then echo "Zadani direktorij ne sadrži tražene datoteke."
    exit 1
fi

month=0
for pic in `ls $dir | grep -E ".jpg$" | sort`
    do
    year=$(echo $pic | cut -b 1-4)
    mon=$(echo $pic | cut -b 5-6)
    if [ `echo $mon | sed 's/^0*//'` = $month ]
        then
        num=$((num+1))
        echo "    $num. $pic"
    else
        if [ $month != "0" ]; then echo "--- Ukupno: $num slika -----"; fi; echo;
        num=1
        if [ $month = "12" ]; then month=0; fi 
        echo "$mon-$year  :"
        echo ----------
        echo "    $num. $pic"
        month=$(($month+1))     
    fi 
done
echo "--- Ukupno: $num slika -----";