#!/usr/bin/perl

use open ':locale';
use locale;

print "Lista po rangu:\n-------------------\n";
$first = 1;
while (defined($line= <>)) {
    chomp($line);
    @list = split(";", $line);
    if (index($line, "#") != -1 or @list == 0) {
        next;
    }

    @list = split(";", $line);
    $sum = 0;
    if ($first){
        @factors = @list;
        $first = 0;
    } 
    
    else {     
        @rez = @list[3..10];
        foreach (0..@factors) {
            $sum += (@rez[$_] * @factors[$_]);
        }

        $map{"@list[1], @list[2] (@list[0])"} = $sum;

        if (eof){ 
            $i = 1;
            for my $key (sort { $map{$b} <=> $map{$a} } keys %map) {
                printf "%3d. %-35s:  %.2f\n",$i,$key,$map{$key};
                ++$i;
            }
            print "\n";
        }
    }
}
