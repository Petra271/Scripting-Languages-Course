#!/bin/bash
# 5. zadatak

echo "Naziv kazala: $1"
echo "Uzorak imena datoteka: $2"
if [ $# -ne 2 ]
    then echo "Potrebno navesti direktorij i uzorak imena datoteka."
    exit 1
fi

dir=$1
if ! [ -d $dir ]
    then echo "Zadani direktorij ne postoji."
    exit 1
fi

find $dir -name "$2" | xargs wc -l | grep "total" | sed -r 's/\s+([0-9]*)(.*)/\1/'