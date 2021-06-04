#!/usr/bin/perl

use open ':locale';
use locale;

$length = @ARGV[1];
(open FILE, '<', @ARGV[0]);

while(<FILE>){
    tr/A-Z/a-z/;
	@list = split(/[\s?!.,;]{1,}/, $_);
	foreach $k (@list ){
		if (length($k) >= $length) {
			$key = substr $k, 0, $length;
			$map{$key}++; 
		}
	}
}

foreach $k (sort keys %map) {
	print "$k : $map{$k}\n";
}