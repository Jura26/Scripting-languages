#!/usr/bin/perl
use open ':locale';
use locale;
use utf8;

$n = $ARGV[-1];
pop @ARGV;

while(<>){
    chomp;
    @words = split / /, $_;
    foreach $word (@words){
        if (length($word) lt $n){
            next;
        }
        if (length($word) gt $n){
            if ($word =~ /(.{$n}).*/){
                $word = $1;
            }
        }
        if (exists $map{lc $word}){
            $map{lc $word} += 1;
        } else {
            $map{lc $word} = 1;
        }
    }
}
@sorted = sort keys %map;

foreach $k (@sorted){
    print "\n$k : $map{$k}";
}
print "\n";