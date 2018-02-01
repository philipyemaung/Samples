#!C:/Perl64/bin/perl.exe
#!/usr/bin/perl -w

use strict;
use warnings;
use CGI;
use CGI::Pretty qw/:standard/;
use URI::Escape;
use DBI;
use JSON;

my $query = CGI->new;
my $desc = uri_unescape $query->param('desc');
my $datetime = uri_unescape $query->param('datetime');
print header(-type => "application/html");
my $driver   = "SQLite";
my $database = "appt.db";
my $dsn = "DBI:$driver:dbname=$database";
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password);

my $rv = $dbh->do("INSERT INTO APPOINTMENTS (APPTIME,DESCRIPTION) VALUES ('" . $datetime . "', '" . $desc . "')");
my $message = $rv < 0 ? "Error occured" : "Successfully added!";
print $message;