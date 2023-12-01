#!/usr/bin/env perl

use strict;
use warnings;

my $in = "in";
open my $fh, "<", "$in" or die;

# Need to extract first and last digits, and put them together
# Then sum those all together.
my $sum = 0;
while (my $line = <$fh>) {
  my ($first, $last);
  chomp $line;

  ($first) = ($line =~ m/^[A-Za-z]*(\d)/);
  ($last)  = ($line =~ m/(\d)[A-Za-z]*$/);

  my $num = $first*10 + $last;
  $sum += $num;

  printf("%-60s [%d] [%d] [%02d] %d\n", $line, $first, $last, $num, $sum);
}

close $fh;

print "$sum\n";
