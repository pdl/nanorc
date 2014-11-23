#!/usr/bin/env perl -w

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";

=head1 NAME

perl.pl - example of some perl for nanorc formatting

=cut

use v5.20.0; # vstrings! also we can now use...

our $postfix = [q~deref~];
print $postfix->$@;
print $postfix->$#*;
print @{ $postfix };
print @$postfix;
print $#{ $postfix };
print $#$postfix;

# var $names should not be 'highlighted' in @comments 
# but it's not crucial.

warn qq`but they are in $a qq string`
  . "nor can #comments begin in strings";

die q!No $^W! unless $^W;

{
	package Acme::Misc;#comments can appear after lines
	use Data::Dumper 0.2;
	print Dumper \%-;
	1;
}

sub salami_slice ($) {
	my $recursive;
	$recursive = sub {
		__SUB__->(chop $_[0]);
	}->(&shift);
	... # todo...
}

my $bindir = FindBin::again();

ITEM: foreach my $item (qw{ $these %words @are not interpolated }) {
	local $_ = "$item\n";
	s/[\$\%\@]//g; # these lines do
	y{$%@}    {}d; # the same thing
	tr{$%@}{   };  # this does not

	print qq(\s) for 1..10;
	print qq(\s) x 10;
	print ${^MATCH} if /\x74/p;
}

print 'Escapes like \n are not interpolated in single quotes' =~ tr/\s/ /; # but they are in transliterations

say <<HEREDOC;

it's a 
HEREDOC

