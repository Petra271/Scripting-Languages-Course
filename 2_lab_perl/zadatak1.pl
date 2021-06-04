#!/usr/bin/perl

print "Unesite znakovni niz > ";
$niz = <STDIN>;
print "Unesite broj ponavljanja > ";
chomp($n = <STDIN>);
print $niz x $n
