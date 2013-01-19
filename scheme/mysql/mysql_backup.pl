#/bin/perl
@list = `cat mysql_backup.ls`;
foreach ( @list ){
  my $db = $_;
  chomp($db);
  my $backupName = $db . "-db.sql";
  print "$db" ," ongoing backup...\n";
  `mysqldump -u root -ppassword $db > $backupName`; 
  print "$db done! filename: $backupName \n";
}
