use warnings;
use Tk;
use Tk::DialogBox;

my $mw = MainWindow->new();
$mw->geometry("300x200");
$mw->title("MERIT LIST GENERATOR");


print"enter name\n";
$p1= <>;
print"enter cet score\n";
$p2= <>;
print"enter physics score\n";
$p3= <>;
print"enter maths score\n";
$p4= <>;
print"enter chemistry score\n";
$p5= <>;
print"enter hsc score\n";
$p6= <>;
print"enter ssc score\n";
$p7= <>;


my $popup =$mw->DialogBox( 
    -title   => "Final Merit List", 
    -buttons => ["close"] 
);

$mw->Button( 
    -text    => "Final Merit List",
    -command => \&pop)->pack();

my $tx = $popup->Text(qw/-width 40 -height 14/)->pack();
tie *STDOUT, 'Tk::Text', $tx;

@name=( "Rihanna", "Ariana", "Linda", "Ancilla", "Selena", "Madonna", "Pallavi", "Roni", "Anchal", "Sanjana", $p1);
@tot_cet=(145, 123, 176, 143, 170, 193, 176, 173, 101, 145, $p2+0);
@mrks_phy=(34, 25, 44, 41, 34, 49, 44, 46, 29, 37, $p3+0);
@mrks_maths=(96, 74, 61, 75, 54, 92, 63, 57, 84, 68, $p4+0);
@mrks_chem=(43, 50, 28, 45, 37, 37, 48, 36, 49, 36, $p5+0);
@per_hsc=(97, 64, 68, 85, 94, 65, 77, 81, 62, 85, $p6+0);
@per_ssc=(92, 83, 76, 62, 84, 69, 84, 62, 81, 81, $p7+0);
$m=@name;
print "The merit list of the given $m students:\n";
while($m!=0)
{
use List::Util qw( min max );
$max=max @tot_cet;
$index=0;
for(@tot_cet)
{
    if ($_ eq $max)
    {
        last;
    }
    else
    {
        $index++;
    }
}
$found=0;
@indx = (-1)x($m);
for($i=0;$i<$index-1;$i++)
{
if(defined($tot_cet[$i])==$max)
{

 $found=$found+1;
 $indx[$i]=1;
}
}
for($i=$m;$i>$index+1;$i--)
{
if(defined($tot_cet[$i])==$max)
{
 $found=$found+1;
 $indx[$i]=1;
}
}
if ($found==0)
{
print "$name[$index]    $tot_cet[$index]\n";
splice(@tot_cet,$index,1);
splice(@mrks_phy,$index,1);
splice(@mrks_maths,$index,1);
splice(@mrks_chem,$index,1);
splice(@per_hsc,$index,1);
splice(@per_ssc,$index,1);
splice(@name,$index,1);
$m=$m-1;
}
else
{
for($i=0;$i<=9;$i++)
{
$rank=$i;
if($indx[$i]==1)
{
if($mrks_phy[$i]!=$mrks_phy[$index] )
{
    if($mrks_phy[$i]<$mrks_phy[$index])
    {
     $rank=$index;
    }
}
elsif ($mrks_maths[$i]!=$mrks_maths[$index])
{
    if($mrks_maths[$i]<$mrks_maths[$index])
    {
    $rank=$index;
    }
}
elsif ($per_hsc[$i]!=$per_hsc[$index])
{
    if($per_hsc[$i]<$per_hsc[$index])
    {
     $rank=$index;
    }
}
else
{
if($per_ssc[$i]!=$per_ssc[$index])
{
     if($per_ssc[$i]<$per_ssc[$index])
     {
     $rank=$index;
     }
}
}
if($rank!=$i)
{

print "$name[my $rank]   $tot_cet[$rank]\n";
print "$name[my $i]      $tot_cet[$i]\n";
splice(@tot_cet,$i,1);
splice(@mrks_phy,$i,1);
splice(@mrks_maths,$i,1);
splice(@mrks_chem,$i,1);
splice(@per_hsc,$i,1);
splice(@per_ssc,$i,1);
splice(@name,$i,1);
splice(@tot_cet,$rank,1);
splice(@mrks_phy,$rank,1);
splice(@mrks_maths,$rank,1);
splice(@mrks_chem,$rank,1);
splice(@per_hsc,$rank,1);
splice(@per_ssc,$rank,1);
splice(@name,$rank,1);
$m=$m-2;
}
else
{ 
if($rank==$i )
{

print "$name[$rank]   $tot_cet[$rank]\n";
print "$name[$index]  $tot_cet[$index]\n";
splice(@tot_cet,$rank,1);
splice(@mrks_phy,$rank,1);
splice(@mrks_maths,$rank,1);
splice(@mrks_chem,$rank,1);
splice(@per_hsc,$rank,1);
splice(@per_ssc,$rank,1);
splice(@name,$rank,1);
splice(@tot_cet,$index,1);
splice(@mrks_phy,$index,1);
splice(@mrks_maths,$index,1);
splice(@mrks_chem,$index,1);
splice(@per_hsc,$index,1);
splice(@per_ssc,$index,1);
splice(@name,$index,1);
$m=$m-2;
}
}

}
}
}
}

$mw->Button(-text => "Close", -command =>sub{exit})->pack(); 


MainLoop;
sub pop
{
my $finished;

 while (!$finished) {    
        my $whichbutton = $popup->Show; 
        if ($whichbutton eq "close") {

            # do something
            $finished = 1; 

        } 
        else {


}
}}
my $finished=0;
