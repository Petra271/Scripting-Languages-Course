#!/usr/bin/perl

print "Numbers > ";
$input = <STDIN>;
@numbers = split(' ', $input);
$sum += $_ for @numbers;
print "Mean: " . $sum / @numbers . "\n"