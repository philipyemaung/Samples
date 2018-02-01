#!C:/Perl64/bin/perl.exe
#!/usr/bin/perl -w

use strict;
use warnings;
use CGI;
use CGI::Pretty qw/:standard/;
use URI::Escape;
use DBI;

print header(-type => "application/html");
my $driver   = "SQLite";
my $database = "appt.db";
my $dsn = "DBI:$driver:dbname=$database";
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password);

my $rv = $dbh->do("CREATE TABLE APPOINTMENTS(ID ROWID, APPTIME CHAR(50) NOT NULL, DESCRIPTION CHAR(50) NOT NULL)");
$rv = $dbh->do("INSERT INTO APPOINTMENTS (APPTIME,DESCRIPTION) VALUES ('2018-02-01 13:27:00.00', 'Customer Meeting')");
$rv = $dbh->do("INSERT INTO APPOINTMENTS (APPTIME,DESCRIPTION) VALUES ('2018-02-07 10:27:00.00', 'DevTeam Meeting')");
$rv = $dbh->do("INSERT INTO APPOINTMENTS (APPTIME,DESCRIPTION) VALUES ('2018-02-10 15:30:00.00', 'Conference Call')");
$rv = $dbh->do("INSERT INTO APPOINTMENTS (APPTIME,DESCRIPTION) VALUES ('2018-02-09 9:30:00.00', 'Recruiter Interview')");
$rv = $dbh->do("INSERT INTO APPOINTMENTS (APPTIME,DESCRIPTION) VALUES ('2018-02-08 10:15:00.00', 'SalesTeam Meeting')");

print "Database is successfully initialzied with sample data.";