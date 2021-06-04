#!/usr/bin/perl

$flag = 0;
while (defined($line= <>)) {

    if (not $flag) {
        $_ = $ARGV;
        s/.*(\d{4}-\d{2}-\d{2}).*/\1/;
        print "Datum: " . $_. "\n";
        print "sat : broj pristupa" . "\n-------------------------------\n";
        $flag = 1;
    }

    chomp($_ = $line);
    s/.*[0-9]{4}:([0-9]{2}):.*/\1/;
    ++$map{$_};

    if (eof) { 
        for my $key (sort keys %map) {
            print "$key : $map{$key}\n";
        }
        print "\n";
        %map = ();
        $flag = 0;
    }

}