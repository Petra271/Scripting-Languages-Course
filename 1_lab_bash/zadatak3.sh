#!/bin/bash
# 3. zadatak

dir=$1
if ! [ -d $dir ]
    then echo "Zadani direktorij ne postoji."
    exit 1
fi

files=$(ls $dir | grep -E "localhost_access_log.[0-9]{4}-02-[0-9]{2}")
if [ `echo $files | grep . | wc -l` -eq 0 ]
    then echo "Zadani direktorij ne sadrži tražene datoteke."
    exit 1
fi

for file in $files
    do
        date1=$(echo $file | cut -d'.' -f2| cut -d'[' -f1)
        date2=$(date -d $date1 +'%Y-%m-%d')
        echo datum: $(date -d $date2 +'%d-%m-%Y')
        echo --------------------------------------------------
        cat $dir$file | cut -d'"' -f2 | sort | uniq -c | sort -r -n | sed -r 's/[[:space:]]+([0-9]*)([[:space:]]+)(.*)/    \1  :  \3/'
        echo 
done