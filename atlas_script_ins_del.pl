#!/usr/bin/perl
use strict; use warnings;

####################################
#                                          #
# Rajanikanth Govindarajulu                #
# script to read Atlas output VCF          # 
# outputs variant as insertion or deletion #
# based on the length of string            #
# Nov 2015                                 #
####################################


my $file = $ARGV[0] or die "Need to get tab table\n";


open(my $data, '<', $file) or die "could not open tab file '$file' $!\n";

open (my $output, '>', "report.txt") or die "could not open the file $!\n";

while (my $line = <$data>){
    chomp $line;
    my @feilds = split "\t" , $line;
   # my @empty;    
  my $nth = substr($feilds[0], 0,1); # $nth was declared as global in alejandro theni made it local by calling with my
  
 my ($sv) = ($feilds[3], $feilds[4]);
 
  if($nth ne '#'){
                my $fld3 = length($feilds[3]);
                my $fld4 = length($feilds[4]); 
                
                 if ($feilds[4] gt $feilds[3]){
             
                 $sv = "INS"}
                 else{
                 $sv = "DEL"
                  }
   print "$feilds[0]\t$feilds[1]\t$feilds[2]\t$feilds[3]\t$feilds[4]\t$fld3\t$fld4\t$sv\n";
    
  }
   

}

close ($data);
close ($output);
