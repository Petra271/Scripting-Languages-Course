#!/bin/bash
# 2. zadatak

list='banana|jabuka|jagoda|dinja|lubenica'
grep -i -E $list namirnice.txt
echo

grep -i -E -v $list namirnice.txt
echo

grep -r -E "[A-Z]{3}[0-9]{6}\b" ~/projekti/
echo

find -mtime +7 -and -mtime -14 -ls
echo

for i in {1..15}; do echo -n "$i ";done
echo
for i in $(seq 15); do echo -n "$i ";done
echo
kraj=15
for i in `eval echo {1..$kraj}`; do echo -n "$i ";done
echo
for i in $(seq $kraj); do echo -n "$i ";done
echo