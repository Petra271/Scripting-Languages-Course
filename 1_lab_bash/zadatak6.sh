#!/bin/bash
# 6. zadatak

if [ $# -ne 2 ]
    then echo "Potrebno navesti nazive direktorija."
    exit 1
fi

dir1=$1
dir2=$2
[[ "${dir1}" != */ ]] && dir1="${dir1}/"
[[ "${dir2}" != */ ]] && dir2="${dir2}/"
if ! [ -d $dir1 ] || ! [ -d $dir2 ]
    then echo "Zadani direktorij ne postoji."
    exit 1
fi

all="`ls $dir1` `ls $dir2`"
out=""
for file in `echo $all | xargs -n1 | sort -u`
do  
    if test $dir1$file -nt $dir2$file;  then out+="$dir1$file --> $dir2"$'\n'
    elif test $dir2$file -nt $dir1$file; then out+="$dir2$file --> $dir1"$'\n'
    fi
done

echo "$out" | sort -u | grep . | sed 's/.$//'