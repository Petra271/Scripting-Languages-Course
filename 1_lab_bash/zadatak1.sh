#!/bin/bash
# 1. zadatak

proba="Ovo je proba"
echo $proba
echo

lista_datoteka=*
echo $lista_datoteka
echo

proba3=$(printf "%0.s$proba. " {1..3})
echo $proba3
echo

a=4; b=3; c=7
d=$((($a+4)*$b%$c))
echo "a=$a, b=$b, c=$c, d=$d"
echo 

broj_rijeci=$(cat *.txt | wc -w)
echo $broj_rijeci
echo

ls ~