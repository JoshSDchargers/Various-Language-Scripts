package functs_aguirre;
use strict;
use warnings;


sub generates{
	my @array= shift;
	print"List of User\n";
	print "---------------\n";
	print"@array";
	#print"$array[2]";
}1;


sub remove{
    my @array = shift;
	my @username = shift;
	my @passwordcollect = shift;
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
	print "@array";
}1;

	}
	if($varb eq 0){
print "user does not exist";
}
return @array, @username, @passwordcollect;
}
