#!/usr/bin/perl

while (defined($line= <>)) {
    @lista = split(";", $line);
    @termin = split(" ", @lista[3]);
    @zakljucano = split(" ", @lista[4]);

    $termin_vrijeme = (split(":", @termin[1]))[0];
    $zakljucano_vrijeme = (split(":", @zakljucano[1]))[0];

    if (@termin[0] ne @zakljucano[0] or $termin_vrijeme < $zakljucano_vrijeme) {
        printf "%s %s %s - PROBLEM: %s %s --> %s %s\n", @lista[0..2],
        @termin[0..1], @zakljucano[0..1];
    }
}