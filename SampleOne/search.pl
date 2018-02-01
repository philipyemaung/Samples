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
my $value = uri_unescape $query->param('desc'); 
my @message;
my $driver   = "SQLite";
my $database = "appt.db";
my $dsn = "DBI:$driver:dbname=$database";
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password);
print header(-type => "application/json");
my $sth = $dbh->prepare("SELECT APPTIME, DESCRIPTION from APPOINTMENTS WHERE DESCRIPTION LIKE '%" . $value . "%'");
my $rv = $sth->execute() or die $DBI::errstr;
my $i = 0;
while(my @row = $sth->fetchrow_array()) {
	$message[$i][0] = $row[0];
	$message[$i][1] = $row[1];
	$i++;
}
$dbh->disconnect();
my $json = encode_json \@message;
print $json;