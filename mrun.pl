#!/bin/perl
##
## @Author : Benjamin Supanga III (2013)
## @Id     : .mrun (-rwxrwxrwx)       
## Autobackup Main Runnable
##   - this should be put on a CRON tabs or File Scheduler
##   - this will call all .run file on sub directories
##     listed from .list
##   - this .run file will have its own way of doing backup to
##     the said directory.
##     ex. /dir/mysql/.run will do a mysqldump then create a table.sql.bu
##   - if no .run file found, this will run default recursive 
##     directory backup
##
#use File::Find;

my $destination = "/backup/2013/";	
&main;
exit;

sub main(){
	my $pwd ="/backup/";

	# MAIN LIST where the root dir scans for runnable .run
	open(MAIN_LIST, "<",  "$pwd/.list") || die "can't open list: $!";
	while(<MAIN_LIST>)  
	{
		chomp($_);
		# comment line are ignored
		next if ($_ =~ /^#/gi);  

		my $dir = "$pwd/".$_;

		print "processing dir: ". $dir . "\n";

		# check if $line is a directory	
		if( -d $dir ){
			if ( -e "$dir/.list" && -e "$dir/.run"){
				print "dir: $dir execute... \n";
				my $exe = "$dir/.run .list";	
				# todo's thread use event io
				&execute($exe, $dir);	
			}	
			else {
				print "backup for dir: $dir started...\n";
				# default backup
				# todo's percent backup 
				&back_up($dir);
			}
		}
    
    	} 
	close(MAIN_LIST);
}

sub back_up(){
	my $dir = $_[0];
	#my $back_up_dir = $destination ."/". $dir;
	my $back_up_dir = $destination;
	if ( !-e $back_up_dir ){
		# todo's remove system call
		`mkdir -p $back_up_dir`;
	}
	
	# todo's remove system call
	`cp -r $dir $back_up_dir`;
	print "done doing backup for dir: $dir $back_up_dir\n";        


}

sub execute(){
	my $exe = $_[0];
	my $dir = $_[1];
	# todo's thread event
	# remove system call

	print "executing $exe \n";

	`perl $exe`;

	print "execute $exe was done! \n";        

	# todo's copy file created by the independent backup file (.run) to the main
	# backup destination

	&back_up($dir);

}
