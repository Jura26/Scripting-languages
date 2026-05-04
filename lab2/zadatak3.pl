#!/usr/bin/perl
foreach $path (@ARGV){
    if($path =~ /\.(\d{4}-\d{2}-\d{2})/){
        print "\nDatum: $1 \nsat : broj pristupa\n------------------------------------\n"
    }
    open $fh, '<', $path;
    foreach (0..23){
        $counter[$_]=0;
    }
    while (defined($redak = <$fh>)) {
        chomp($redak);
        if($redak =~ /\[\d{2}\/[A-Za-z]{3}\/\d{4}:(\d{2}):\d{2}:\d{2}/){
            $counter[$1]+=1;
        }
    }
    foreach (0..23){
        printf("%2d : %d\n",  $_, $counter[$_]);
    }
}
