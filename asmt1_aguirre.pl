#joshuaAguirre

#!/usr/bin/perl
use strict;
use warnings;
use functs_aguirre;

my $count=1;
my $counttwo=1;
my $waiter=1;
my %hash = ();
my $username= ();
my $password=();
my @users=("hello");
my @array=();
my @username=();
my @passwordcollect=();

print "Enter file to open (filename.txt):";

my $filename = <>;
chomp($filename);
open(my $fh, '<', "$filename")
or print "No file found\n\n\n";

while (my $row = <$fh>) {
 push (@array, $row);
}

my @place = @array;
foreach my $p (0 .. $#place){
my @field = split /:/, $place[$p];
push (@username, $field[0]);
push (@passwordcollect, $field[1]);
}


outer_loop:
 while($count == 1){

	inner_loop:
	while($count == 1){
	
		print" User accounts\n";
		print" -------------\n";
		print"i = Insert new user account\n";
		print"m = Modify existing user account\n";
		print"r = Remove existing user account\n";
		print"g = Generate list of account\n";
		print"q = Quit\n\n\n";
		print"Enter an letter to preform an operation:\n";

##################################################################
  my $fun=<>;
  my $test= 'q';
  my $comi='i';
  my $comm='m';
  my $comr='r';
  my $comg='g';
  my $com='q';
  chomp($com);
  chomp($fun);
  chomp($test);
  chomp($comi);
  chomp($comm);
  chomp($comr);
  chomp($comg);
############################################################  


  
  if($fun eq $comi){
	my @tee = insert();
    push (@array, $tee[0]);
	push (@username, $tee[1]);
	push (@passwordcollect, $tee[2]);
    #if($counttwo == 1){
	#my @array=();
	#$counttwo++;
	# }
  }
  
  if($fun eq $comg){
    generate(@array);
	print"\n\n\n\n";
  }
  
  if($fun eq $comm){
    modify(@array,  @username);
	print"\n\n\n\n";
  }
   
   if($fun eq $comr){
    remove(@array,  @username);
	print"\n\n\n\n";
  }
  
    if($fun eq $test){
	print"you exitted!!!";
	closed();
	last outer_loop;
  }
  
  
  }
}

sub insert{
   print "Enter Username:";
   my $usernames=<>;
   $usernames =~ s/[^a-zA-Z0-9]//g;
   $usernames = lc($usernames);
   
    for(my $i = 0; $i < @username; $i++){
    
    if($usernames eq $username[$i]){
	    print "\n\nUser already exists!!!!\n\n";
        last inner_loop;
    }
    }
    print "Enter Password:";
    my $password=<>;
    $password=~ s/\'//g;
    my $nextuser="$usernames:$password";
	my @users ="$nextuser";
	my @usernames="$usernames";
	my @passwordcollect = "$password";
   return @users , @usernames, @passwordcollect;
}

sub generate{
	#my @arry= shift;
	print"List of User\n";
	print "---------------\n";
	print"@array";
	#print"$array[2]";
}

sub remove{
	print"Enter Username to remove:"; #DONE
	my $mod=<>; my $varb = 0;
	$mod =~ s/[^a-zA-Z0-9]//g;
	for(my $i = 0; $i < @username; $i++){
	my $checkuser = $username[$i];
 if ($checkuser eq $mod){
	splice(@array, $i, 1);
	splice(@username, $i, 1);
	splice(@passwordcollect, $i, 1);
    $varb++;
}

	}
	if($varb eq 0){
print "user does not exist";
}
}

sub modify{
 print"Enter Username to modify:";
 my $mod=<>;
  my $here = 10;
  my $usercount= 10;
 $mod =~ s/[^a-zA-Z0-9]//g;
 for(my $i = 0; $i < @username; $i++){
 my $checkuser = $username[$i];
 
 if ($checkuser eq $mod){
 print"Enter your current password:";
 my $seed = <>;
 $usercount=50;
 $here=20;

 ##################################################
 if($seed eq $passwordcollect[$i]){
 print"Enter an new password:";
 my $newpassword= <>;
 $newpassword=~ s/\'//g;
 my $newuser = "$checkuser:$newpassword";
 $array[$i]= $newuser;
 $passwordcollect[$i]= $newpassword;
 $here= 50;
 $usercount=100;
 
 }
 } 
}

if($usercount == 10){
print "user does not exist!!!";
}

if($here == 20){
print "incorrect password, try again!!!";
} 
}


sub closed{
print "Save contents? (y/n):";
my $save = <>;
chomp($save);

if($save eq "y"){
open ($fh, ">", "result.txt");
foreach (@array){
print $fh "$_";
}
    close $fh;
}

}




