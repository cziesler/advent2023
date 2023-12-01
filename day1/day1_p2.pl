#!/usr/bin/env perl

use strict;
use warnings;

my $in = "in";
open my $fh, "<", "$in" or die;

# Need to extract first and last digits, and put them together
# Then sum those all together.
my $sum = 0;
while (my $line = <$fh>) {
  my ($first, $last) = ("", "");
  chomp $line;

  my @digits = (
    ["one"   => "1"],
    ["two"   => "2"],
    ["three" => "3"],
    ["four"  => "4"],
    ["five"  => "5"],
    ["six"   => "6"],
    ["seven" => "7"],
    ["eight" => "8"],
    ["nine"  => "9"],
  );

  my $regex = q/\d|one|two|three|four|five|six|seven|eight|nine/;

  ($last)  = ($line =~ m/^.*($regex)/);
  ($first) = ($line =~ m/($regex).*$/);

  foreach my $a (@digits) {
    my ($k, $v) = @{$a};
    $first =~ s/$k/$v/g;
    $last  =~ s/$k/$v/g;
  }

  my $num = $first*10 + $last;
  $sum += $num;

  printf("%-60s [%s] [%s] [%02d] %d\n", $line, $first, $last, $num, $sum);
}

close $fh;

print "$sum\n";
