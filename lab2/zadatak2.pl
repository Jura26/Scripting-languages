#!/usr/bin/perl
chomp(@lines = <STDIN>);
$counter=0;
$sum=0;
foreach $line (@lines){
    $counter+=1;
    $sum+=$line;
}
$res=$sum/$counter;
print "$res"