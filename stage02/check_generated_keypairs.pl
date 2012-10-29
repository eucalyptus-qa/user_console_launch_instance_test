#!/usr/bin/perl
use strict;

print "\n";
print "RUN sel_get_dashboard_test.pl\n";
print "\n";

my $dashboard_view = `perl ./sel_get_dashboard_test.pl`;

print "\n";
print "===============================================================================================\n";
print "===============================================================================================\n";
print "===============================================================================================\n";
print "\n";

print $dashboard_view . "\n";
print "\n";

print "\n";
print "===============================================================================================\n";
print "===============================================================================================\n";
print "===============================================================================================\n";
print "\n";

print "\n";
print "\n";
print "\n";

print "DASH BOARD VIEW SUMMARY\n";

print "\n";
print "\n";

my @lines = split("\n", $dashboard_view);

foreach my $line (@lines){
	chomp($line);
	if( $line =~ /^ACCOUNTNAME/ ){
		print "\n";
		print $line . "\n";
	}elsif( $line =~ /^USERNAME/ ){
		print $line . "\n";
	}elsif( $line =~ /^\[DASHBOARD\]/ ){
		print $line . "\n";
		check_dashboard_element_for_generated_keypair($line);
	};	
};



exit(0);

1;


################# SUBROUTINE ########################

sub check_dashboard_element_for_generated_keypair{
	my $line = shift @_;

	if( $line =~ /^\[DASHBOARD\]\s+Keypairs:\s+(\d+)/ ){
		if( $1 != 1 ){
			print "[TEST_RESULT]\tFAILED: TO CREATE KEYPAIR VIA USER CONSOLE !!\n";
		};
	};
	return;
};

1;





