#!/usr/bin/perl
use strict;
use warnings;

# primitive tar command
my $file_name = "sample.tar.gz";
my $tar_cmd = sprintf('tar -zcvf %s', $file_name);

# loading the file
my $file = 'list.txt';
open my $fh, '<', $file
  or die qq/Can't open file "$file" : $!/;

# file -> array
my @bkup_list = ();
while (my $line = <$fh>) {
  $line =~ s/(\r\n|\r|\n)$//g;
  push(@bkup_list, $line);
}

# tar command
foreach my $dir (@bkup_list) {
  $tar_cmd = "$tar_cmd $dir";
}

#execution
system($tar_cmd);