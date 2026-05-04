#!/usr/bin/perl
print "\nLista po rangu:\n-------------------\n";

while(<>){
    if ($_ !~ /#.*/){
        @factors = split /;/, $_;
        last;
    }
}
while(<>){
    chomp;
    if ($_ !~ /#.*/){
        if ($_ =~ /(\d{10});([^;]+);([^;]+);(.*)/){
            @components = split /;/, $4;
            $total = 0;
            foreach (0..$#components){
                if ($components[$_] ne "-"){
                    $total += $components[$_] * $factors[$_];
                }
            }
            $map{$_} = $total;
        }
    }
}
@sorted = sort { $map{$b} <=> $map{$a} } keys %map;

$counter = 1;
for $k (@sorted) {
    if ($k =~ /(\d{10});([^;]+);([^;]+);(.*)/){
        $left = sprintf("%2d. %s, %s (%s)", $counter, $2, $3, $1);
        printf("%-35s : %6.2f\n", $left, $map{$k});
        $counter += 1;
    }
}