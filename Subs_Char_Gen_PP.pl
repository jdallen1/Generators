#!/usr/bin/perl
use strict;
use warnings;

################################## Command Line Menu###############################
sub Command_Line_Menu{
	my $Answer;
	print "\n\n----------------------------------------\nPick the options you want to generate:\n\n Place / before and after each command\n";
	print "Name\(DH2\)=[1] Home World\(DH2\)=[2] Background\(DH2\)=[3] Role\(DH2\)=[4] Gender=[5] Skin\(DH2\)[6]";
	print "Hair\(DH2\)[7] Eyes\(DH2\)=[8] Quirks\(DH2\)=[9] Attributes\(DH2\)=[10] Appearance\(D&D\)=[11]  Abilities\(D&D\)=[12]\n";
	print "           Talents\(D&D\)=[13]     Mannerisms\(D&D\)=[14]\nInteractive Traits\(D&D\)=[15]";
	print "Ideals\(D&D\)=[16]\n Age\(DH2\)=[17] Body Build\(DH2\)=[18] Wounds\(DH2\)=[19]";
	print "   Character Bonds\(D&D\)=[20]       Flaws and Secrets\(D&D\)=[21]\n      Generate All\(D&D\)=[22]  Exit=[0]\n";
	chomp ($Answer = <STDIN>);
	return $Answer;
}

##################################################Command Line Process #####################################
#sub Command_Line_Process{
#	my $Answer = shift;
#	my $home_
#	if ($Answer =~ /\/0\//) {
#		print "\n\n--------------------Goodbye!--------------------\n\n";
#        exit;
#    }
#	if ($Answer =~ /\/1\// || $Answer =~ /\/22\//) {
#		$home_World = Home_World;
#    }
#}

############################################# Output Tester #######################

#sub Output_Tester{
my $Home_World = Home_World();
#my $Home_World = "Garden World";
my $Background = Background($Home_World);
#my $Background = "Adeptus Administratum";
my $Role = Role($Background);
#my $Gender = "Female";
my $Gender = Gender($Background);
my $Skin = Skin($Home_World);
my $Hair = Hair($Home_World);
my $Eyes = Eyes($Home_World);
my $Quirks = Quirks($Home_World);
my $Appearance = Appearance();
my $Good_Ability = Good_Abilities();
my $Bad_Ability = Bad_Abilities($Good_Ability);
my $Talents = Talents();
my $Mannerisms = Mannerisms();
my $Interactive_Traits = Interactive_Traits();
my $Alignment = Alignment();
my $Ideals = Ideals($Alignment);
my $Bonds = Bonds();
my $Flaws_And_Secrets = Flaws_And_Secrets();
my @Body_Build = Body_Build($Home_World);
my $Body_Build_Description = $Body_Build[0];
my $Body_Build_Dimensions = $Body_Build[1];
my @Age_List = Age($Home_World);
my $Age_Description = $Age_List[0];
my $Age = $Age_List[1];
my @Imp_Measurements = Metric_Imp($Body_Build_Dimensions);
my $Imp_Height = $Imp_Measurements[0];
my $Imp_Weight = $Imp_Measurements[1];
my $Wounds = Wounds($Home_World);
my @Attributes_List = Attributes($Home_World);
push (@Attributes_List , $Wounds);
@Attributes_List = DH2_DnD_Attributes(@Attributes_List,$Good_Ability,$Bad_Ability);
#@Attributes_List = Medium_Attributes(@Attributes_List);
#@Attributes_List = High_Attributes(@Attributes_List);
@Attributes_List = Extreme_Attributes(@Attributes_List);
my $Ballistic_Skill = $Attributes_List[0];
my $Weapon_Skill = $Attributes_List[1];
my $Strength = $Attributes_List[2];
my $Toughness = $Attributes_List[3];
my $Influence = $Attributes_List[9];
my $Intelligence = $Attributes_List[5];
my $Fellowship = $Attributes_List[8];
my $Agility = $Attributes_List[4];
my $Perception = $Attributes_List[7];
my $Willpower = $Attributes_List[6];
if($Attributes_List[10]){$Wounds = $Attributes_List[10];}
my $Name = DH2_Names($Gender);
print "Name: $Name	|Gender :$Gender	|Age: $Age_Description \($Age\)\n";
print "Home World: $Home_World\nBackground: $Background\nRole: $Role\nSkin: $Skin	|Hair: $Hair	|Eyes: $Eyes\n";
print "Body Build: $Body_Build_Description \($Body_Build_Dimensions\)\($Imp_Height/$Imp_Weight\)\nQuirks: $Quirks\nAppearance: $Appearance\nGood Ability: $Good_Ability\nBad Ability: $Bad_Ability\n";
print "Talent: $Talents\nMannerisms: $Mannerisms\nInteractive Traits: $Interactive_Traits\nAlignment: $Alignment\n";
print "Ideals: $Ideals\nBonds: $Bonds\nFlaws And Secrets: $Flaws_And_Secrets\n";
print "\n\nBallistic Skill: $Ballistic_Skill	|Weapon_Skill: $Weapon_Skill\nStrength: $Strength		|Toughness: $Toughness\nAgility: $Agility		";
print "|Intelligence: $Intelligence\nWillpower: $Willpower		|Perception: $Perception\nFellowship: $Fellowship		|Influence: $Influence\nWounds: $Wounds\n";
#}
################################ DH2 Home World Generator #####################

sub Home_World {
	my $Home_World;
	##First Array is the list of Home World options
	my @HomeWorldList = ("Agri-World","Daemon World","Death World","Feral World","Feudal World","Forge World","Frontier World",
		"Garden World","Highborn","Hive World","Penal Colony","Quarantine World","Research Station","Shrine World","Voidborn");
	##Second int array is lined up with the Home World options for the chance of that Home World
	my @HomeWorldChance = ( 10, 13, 18, 24, 30, 40, 46, 51, 56, 71, 74, 77, 80, 90, 100);
    my $randHomeWorld = int(rand(100))+1;
	for(my $i=0; $i<scalar(@HomeWorldChance); $i++){
		if($randHomeWorld <= $HomeWorldChance[$i]){
			$Home_World = $HomeWorldList[$i];
			##//Found the Home World, stop the loop.
			last;
		}
	}
	return $Home_World;
}
################################ DH2 Home World Generator #####################
sub Home_World_Traditional{
	my $Home_World;
	##First Array is the list of Home World options
	my @HomeWorldList = ("Agri-World","Daemon World","Death World","Feral World","Feudal World","Forge World","Frontier World",
		"Garden World","Highborn","Hive World","Penal Colony","Quarantine World","Research Station","Shrine World","Voidborn");
	##Second int array is lined up with the Home World options for the chance of that Home World
	my @HomeWorldChance = ( 10, 3, 5, 6, 6, 10, 6, 5, 5, 15, 3, 3, 3, 10, 10);
    my $randHomeWorld = int(rand(99))+1;
	for(my $i=0; $i<scalar(@HomeWorldChance); $i++){
		if($randHomeWorld <= $HomeWorldChance[$i]){
			$Home_World = $HomeWorldList[$i];
			##//Found the Home World, stop the loop.
			last;
		}
	}
	return $Home_World;
}
######################### DH2 Background Generator#########################
sub Background{
	my $Home_World = shift;
	my $Background;
	unless($Home_World){$Background = "Other";}
	if ($Home_World eq "Agri-World") {
		my @Agri_Background_List = ("Adeptus Mechanicus","Adeptus Ministorum",
		"Imperial Guard","Mutant","Other");
        $Background = @Agri_Background_List[int(rand(@Agri_Background_List))];	
    }elsif($Home_World eq "Daemon World") {
		my @Daemon_Background_List = ("Adeptus Astra Telepathica","Adeptus Ministorum",
		"Exorcised","Outcast","Other");
        $Background = @Daemon_Background_List[int(rand(@Daemon_Background_List))];	
    }elsif($Home_World eq "Death World") {
		my @Death_Background_List = ("Adeptus Arbites","Adeptus Ministorum","Adeptus Mechanicus",
		"Imperial Guard","Other");
        $Background = @Death_Background_List[int(rand(@Death_Background_List))];	
    }elsif($Home_World eq "Feral World") {
		my @Feral_Background_List = ("Adeptus Arbites","Adeptus Astra Telepathica",
		"Imperial Guard", "Outcast","Other");
        $Background = @Feral_Background_List[int(rand(@Feral_Background_List))];	
    }elsif($Home_World eq "Feudal World") {
		my @Feudal_Background_List = ("Adepta Sororitas","Adeptus Administratum",
		"Adeptus Ministorum","Imperial Guard","Other");
        $Background = @Feudal_Background_List[int(rand(@Feudal_Background_List))];	
    }elsif($Home_World eq "Forge World") {
		my @Forge_Background_List = ("Adeptus Administratum","Adeptus Arbites",
		"Adeptus Mechanicus","Imperial Guard","Other");
        $Background = @Forge_Background_List[int(rand(@Forge_Background_List))];	
    }elsif($Home_World eq "Frontier World") {
		my @Frontier_Background_List = ("Adeptus Arbites","Adeptus Astra Telepathica",
		"Mutant","Outcast","Other");
        $Background = @Frontier_Background_List[int(rand(@Frontier_Background_List))];	
    }elsif($Home_World eq "Garden World") {
		my @Garden_Background_List = ("Adeptus Administratum","Adeptus Astra Telepathica",
		"Adeptus Ministorum","Rogue Trader Fleet","Other");
        $Background = @Garden_Background_List[int(rand(@Garden_Background_List))];	
    }elsif($Home_World eq "Highborn") {
		my @High_Background_List = ("Adeptus Administratum","Adeptus Arbites","Adeptus Astra Telepathica",
		"Adeptus Ministorum","Other");
        $Background = @High_Background_List[int(rand(@High_Background_List))];	
    }elsif($Home_World eq "Hive World") {
		my @Hive_Background_List = ("Adeptus Arbites","Adeptus Mechanicus",
		"Imperial Guard","Outcast","Other");
        $Background = @Hive_Background_List[int(rand(@Hive_Background_List))];	
    }elsif($Home_World eq "Penal Colony") {
		my @Penal_Background_List = ("Adeptus Administratum","Adeptus Ministorum",
		"Imperial Guard","Outcast","Other");
        $Background = @Penal_Background_List[int(rand(@Penal_Background_List))];	
    }elsif($Home_World eq "Quarantine World") {
		my @Quarantine_Background_List = ("Adeptus Arbites","Adeptus Mechanicus",
		"Imperial Guard","Outcast","Other");
        $Background = @Quarantine_Background_List[int(rand(@Quarantine_Background_List))];	
    }elsif($Home_World eq "Research Station") {
		my @Research_Background_List = ("Adeptus Administratum","Adeptus Astra Telepathica",
		"Adeptus Mechanicus","Mutant","Other");
        $Background = @Research_Background_List[int(rand(@Research_Background_List))];	
    }elsif($Home_World eq "Shrine World") {
		my @Shrine_Background_List = ("Adeptus Administratum","Adeptus Arbites",
		"Adeptus Ministorum","Imperial Guard","Other");
        $Background = @Shrine_Background_List[int(rand(@Shrine_Background_List))];	
    }elsif($Home_World eq "Voidborn") {
		my @Void_Background_List = ("Adeptus Astra Telepathica","Adeptus Mechanicus",
		"Adeptus Ministorum","Outcast","Other");
        $Background = @Void_Background_List[int(rand(@Void_Background_List))];	
    }
	if ($Background eq "Other") {
        my @Background_List = ("Adepta Sororitas","Adeptus Administratum","Adeptus Arbites","Adeptus Astra Telepathica",
		"Adeptus Mechanicus","Adeptus Ministorum","Exorcised","Heretek","Imperial Guard","Imperial Navy","Mutant",
		"Outcast","Rogue Trader Fleet");
        $Background = @Background_List[int(rand(@Background_List))];
    }
    return $Background;
}

######################## DH2 Role Generator ##########################

sub Role{
	my $Background = shift;
	my $Role;
	unless($Background){$Role = "Other";}
	if ($Background eq "Adepta Sororitas") {
		my @Sororitas_Role_List = ("Chirurgeon","Fanatic","Sage","Warrior","Other");
        $Role = @Sororitas_Role_List[int(rand(@Sororitas_Role_List))];	
    }elsif($Background eq "Adeptus Administratum") {
		my @Administratum_Role_List = ("Chirurgeon","Hierophant","Sage","Seeker","Other");
        $Role = @Administratum_Role_List[int(rand(@Administratum_Role_List))];	
    }elsif($Background eq "Adeptus Arbites") {
		my @Arbites_Role_List = ("Assassin","Desperado","Seeker","Warrior","Other");
        $Role = @Arbites_Role_List[int(rand(@Arbites_Role_List))];	
    }elsif($Background eq "Adeptus Astra Telepathica") {
		my @Telepathica_Role_List = ("Chirurgeon","Mystic","Sage","Seeker","Other");
        $Role = @Telepathica_Role_List[int(rand(@Telepathica_Role_List))];	
    }elsif($Background eq "Adeptus Mechanicus") {
		my @Mechanicus_Role_List = ("Chirurgeon","Hierophant","Sage","Seeker","Other");
        $Role = @Mechanicus_Role_List[int(rand(@Mechanicus_Role_List))];	
    }elsif($Background eq "Adeptus Ministorum") {
		my @Ministorum_Role_List = ("Chirurgeon","Hierophant","Seeker","Warrior","Other");
        $Role = @Ministorum_Role_List[int(rand(@Ministorum_Role_List))];	
    }elsif($Background eq "Exorcised") {
		my @Exorcised_Role_List = ("Assassin","Sage","Hierophant","Seeker","Other");
        $Role = @Exorcised_Role_List[int(rand(@Exorcised_Role_List))];	
    }elsif($Background eq "Heretek") {
		my @Heretek_Role_List = ("Chirurgeon","Desperado","Sage","Seeker","Other");
        $Role = @Heretek_Role_List[int(rand(@Heretek_Role_List))];	
    }elsif($Background eq "Imperial Guard") {
		my @Guard_Role_List = ("Assassin","Desperado","Hierophant","Warrior","Other");
        $Role = @Guard_Role_List[int(rand(@Guard_Role_List))];	
    }elsif($Background eq "Imperial Navy") {
		my @Navy_Role_List = ("Ace","Chirurgeon","Hierophant","Warrior","Other");
        $Role = @Navy_Role_List[int(rand(@Navy_Role_List))];	
    }elsif($Background eq "Mutant") {
		my @Mutant_Role_List = ("Assassin","Desperado","Penitent","Warrior","Other");
        $Role = @Mutant_Role_List[int(rand(@Mutant_Role_List))];	
    }elsif($Background eq "Outcast") {
		my @Outcast_Role_List = ("Assassin","Desperado","Seeker","Other");
        $Role = @Outcast_Role_List[int(rand(@Outcast_Role_List))];	
    }elsif($Background eq "Rogue Trader Fleet") {
		my @Fleet_Role_List = ("Ace","Desperado","Hierophant","Seeker","Other");
        $Role = @Fleet_Role_List[int(rand(@Fleet_Role_List))];	
    }
	if ($Role eq "Other") {
        my @Role_List = ("Ace","Assassin","Chiurgeon","Crusader","Desperado","Fanatic","Hierophant","Mystic",
			"Penitent","Sage","Seeker","Warrior");
        $Role = @Role_List[int(rand(@Role_List))];
    }
    return $Role;
}

############################## DH2 Gender Generator ####################
sub Gender{
	my $Background = shift;
	my $Gender;
	my $rand = int(rand(2));
	if($rand == 0) {
        $Gender = "Female";
    }else{$Gender = "Male";}
    if($Background) {
		if($Background eq "Adepta Sororitas"){
			$Gender = "Female";
		}
	}
    return $Gender;
}

################################ DH2 Skin Generator ####################
sub Skin{
	my $Home_World = shift;
	my $Skin;
	if($Home_World){ 
		my $Rand_Skin;
		my @Home_World_Appearance_Chance = ([30,50,70,90,100],[0,1,2,3,4]);
		my $Home_World_Appearance_Percent = int(rand(99))+1;
		for(my $i=0; $i<5; $i++){
			if($Home_World_Appearance_Percent <= $Home_World_Appearance_Chance[0][$i]){
				$Rand_Skin = $Home_World_Appearance_Chance[1][$i];
				last;
			}
		}   
		if($Home_World eq"Agri-World"){
			my @Agri_Skin = ("Dark","Tan","Fair","Ruddy","Pallid");
			$Skin = $Agri_Skin[$Rand_Skin];
		}elsif($Home_World eq"Daemon World"){
			my @Daemon_Skin = ("Dark","Tan","Fair","Ruddy","Golden");
			$Skin = $Daemon_Skin[$Rand_Skin];
		}elsif($Home_World eq"Death World"){
			my @Death_Skin = ("Fair","Olive","Pallid","Dark","Tan");
			$Skin = $Death_Skin[$Rand_Skin];
		}elsif($Home_World eq"Feral World"){
			my @Feral_Skin = ("Dark","Tan","Fair","Ruddy","Bronze");
			$Skin = $Feral_Skin[$Rand_Skin];
		}elsif($Home_World eq"Feudal World"){
			my @Feudal_Skin = ("Dark","Tan","Fair","Ruddy","Ochre");
			$Skin = $Feudal_Skin[$Rand_Skin];
		}elsif($Home_World eq"Forge World"){
			my @Forge_Skin = ("Dark","Fair","Tan","Ruddy","Pale");
			$Skin = $Forge_Skin[$Rand_Skin];
		}elsif($Home_World eq"Frontier World"){
			my @Frontier_Skin = ("Dark","Tan","Fair","Ruddy","Olive");
			$Skin = $Frontier_Skin[$Rand_Skin];
		}elsif($Home_World eq"Garden World"){
			my @Garden_Skin = ("Ruddy","Pale","Bronzed","Dark","Tan");
			$Skin = $Garden_Skin[$Rand_Skin];
		}elsif($Home_World eq"Highborn"){
			my @High_Skin = ("Dark","Tan","Fair","Ruddy","Dyed(any)");
			$Skin = $High_Skin[$Rand_Skin];
		}elsif($Home_World eq"Hive World"){
			my @Hive_Skin = ("Dark","Tan","Fair","Ruddy","Stained(any)");
			$Skin = $Hive_Skin[$Rand_Skin];
		}elsif($Home_World eq"Penal Colony"){
			my @Penal_Skin = ("Dark","Tan","Fair","Ruddy","Pale");
			$Skin = $Penal_Skin[$Rand_Skin];
		}elsif($Home_World eq"Quarantine World"){
			my @Quarantine_Skin = ("Dark","Tan","Fair","Ruddy","Chalky");
			$Skin = $Quarantine_Skin[$Rand_Skin];
		}elsif($Home_World eq"Research Station"){
			my @Research_Skin = ("Dark","Pale","Fair","Ruddy","Tan");
			$Skin = $Research_Skin[$Rand_Skin];
		}elsif($Home_World eq"Shrine World"){
			my @Shrine_Skin = ("Dark","Tan","Ruddy","Fair","Freckled");
			$Skin = $Shrine_Skin[$Rand_Skin];
		}elsif($Home_World eq"Voidborn"){
			my @Void_Skin = ("Porcelain","Fair","Bluish","Greyish","Milky");
			$Skin = $Void_Skin[$Rand_Skin];
		}
	}else{
		my @Other_Skin = ("Porcelain","Bluish","Greyish","Milky","Dark","Tan","Fair","Ruddy","Pallid","Freckled",
						  "Pale","Chalky","Stained(any)","Dyed(any)","Golden","Olive","Bronzed","Ochre");
        $Skin = @Other_Skin[int(rand(@Other_Skin))];
	}
	return $Skin;
}
################################# DH2 Hair Generator ########################
sub Hair{
	my $Home_World = shift;
	my $Hair;
	if($Home_World){ 
		my $Rand_Hair;
		my @Home_World_Appearance_Chance = ([30,50,70,90,100],[0,1,2,3,4]);
		my $Home_World_Appearance_Percent = int(rand(99))+1;
		for(my $i=0; $i<5; $i++){
			if($Home_World_Appearance_Percent <= $Home_World_Appearance_Chance[0][$i]){
				$Rand_Hair = $Home_World_Appearance_Chance[1][$i];
				last;
			}
		}   
		if($Home_World eq"Agri-World"){
			my @Agri_Hair = ("Blond","Ginger","Black","Grey","Brown");
			$Hair = $Agri_Hair[$Rand_Hair];
		}elsif($Home_World eq"Daemon World"){
			my @Daemon_Hair = ("Copper","Blond","Black","White","White");
			$Hair = $Daemon_Hair[$Rand_Hair];
		}elsif($Home_World eq"Death World"){
			my @Death_Hair = ("Black","Blond","Brown","Chestnut","Coppery");
			$Hair = $Death_Hair[$Rand_Hair];
		}elsif($Home_World eq"Feral World"){
			my @Feral_Hair = ("Red","Blond","Brown","Black","Grey");
			$Hair = $Feral_Hair[$Rand_Hair];
		}elsif($Home_World eq"Feudal World"){
			my @Feudal_Hair = ("Golden","Brown","Blond","Chestnut","Black");
			$Hair = $Feudal_Hair[$Rand_Hair];
		}elsif($Home_World eq"Forge World"){
			my @Forge_Hair = ("Rust","Blond","Brown","Black","None");
			$Hair = $Forge_Hair[$Rand_Hair];
		}elsif($Home_World eq"Frontier World"){
			my @Frontier_Hair = ("White","Blond","Henna","Black","Khaki");
			$Hair = $Frontier_Hair[$Rand_Hair];
		}elsif($Home_World eq"Garden World"){
			my @Garden_Hair = ("Khaki","Brown","White","Black","Auburn");
			$Hair = $Garden_Hair[$Rand_Hair];
		}elsif($Home_World eq"Highborn"){
			my @High_Hair = ("Dyed(any)","Blond","Brown","Black","Grey");
			$Hair = $High_Hair[$Rand_Hair];
		}elsif($Home_World eq"Hive World"){
			my @Hive_Hair = ("Brown","Mousy","Dyed(any)","Grey","Black");
			$Hair = $Hive_Hair[$Rand_Hair];
		}elsif($Home_World eq"Penal Colony"){
			my @Penal_Hair = ("None","Black","Blond","Brown","Chesnut");
			$Hair = $Penal_Hair[$Rand_Hair];
		}elsif($Home_World eq"Quarantine World"){
			my @Quarantine_Hair = ("White","Khaki","Dark Red","Blond","Black");
			$Hair = $Quarantine_Hair[$Rand_Hair];
		}elsif($Home_World eq"Research Station"){
			my @Research_Hair = ("Grey","Black","Ginger","Brown","Ash-Blond");
			$Hair = $Research_Hair[$Rand_Hair];
		}elsif($Home_World eq"Shrine World"){
			my @Shrine_Hair = ("None","Blond","Brown","Black","Russet");
			$Hair = $Shrine_Hair[$Rand_Hair];
		}elsif($Home_World eq"Voidborn"){
			my @Void_Hair = ("Red","Blond","Copper","Black","Auburn");
			$Hair = $Void_Hair[$Rand_Hair];
		}
	}else{
		my @Other_Hair = ("Grey","None","Red","Blond","Copper","Black","Auburn","Russet","Ginger","Brown","Ash-Blond",
						  "White","Khaki","Dark Red","Chesnut","Mousy","Dyed(any)","Henna","Rust","Golden");
        $Hair = @Other_Hair[int(rand(@Other_Hair))];
	}
	return $Hair;
}
############################### DH2 Eyes Generator ###########################
sub Eyes{
	my $Home_World = shift;
	my $Eyes;
	if($Home_World){ 
		my $Rand_Eyes;
		my @Home_World_Appearance_Chance = ([30,50,70,90,100],[0,1,2,3,4]);
		my $Home_World_Appearance_Percent = int(rand(99))+1;
		for(my $i=0; $i<5; $i++){
			if($Home_World_Appearance_Percent <= $Home_World_Appearance_Chance[0][$i]){
				$Rand_Eyes = $Home_World_Appearance_Chance[1][$i];
				last;
			}
		}   
		if($Home_World eq"Agri-World"){
			my @Agri_Eyes = ("Grey","Blue","Green","Brown","Red");
			$Eyes = $Agri_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Daemon World"){
			my @Daemon_Eyes = ("Purple","Blue","Green","Red","Brown");
			$Eyes = $Daemon_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Death World"){
			my @Death_Eyes = ("Brown","Cobalt","Black","Green","Amber");
			$Eyes = $Death_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Feral World"){
			my @Feral_Eyes = ("Blue","Grey","Brown","Green","Yellow");
			$Eyes = $Feral_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Feudal World"){
			my @Feudal_Eyes = ("Green","Brown","Hazel","Blue","Olive");
			$Eyes = $Feudal_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Forge World"){
			my @Forge_Eyes = ("Brown","Green","Blue","Grey","Lense(any)");
			$Eyes = $Forge_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Frontier World"){
			my @Frontier_Eyes = ("Brown","Grey","Green","Blue","Violet");
			$Eyes = $Frontier_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Garden World"){
			my @Garden_Eyes = ("Olive","Sapphire","Gold","Green","Teal");
			$Eyes = $Garden_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Highborn"){
			my @High_Eyes = ("Blue","Grey","Brown","Green","Lenses(any)");
			$Eyes = $High_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Hive World"){
			my @Hive_Eyes = ("Blue","Grey","Brown","Green","Lenses(any)");
			$Eyes= $Hive_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Penal Colony"){
			my @Penal_Eyes = ("Brown","Green","Dark Blue","Hazel","Black");
			$Eyes = $Penal_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Quarantine World"){
			my @Quarantine_Eyes = ("Sky Blue","Grey","Violet","Sea Green","Yellow");
			$Eyes = $Quarantine_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Research Station"){
			my @Research_Eyes = ("Grey","Red","Hazel","Brown","Blue");
			$Eyes = $Research_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Shrine World"){
			my @Shrine_Eyes = ("Amber","Brown","Grey","Blue","Emerald");
			$Eyes = $Shrine_Eyes[$Rand_Eyes];
		}elsif($Home_World eq"Voidborn"){
			my @Void_Eyes = ("Watery Blue","Grey","Black","Green","Violet");
			$Eyes = $Void_Eyes[$Rand_Eyes];
		}
	}else{
		my @Other_Eyes = ("Amber","Brown","Watery Blue","Grey","Black","Green","Violet","Blue","Emerald","Sea Green","Yellow",
						  "Sky Blue","Dark Blue","Hazel","Lenses(any)","Olive","Sapphire","Gold","Teal","Cobalt","Purple","Red");
        $Eyes = @Other_Eyes[int(rand(@Other_Eyes))];
	}
	return $Eyes;
}

################################## DH2 Quirks Generator ##########################
sub Quirks{
	my $Home_World = shift;
	my $Quirks;
	if($Home_World){
		if($Home_World eq "Agri-World"){
			my @Agri_Quirks = ("Bald Spot",
			"Large Birthmark","Broken Nose","Yellowed Eyes","Crooked Teeth","Thinned Eyebrows",
			"Smokey Odour","Torn Ear","Stooped Posture","Grass-stained Fingernails","Missing Earlobe",
			"Hunched Shoulders","Widely Spaced Eyes","Thin Lips","Burn Scars","Hairy Ears","Roll twice");
			$Quirks = $Agri_Quirks[int(rand(@Agri_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Agri_Quirks[int(rand(scalar(@Agri_Quirks)-1))];
				my $Quirks_Two = $Agri_Quirks[int(rand(scalar(@Agri_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Agri_Quirks[int(rand(scalar(@Agri_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Daemon World"){
			my @Daemon_Quirks = ("Webbed Toes","Extremely Stiff Posture",
			"Elongated Canine Teeth","Stunningly Attractive","Missing Eyebrows","Thick Skin",
			"Hairless","Reddish Sclera","Aquila Branding","Oily Hair","Long Fingers","Vibrant Birthmark",
			"Shifting Scars","Mismatched Eye Colours","Blinks Too Often","Odd Odour","Roll twice");
			$Quirks = $Daemon_Quirks[int(rand(@Daemon_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Daemon_Quirks[int(rand(scalar(@Daemon_Quirks)-1))];
				my $Quirks_Two = $Daemon_Quirks[int(rand(scalar(@Daemon_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Daemon_Quirks[int(rand(scalar(@Daemon_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Death World"){
			my @Death_Quirks = ("Impressive Scars",
			"Pockmarked Skin","Thick Fingernails","Front Teeth Missing","Large Hands","Cracking Joints",
			"Ripped Nostril","Bent Fingertip","Nervous Twitch","Missing Eyebrow","Rough Skin",
			"Hoarse Voice","Acid Burns","Broken Nose","Thick Eyebrows","Swampy Odour","Roll twice");
			$Quirks = $Death_Quirks[int(rand(@Death_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Death_Quirks[int(rand(scalar(@Death_Quirks)-1))];
				my $Quirks_Two = $Death_Quirks[int(rand(scalar(@Death_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Death_Quirks[int(rand(scalar(@Death_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Feral World"){
			my @Feral_Quirks = ("Hairy Knuckles", "Joined Eyebrows","Warpaint","Huge Hands","Filed Teeth", 
			"Beetling Brows","Musky Smell","Hairy","Ripped Ears","Long Fingernails","Tribal Tattooing", 
			"Scarring","Pierced Nose","Cat’s Eyes","Small Head","Thick Jaw","Roll twice");
			$Quirks = $Feral_Quirks[int(rand(@Feral_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Feral_Quirks[int(rand(scalar(@Feral_Quirks)-1))];
				my $Quirks_Two = $Feral_Quirks[int(rand(scalar(@Feral_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Feral_Quirks[int(rand(scalar(@Feral_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Feudal World"){
			my @Feudal_Quirks = ("Wide Nose",
			"Cracked Fingernail","Thinning Hair","Joined Eyebrows","Pierced Nose","Smashed Toe",
			"Faded Family Tattoo","Stubby Fingers","Facial Wart","Missing Tooth","Squinting Eye",
			"Earthy Smell","Punishment Scars","Boney Hands","Chalky Skin","Slightly Crossed Eyes","Roll twice");
			$Quirks = $Feudal_Quirks[int(rand(@Feudal_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Feudal_Quirks[int(rand(scalar(@Feudal_Quirks)-1))];
				my $Quirks_Two = $Feudal_Quirks[int(rand(scalar(@Feudal_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Feudal_Quirks[int(rand(scalar(@Feudal_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Forge World"){
			my @Forge_Quirks = ("Radiation Scar","Large Head",
			"Mechanicum Tattoo","Crooked Nose","Metallic Smell","Small Eyes","Soot-stained Skin",
			"Acid Burns","Missing Eyebrows","Wheezing Speech","Missing One Ear","Smashed Toe",
			"Squinted Eyes","Short Fingers","Wire Grill Over Eyes","Discoloured Fingernail","Roll twice");
			$Quirks = $Forge_Quirks[int(rand(@Forge_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Forge_Quirks[int(rand(scalar(@Forge_Quirks)-1))];
				my $Quirks_Two = $Forge_Quirks[int(rand(scalar(@Forge_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Forge_Quirks[int(rand(scalar(@Forge_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Frontier World"){
			my @Frontier_Quirks = ("Weathered Skin","Hairy Arms","Cauliflower Ear","Long Fingers",
			"Blackened Lips","Branding Scars","Mottled Skin","Large Ears","Twitching Eye","Bulletmarked Skin",
			"Yellowed Teeth","Rope Burns","Bowlegged","Wheezing Cough","Long Eyebrows","Greasy Hair","Roll twice");
			$Quirks = $Frontier_Quirks[int(rand(@Frontier_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Frontier_Quirks[int(rand(scalar(@Frontier_Quirks)-1))];
				my $Quirks_Two = $Frontier_Quirks[int(rand(scalar(@Frontier_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Frontier_Quirks[int(rand(scalar(@Frontier_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Garden World"){
			my @Garden_Quirks = ("Perfect Complexion",
			"Long Nose","Vibrant Tattoo","Extra Toe","Watery Eyes","Streaked Hair",
			"Poorly Removed Tattoo","Wispy Hair","Pierced Cheek","Calloused Feet","No Body Hair","Hidden Piercing",
			"Slightly Pointed Ears","Glistening Teeth","Pleasant Smell","Tiny Feet","Roll twice");
			$Quirks = $Garden_Quirks[int(rand(@Garden_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Garden_Quirks[int(rand(scalar(@Garden_Quirks)-1))];
				my $Quirks_Two = $Garden_Quirks[int(rand(scalar(@Garden_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Garden_Quirks[int(rand(scalar(@Garden_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Highborn"){
			my @High_Quirks = ("Missing Fingertip",
			"Aquiline Nose","Bright White Teeth","Duelling Scar","Pierced Nose","Shiny Hair",
			"Aquila Tattoo","Perfumed Odour","Pox Marks","Devotional Scar","Decorative Electoo",
			"Quivering Fingers","Pierced Ears","Sinister Boil","Sharp Cheekbones","Slouched Gait","Roll twice");
			$Quirks = $High_Quirks[int(rand(@High_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $High_Quirks[int(rand(scalar(@High_Quirks)-1))];
				my $Quirks_Two = $High_Quirks[int(rand(scalar(@High_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $High_Quirks[int(rand(scalar(@High_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Hive World"){
			my @Hive_Quirks = ("Thin Lips",
			"Grimy Skin","Painted Fingernails","Rotten Teeth","Faded Electoo","Pierced Eyebrow",
			"Wire Mesh Along Cheek","Hacking Cough","Tattoo Over One Eye","Bullet Wound Scar",
			"Nervous Tic","Large Mole","Pollution Scars","Hump","Small Hands","Chemical Smell","Roll twice");
			$Quirks = $Hive_Quirks[int(rand(@Hive_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Hive_Quirks[int(rand(scalar(@Hive_Quirks)-1))];
				my $Quirks_Two = $Hive_Quirks[int(rand(scalar(@Hive_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Hive_Quirks[int(rand(scalar(@Hive_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Penal Colony"){
			my @Penal_Quirks = ("Missing Fingertip",
			"Scarred Back","Broken Nose","Missing One Toe","Tattoos (Gang)","Slight Overbite",
			"Torn Ear","Double-Jointed","ID Tattoo (Burnt Off)","Hairy Knuckles","Multiple Piercings",
			"Torn Fingernails","Metal Teeth","Tattoos (Personal)","Shuffling Gait","Nervous Tic","Roll twice");
			$Quirks = $Penal_Quirks[int(rand(@Penal_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Penal_Quirks[int(rand(scalar(@Penal_Quirks)-1))];
				my $Quirks_Two = $Penal_Quirks[int(rand(scalar(@Penal_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Penal_Quirks[int(rand(scalar(@Penal_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Quarantine World"){
			my @Quarantine_Quirks = ("Bony Elbows",
			"Softly Glowing Teeth","Slightly Pointed Ears","Rad Burns","Rubbery Skin","Stained Teeth",
			"Long Neck","Clammy Skin","Odd Lump Under Skin","Sixth Finger (Cut Off)","Pronounced Chin",
			"Prominent Forehead","Warts (Burnt Off)","Glistening Hair","Protruding Ears","Watery Eyes","Roll twice");
			$Quirks = $Quarantine_Quirks[int(rand(@Quarantine_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Quarantine_Quirks[int(rand(scalar(@Quarantine_Quirks)-1))];
				my $Quirks_Two = $Quarantine_Quirks[int(rand(scalar(@Quarantine_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Quarantine_Quirks[int(rand(scalar(@Quarantine_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Research Station"){
			my @Research_Quirks = ("Bulging Eyes",
			"Smashed Fingernail","Scars From Ex-Tattoo","Large Ears","Oddly Shaped Mole","Hacking Cough",
			"Inkstained Fingernails","Radiation Burns","Hunched Posture","Prominent Chin","Unnerving Stare",
			"Missing Toenails","Hairy Knuckles","No Eyelashes","Long Toes","Bloodshot Eyes","Roll twice");
			$Quirks = $Research_Quirks[int(rand(@Research_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Research_Quirks[int(rand(scalar(@Research_Quirks)-1))];
				my $Quirks_Two = $Research_Quirks[int(rand(scalar(@Research_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Research_Quirks[int(rand(scalar(@Research_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Shrine World"){
			my @Shrine_Quirks = ("Heavy Brows","Long Nose",
			"Ministorum Tattoo","Ridged Fingernails","Crooked Teeth","Clefted Chin","Dry Skin",
			"Thick Eyebrows","Ink-stained Fingernails","Shrivelled Ear","Ritual Scars",
			"Third Nipple","Bloodshot Eyes","Mouldy Scent","Winestain Birthmark","Broad Shoulders","Roll twice");
			$Quirks = $Shrine_Quirks[int(rand(@Shrine_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Shrine_Quirks[int(rand(scalar(@Shrine_Quirks)-1))];
				my $Quirks_Two = $Shrine_Quirks[int(rand(scalar(@Shrine_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Shrine_Quirks[int(rand(scalar(@Shrine_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}elsif($Home_World eq"Voidborn"){
			my @Void_Quirks = ("Long Toes","Fine Hair","Long Fingers","Tiny Ears","Spindly Limbs",
			"Yellow Fingernails","Stumpy Teeth","Widely Spaced Eyes","Large Head","Curved Spine","Hairless",
			"Elegant Hands","Slightly Cross-eyed","Webbed Toes","Minor Limp","Mismatched Eyes","Roll twice");
			$Quirks = $Void_Quirks[int(rand(@Void_Quirks))];
			if($Quirks eq "Roll twice"){
				my $Quirks_One = $Void_Quirks[int(rand(scalar(@Void_Quirks)-1))];
				my $Quirks_Two = $Void_Quirks[int(rand(scalar(@Void_Quirks)-1))];
				while($Quirks_One eq $Quirks_Two){$Quirks_Two = $Void_Quirks[int(rand(scalar(@Void_Quirks)-1))];}
				$Quirks = $Quirks_One . ", and " . $Quirks_Two;
			}
		}
	}
	return $Quirks;
}

############################################### DH2 Body Build ############################
sub Body_Build{
	my $Home_World = shift;
	my $Gender = shift;
	my $Body_Build_Description;
	my $Body_Build_Dimensions;
	unless($Gender){
		my $Rand_Gender = int(rand(2));
		if($Rand_Gender == 0) {
		    $Gender = "Female";
		}else{$Gender = "Male";}	
	}
	if($Home_World){ 
		my $Rand_Body_Build;
		my @Home_World_Appearance_Chance = ([20,50,80,90,100],[0,1,2,3,4]);
		my $Home_World_Appearance_Percent = int(rand(99))+1;
		for(my $i=0; $i<5; $i++){
			if($Home_World_Appearance_Percent <= $Home_World_Appearance_Chance[0][$i]){
				$Rand_Body_Build = $Home_World_Appearance_Chance[1][$i];
				last;
			}
		}   
		if($Home_World eq"Agri-World"){
            my @Agri_Body_Build_Description = ("Sprout","Weedy","Oaken","Willowy","Generous");
			$Body_Build_Description = $Agri_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Agri_Body_Build_Dimensions = ("1.60m/50kg","1.65m/45kg","1.70m/65kg","1.80m/55kg","1.65m/70kg");
				$Body_Build_Dimensions = $Agri_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Agri_Body_Build_Dimensions = ("1.70m/85kg","1.75m/75kg","1.80m/95kg","1.90m/80kg","1.65m/105kg");
				$Body_Build_Dimensions = $Agri_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Daemon World"){
            my @Daemon_Body_Build_Description = ("Lesser","Sinuous","Muscular","Gaunt","Corpulent");
			$Body_Build_Description = $Daemon_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Daemon_Body_Build_Dimensions = ("1.60m/50kg","1.65m/45kg","1.70m/65kg","1.80m/55kg","1.55m/70kg");
				$Body_Build_Dimensions = $Daemon_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Daemon_Body_Build_Dimensions = ("1.70m/85kg","1.75m/75kg","1.80m/95kg","1.90m/80kg","1.65m/105kg");
				$Body_Build_Dimensions = $Daemon_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Death World"){
            my @Death_Body_Build_Description = ("Longpole","Tough","Muscle","Dagger","Bastion");
			$Body_Build_Description = $Death_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Death_Body_Build_Dimensions = ("1.75m/55kg","1.55m/60kg","1.70m/65kg","1.50m/50kg","1.85m/75kg");
				$Body_Build_Dimensions = $Death_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Death_Body_Build_Dimensions = ("1.90m/80kg","1.85m/90kg","1.80m/95kg","1.60m/60kg","2.00m/115kg");
				$Body_Build_Dimensions = $Death_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Feral World"){
            my @Feral_Body_Build_Description = ("Rangy","Lean","Muscular","Squat","Strapping");
			$Body_Build_Description = $Feral_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Feral_Body_Build_Dimensions = ("1.80m/60kg","1.65m/55kg","1.70m/70kg","1.55m/70kg","2m/100kg");
				$Body_Build_Dimensions = $Feral_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Feral_Body_Build_Dimensions = ("1.90m/65kg","1.75m/60kg","1.85m/85kg","1.65m/80kg","2.10m/120kg");
				$Body_Build_Dimensions = $Feral_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Feudal World"){
            my @Feudal_Body_Build_Description = ("Measly","Lank","Stalwart","Stout","Hardy");
			$Body_Build_Description = $Feudal_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Feudal_Body_Build_Dimensions = ("1.55m/40kg","1.75m/60kg","1.70m/65kg","1.60m/75kg","1.65m/70kg");
				$Body_Build_Dimensions = $Feudal_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Feudal_Body_Build_Dimensions = ("1.65m/60kg","1.85m/80kg","1.80m/90kg","1.70m/100kg","1.75m/95kg");
				$Body_Build_Dimensions = $Feudal_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Forge World"){
            my @Forge_Body_Build_Description = ("Minimal","Low Nominal","Optimal","High Nominal","Maximal");
			$Body_Build_Description = $Forge_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Forge_Body_Build_Dimensions = ("1.60m/50kg","1.65m/50kg","1.70m/70kg","1.70m/70kg","1.80m/90kg");
				$Body_Build_Dimensions = $Forge_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Forge_Body_Build_Dimensions = ("1.70m/55kg","1.75m/65kg","1.80m/75kg","1.85m/85kg","1.90m/100kg");
				$Body_Build_Dimensions = $Forge_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Frontier World"){
            my @Frontier_Body_Build_Description = ("Meagre","Rangy","Tough","Robust","Marbled");
			$Body_Build_Description = $Frontier_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Frontier_Body_Build_Dimensions = ("1.55m/45kg","1.60m/60kg","1.65m/65kg","1.70m/70kg","1.55m/75kg");
				$Body_Build_Dimensions = $Frontier_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Frontier_Body_Build_Dimensions = ("1.70m/65kg","1.80m/80kg","1.85m/95kg","1.90m/100kg","1.75m/110kg");
				$Body_Build_Dimensions = $Frontier_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Garden World"){
            my @Garden_Body_Build_Description = ("Flowering","Vine","Pastoral","Mountain","Zephyr");
			$Body_Build_Description = $Garden_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Garden_Body_Build_Dimensions = ("1.60m/55kg","1.80m/65kg","1.65m/60kg","1.75m/75kg","1.50m/50kg");
				$Body_Build_Dimensions = $Garden_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Garden_Body_Build_Dimensions = ("1.80m/90kg","1.95m/80kg","1.75m/85kg","2.00m/110kg","1.60m/70kg");
				$Body_Build_Dimensions = $Garden_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Highborn"){
            my @High_Body_Build_Description = ("Slender","Svelte","Fit","Well-built","Powerful");
			$Body_Build_Description = $High_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @High_Body_Build_Dimensions = ("1.65m/60kg","1.75m/65kg","1.65m/60kg","1.80m/80kg","1.70m/90kg");
				$Body_Build_Dimensions = $High_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @High_Body_Build_Dimensions = ("1.75m/65kg","1.85m/70kg","1.75m/70kg","1.90m/90kg","1.80m/100kg");
				$Body_Build_Dimensions = $High_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Hive World"){
            my @Hive_Body_Build_Description = ("Runt","Scrawny","Wiry","Lanky","Brawny");
			$Body_Build_Description = $Hive_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Hive_Body_Build_Dimensions = ("1.55m/40kg","1.60m/50kg","1.65m/55kg","1.70m/60kg","1.65/75kg");
				$Body_Build_Dimensions = $Hive_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Hive_Body_Build_Dimensions = ("1.60m/45kg","1.70m/55kg","1.75m/65kg","1.80m/65kg","1.75m/80kg");
				$Body_Build_Dimensions = $Hive_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Penal Colony"){
            my @Penal_Body_Build_Description = ("Chain","Stiletto","Hammer","Boulder","Stubber");
			$Body_Build_Description = $Penal_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Penal_Body_Build_Dimensions = ("1.55m/40kg","1.75m/60kg","1.70m/65kg","1.60m/75kg","1.65m/70kg");
				$Body_Build_Dimensions = $Penal_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Penal_Body_Build_Dimensions = ("1.65m/60kg","1.85m/80kg","1.80m/90kg","1.70m/100kg","1.75m/95kg");
				$Body_Build_Dimensions = $Penal_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Quarantine World"){
            my @Quarantine_Body_Build_Description = ("Spiked","Acute","Shrunken","Prolonged","Stable");
			$Body_Build_Description = $Quarantine_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Quarantine_Body_Build_Dimensions = ("1.55m/45kg","1.60m/50kg","1.65m/55kg","1.70m/70kg","1.55m/65kg");
				$Body_Build_Dimensions = $Quarantine_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Quarantine_Body_Build_Dimensions = ("1.70m/65kg","1.80m/80kg","1.85m/70kg","1.90m/100kg","1.75m/110kg");
				$Body_Build_Dimensions = $Quarantine_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Research Station"){
            my @Research_Body_Build_Description = ("Pulse","Spike","Sigma","Attenuated","Saturated");
			$Body_Build_Description = $Research_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Research_Body_Build_Dimensions = ("1.50m/55kg","1.75m/65kg","1.70m/70kg","1.80m/60kg","1.85m/75kg");
				$Body_Build_Dimensions = $Research_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Research_Body_Build_Dimensions = ("1.55m/60kg","1.90m/75kg","1.80m/95kg","1.95m/70kg","2.00m/120kg");
				$Body_Build_Dimensions = $Research_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Shrine World"){
            my @Shrine_Body_Build_Description = ("Diminished","Lessened","Faithful","Commended","Abundant");
			$Body_Build_Description = $Shrine_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Shrine_Body_Build_Dimensions = ("1.55m/40kg","1.60m/50kg","1.65m/55kg","1.80m/70kg","1.55m/75kg");
				$Body_Build_Dimensions = $Shrine_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Shrine_Body_Build_Dimensions = ("1.60m/45kg","1.70m/55kg","1.75m/60kg","1.90m/95kg","1.65m/85kg");
				$Body_Build_Dimensions = $Shrine_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}elsif($Home_World eq"Voidborn"){
            my @Void_Body_Build_Description = ("Skeletal","Stunted","Gaunt","Gangling","Spindly");
			$Body_Build_Description = $Void_Body_Build_Description[$Rand_Body_Build];
			if ($Gender eq "Female") {
                my @Void_Body_Build_Dimensions = ("1.70m/50kg","1.55m/45kg","1.75m/60kg","1.85m/70kg","1.95m/70kg");
				$Body_Build_Dimensions = $Void_Body_Build_Dimensions[$Rand_Body_Build];
            }else{
                my @Void_Body_Build_Dimensions = ("1.75m/55kg","1.65m/55kg","1.80m/60kg","2.00m/80kg","2.10m/75kg");
				$Body_Build_Dimensions = $Void_Body_Build_Dimensions[$Rand_Body_Build];
			}
		}
	}else{
		my @Other_Hair = ("Grey","None","Red","Blond","Copper","Black","Auburn","Russet","Ginger","Brown","Ash-Blond",
						  "White","Khaki","Dark Red","Chesnut","Mousy","Dyed(any)","Henna","Rust","Golden");
        $Hair = @Other_Hair[int(rand(@Other_Hair))];
	}
	my @Body_Build = ($Body_Build_Description,$Body_Build_Dimensions);
	return @Body_Build;
}
############################################### DH2 Age ############################
sub Age{
	my $Home_World = shift;
	my $Age_Description;
	my $Age = 0;
	
	if ($Home_World eq "Agri-World") {
		my @Agri_Age = ("Seedling(15+1d10)","Seedling(15+1d10)","Ripe(25+1d10)","Ripe(25+1d10)",
		"Ripe(25+1d10)","Ripe(25+1d10)","Ripe(25+1d10)","Ripe(25+1d10)","Deep-rooted(40+1d10)","Deep-rooted(40+1d10)");
        $Age_Description = @Agri_Age[int(rand(@Agri_Age))];	
    }elsif($Home_World eq "Daemon World") {
		my @Daemon_Age = ("Runner(16+1d10)","Runner(16+1d10)","Rock(24+1d10)","Rock(24+1d10)",
	"Rock(24+1d10)","Rock(24+1d10)","Rock(24+1d10)","Rock(24+1d10)","Saint(32+1d10)","Saint(32+1d10)");
        $Age_Description = @Daemon_Age[int(rand(@Daemon_Age))];	
    }elsif($Home_World eq "Death World") {
		my @Death_Age = ("Green(15+1d10)","Green(15+1d10)","Green(15+1d10)","Green(15+1d10)","Lucky(20+1d10)",
	"Lucky(20+1d10)","Lucky(20+1d10)","Lucky(20+1d10)","Immortal(30+1d10)","Immortal(30+1d10)");
        $Age_Description = @Death_Age[int(rand(@Death_Age))];	
    }elsif($Home_World eq "Feral World") {
		my @Feral_Age = ("Warrior(15+1d10)","Warrior(15+1d10)","Warrior(15+1d10)","Warrior(15+1d10)","Warrior(15+1d10)",
	"Warrior(15+1d10)","Warrior(15+1d10)","Old One(25+1d10)","Old One(25+1d10)","Old One(25+1d10)");
        $Age_Description = @Feral_Age[int(rand(@Feral_Age))];	
    }elsif($Home_World eq "Feudal World") {
		my @Feudal_Age = ("Childe(20+1d10)","Childe(20+1d10)","Of Age(30+1d10)","Of Age(30+1d10)",
	"Of Age(30+1d10)","Of Age(30+1d10)","Of Age(30+1d10)","Hoary(45+1d10)","Hoary(45+1d10)","Hoary(45+1d10)");
        $Age_Description = @Feudal_Age[int(rand(@Feudal_Age))];	
    }elsif($Home_World eq "Forge World") {
		my @Forge_Age = ("Young(15+1d10)","Young(15+1d10)","Mature(25+1d10)","Mature(25+1d10)",
	"Mature(25+1d10)","Mature(25+1d10)","Mature(25+1d10)","Mature(25+1d10)","Venerated(45+1d10)","Venerated(45+1d10)");
        $Age_Description = @Forge_Age[int(rand(@Forge_Age))];	
    }elsif($Home_World eq "Frontier World") {
		my @Frontier_Age = ("Kid(15+1d10)","Kid(15+1d10)","Kid(15+1d10)","Primed(25+1d10)",
	"Primed(25+1d10)","Primed(25+1d10)","Primed(25+1d10)","Primed(25+1d10)","Grandly(45+1d10)","Grandly(45+1d10)");
        $Age_Description = @Frontier_Age[int(rand(@Frontier_Age))];	
    }elsif($Home_World eq "Garden World") {
		my @Garden_Age = ("Attendant(20+1d10)","Attendant(20+1d10)","Docent(30+1d10)","Docent(30+1d10)",
	"Docent(30+1d10)","Docent(30+1d10)","Exemplar(40+1d10)","Exemplar(40+1d10)","Exemplar(40+1d10)","Exemplar(40+1d10)");
        $Age_Description = @Garden_Age[int(rand(@Garden_Age))];	
    }elsif($Home_World eq "Highborn") {
		my @High_Age = ("Scion(20+1d10)","Scion(20+1d10)","Scion(20+1d10)","Scion(20+1d10)",
	"Scion(20+1d10)","Prime(30+1d10)","Prime(30+1d10)","Prime(30+1d10)","Authority(40+1d10)","Authority(40+1d10)");
        $Age_Description = @High_Age[int(rand(@High_Age))];	
    }elsif($Home_World eq "Hive World") {
		my @Hive_Age = ("Nipper(15+1d10)","Nipper(15+1d10)","Nipper(15+1d10)","Adult(25+1d10)",
	"Adult(25+1d10)","Adult(25+1d10)","Adult(25+1d10)","Adult(25+1d10)","Adult(25+1d10)","Old Timer(35+1d10)");
        $Age_Description = @Hive_Age[int(rand(@Hive_Age))];	
    }elsif($Home_World eq "Penal Colony") {
		my @Penal_Age = ("New Meat(20+1d10)","New Meat(20+1d10)","New Meat(20+1d10)","Convict(30+1d10)",
	"Convict(30+1d10)","Convict(30+1d10)","Convict(30+1d10)","Lifer(40+2d10)","Lifer(40+2d10)","Lifer(40+2d10)");
        $Age_Description = @Penal_Age[int(rand(@Penal_Age))];	
    }elsif($Home_World eq "Quarantine World") {
		my @Quarantine_Age = ("Clean(15+1d10)","Survivor(25+1d10)","Survivor(25+1d10)","Survivor(25+1d10)",
	"Survivor(25+1d10)","Survivor(25+1d10)","Fossil(35+1d10)","Fossil(35+1d10)","Fossil(35+1d10)","Fossil(35+1d10)");
        $Age_Description = @Quarantine_Age[int(rand(@Quarantine_Age))];	
    }elsif($Home_World eq "Research Station") {
		my @Research_Age = ("Notion(15+1d10)","Notion(15+1d10)","Notion(15+1d10)","Evidentiary(25+2d10)","Evidentiary(25+2d10)",
	"Evidentiary(25+2d10)","Evidentiary(25+2d10)","Conviction(45+2d10)","Conviction(45+2d10)","Conviction(45+2d10)");
        $Age_Description = @Research_Age[int(rand(@Research_Age))];	
    }elsif($Home_World eq "Shrine World") {
		my @Shrine_Age = ("Novate (20+1d10)","Novate(20+1d10)","Vital(25+1d10)","Vital(25+1d10)",
	"Vital(25+1d10)","Vital(25+1d10)","Vital(25+1d10)","Vital(25+1d10)","Elder(50+1d10)","Elder(50+1d10)");
        $Age_Description = @Shrine_Age[int(rand(@Shrine_Age))];	
    }elsif($Home_World eq "Voidborn") {
		my @Void_Age = ("Youth(15+1d10)","Youth(15+1d10)","Youth(15+1d10)","Youth(15+1d10)",
	"Mature(20+1d10)","Mature(20+1d10)","Mature(20+1d10)","Methuselah(50+1d10)","Methuselah(50+1d10)","Methuselah(50+1d10)");
        $Age_Description = @Void_Age[int(rand(@Void_Age))];	
    }
	$Age_Description =~ /(.*)\((.*)\)/;
	my $Age_Nums = $2;
	$Age_Description = $1;
	$Age_Nums =~/(.*)\+(.*)d(.*)/;
	my $Age_Add = $1;
	my $Age_Count = $2;
	my $Age_Multi = $3;
	for(my $i=0; $i< $Age_Count; $i++){
		$Age = ($Age + int(rand($Age_Multi)) + 1);
	}
	$Age = $Age + $Age_Add;
	my @Age_Return = ($Age_Description, $Age);
	return @Age_Return;
}
###################################################### DH2 Attributes #################################
sub Attributes{
	my $Home_World = shift;
	my $Ballistic_Skill = 20 + (int(rand(10))+1) + (int(rand(10))+1);
	my $Weapon_Skill = 20 + (int(rand(10))+1) + (int(rand(10))+1);
	my $Strength = 20 + (int(rand(10))+1) + (int(rand(10))+1);
	my $Toughness = 20 + (int(rand(10))+1) + (int(rand(10))+1);
	my $Influence = 20 + (int(rand(10))+1) + (int(rand(10))+1);
	my $Intelligence = 20 + (int(rand(10))+1) + (int(rand(10))+1);
	my $Fellowship = 20 + (int(rand(10))+1) + (int(rand(10))+1);
	my $Agility = 20 + (int(rand(10))+1) + (int(rand(10))+1);
	my $Perception = 20 + (int(rand(10))+1) + (int(rand(10))+1);
	my $Willpower = 20 + (int(rand(10))+1) + (int(rand(10))+1);
	if ($Home_World) {
        if ($Home_World eq "Agri-World") {
            $Strength = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Fellowship = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Agility = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Daemon World") {
            $Willpower = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Perception = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Fellowship = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Death World") {
            $Agility = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Perception = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Fellowship = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Feral World") {
            $Strength = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Toughness = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Influence = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Feudal World") {
            $Perception = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Weapon_Skill = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Intelligence = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Forge World") {
            $Intelligence = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Toughness = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Fellowship = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Frontier World") {
            $Ballistic_Skill = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Perception = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Fellowship = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Garden World") {
            $Agility = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Fellowship = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Toughness = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Highborn") {
            $Influence = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Fellowship = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Toughness = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Hive World") {
            $Agility = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Perception = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Willpower = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Penal Colony") {
            $Perception = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Toughness = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Influence = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Quarantine World") {
            $Ballistic_Skill = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Intelligence = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Strength = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Research Station") {
            $Intelligence = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Perception = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Fellowship = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Shrine World") {
            $Willpower = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Fellowship = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Perception = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
        }elsif($Home_World eq "Voidborn") {
            $Intelligence = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Willpower = 20 + Highest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
            $Strength = 20 + Lowest((int(rand(10))+1),(int(rand(10))+1),(int(rand(10))+1));
		}
	}
    my @Attributes_List = ($Ballistic_Skill,$Weapon_Skill,$Strength,$Toughness,$Agility,$Intelligence,$Willpower,$Perception,$Fellowship,$Influence);
	return @Attributes_List;
    sub Highest{
		my $Roll_One = shift;
		my $Roll_Two = shift;
		my $Roll_Three = shift;
		my $Score;
		if ($Roll_One < $Roll_Two && $Roll_One < $Roll_Three) {
            $Score = $Roll_Two + $Roll_Three;
        }elsif($Roll_Two < $Roll_One && $Roll_Two < $Roll_Three) {
            $Score = $Roll_One + $Roll_Three;
		}else{$Score = $Roll_One + $Roll_Two;}
        return $Score;
	}
   sub Lowest{
		my $Roll_One = shift;
		my $Roll_Two = shift;
		my $Roll_Three = shift;
		my $Score;
		if ($Roll_One > $Roll_Two && $Roll_One > $Roll_Three) {
            $Score = $Roll_Two + $Roll_Three;
        }elsif($Roll_Two > $Roll_One && $Roll_Two > $Roll_Three) {
            $Score = $Roll_One + $Roll_Three;
		}else{$Score = $Roll_One + $Roll_Two;}
        return $Score;
	}
}
################################################## DH2 Attributes Boost########################
sub Medium_Attributes{
	my @Attributes_List = @_;
	for(my $i=0; $i<=9; $i++){
		$Attributes_List[$i] = $Attributes_List[$i] + (int(rand(10))+1);
	}
	if ($Attributes_List[10]) {
		$Attributes_List[10] = $Attributes_List[10] + (int(rand(5))+1);
    }
	return @Attributes_List;
}
sub High_Attributes{
	my @Attributes_List = @_;
	for(my $i=0; $i<=9; $i++){
		$Attributes_List[$i] = $Attributes_List[$i] + (int(rand(10))+1) + (int(rand(10))+1);
	}
	if ($Attributes_List[10]) {
		$Attributes_List[10] = $Attributes_List[10] + (int(rand(5))+1) + (int(rand(5))+1);
    }
	return @Attributes_List;
}
sub Extreme_Attributes{
	my @Attributes_List = @_;
	for(my $i=0; $i<=9; $i++){
		$Attributes_List[$i] = $Attributes_List[$i] + (int(rand(10))+1) + (int(rand(10))+1) + (int(rand(10))+1);
	}
	if ($Attributes_List[10]) {
		$Attributes_List[10] = $Attributes_List[10] + (int(rand(5))+1) + (int(rand(5))+1) + (int(rand(5))+1);
    }
	return @Attributes_List;
}
##################################################### DH2 Names ###################################
sub DH2_Names{
	#Primitive = Barbaric
	#Low Gothic = Lowly Citizens
	#High Gothic = Ruling Class
	#Archaic = Auspicious and ancient
	#Informal = anywhere
	my $Gender = shift;
	my $Name;
	my @Names_List;

	my @Primitive_Names_Male =("Arz","Barik","Carm","Farn","Garak","Horst","Imk","Jart","Kulem","Larl",
							   "Mok","Narl","Oort","Pak","Ragaa","Salc","Tarl","Volc","Yarl","Zel");
	my @Primitive_Names_Female =("Arda","Cil","Dara","Elphet","Frakka","Garma","Halli","Ing","Julla",
								 "Kelle","Merra","Nimm","Nulla","Paz","Russa","Sulle","Thima","Vas",
								 "Yanne","Zanna");
	my @Low_Gothic_Names_Male =("Aaz","Canto","Darrial","Enoch","Festus","Gaius","Harlon","Irlven",
								 "Jaspar","Killian","Lazarus","Mordicai","Nicodemus","Quinten","Rhaban",
								 "Silvanto","Titus","Uriah","Xerxes","Zariel");
	my @Low_Gothic_Names_Female =("Acadi","Balida","Cassa","Darial","Frennine","Galatia","Hannette","Jinzia",
								  "Karroleen","Liri","Magdala","Narcia","Pennette","Quineel","Rhia","Sesselie",
								  "Thesse","Uri","Xandra","Zadori");
	my @High_Gothic_Names_Male =("Azararch","Baranoth","Castess","Davrus","Erioch","Galliach","Harthos","Icharus",
								 "Karpath","Lothos","Marius","Noctine","Octavius","Partheos","Quellus","Ramalies",
								 "Severan","Tyruss","Ventium","Zarath");
	my @High_Gothic_Names_Female =("Araleen","Castella","Elleantra","Fausta","Flavia","Heras","Irissa","Jucinda","Lucindia",
								   "Mycandra","Novianna","Nuella","Palanza","Praenta","Regia","Scythia","Temetria","Thallia",
								   "Venria","Yemmise");
	my @Archaic_Names_Male =("Alaric","Barbosa","Caradoc","Draco","Eizen","Ferris","Grendal","Harlocke","Jenquin",
							 "Karlos","Lemant","Magnus","Naveen","Oscarl","Perrin","Romulus","Sabanth","Urial","Wolfe",
							 "Zarkov");
	my @Archaic_Names_Female =("Aennisse","Bianca","Drusilla","Eos","Florenza","Genevieve","Hannette","Jocasta","Katarina",
							   "Lethe","Miranda","Pollonia","Rosalind","Severine","Tessera","Tzarelle","Urania","Verity",
							   "Wynnif","Yasta");
	my @Informal_Names_Male =("Able","Bones","Cutter","Dakka","Dokk","Ergs","Fanz","Flair","Garrit","Hons","Ills","Jaq",
							  "Lax","Meng","Nast","Reddin","Scab","Shiv","Tranq","Wurm");
	my @Informal_Names_Female =("Alta","Blue","Echo","Fatal","Flame","Gamma","Grace","Jaine","Lho","Mini","Nerva","Newt",
								"Pris","Red","Steel","Starr","Tanda","Trix","Xina","Zedda");
	my @Names_Female = (@Primitive_Names_Female,@Low_Gothic_Names_Female,@High_Gothic_Names_Female,@Archaic_Names_Female,
						@Informal_Names_Female);
	my @Names_Male = (@Primitive_Names_Male,@Low_Gothic_Names_Male,@High_Gothic_Names_Male,@Archaic_Names_Male,
						@Informal_Names_Male);
	unless($Gender) {
		my $rand = int(rand(2));
		if($rand == 0) {
		    $Gender = "Female";
		}else{$Gender = "Male";}
    }
	my $Rand_Gender_Name = int(rand(21))+1;
	if ($Rand_Gender_Name == 21) {
        if ($Gender eq "Female") {
            $Gender = "Male";
        }else{$Gender = "Female";}   
    }
    
	if ($Gender eq "Female") {
		@Names_List = @Names_Female;
    }
	if ($Gender eq "Male") {
		@Names_List = @Names_Male;
    }
	my @Name_Type = $Names_List[int(rand(@Names_List))];
	$Name = $Name_Type[int(rand(@Name_Type))];
    
	return $Name;
}
######################################################## DH2 Wounds ###########################
sub Wounds{
	my $Home_World = shift;
	my $Wounds;
	if ($Home_World eq "Frontier World" || $Home_World eq "Garden World" || $Home_World eq "Shrine World" ||
		$Home_World eq "Voidborn" || $Home_World eq "Daemon World") {
        $Wounds = 7 + (int(rand(5))+1);
	}elsif($Home_World eq "Agri-World" || $Home_World eq "Research Station" || $Home_World eq "Forge World" ||
		   $Home_World eq "Hive World" || $Home_World eq "Quarantine World") {
        $Wounds = 8 + (int(rand(5))+1);
    }elsif($Home_World eq "Feral World" || $Home_World eq "Feudal World" || $Home_World eq "Death World" ||
		   $Home_World eq "Highborn") {
        $Wounds = 9 + (int(rand(5))+1);
	}elsif($Home_World eq "Penal Colony") {
        $Wounds = 10 + (int(rand(5))+1);
	}
    return $Wounds;
}

################################################## DH2 D&D Attribute Connection ##############################
sub DH2_DnD_Attributes{
	my @Attributes_List_DH2 = @_;
	my $Bad_Ability = pop @Attributes_List_DH2;
	my $Good_Ability = pop @Attributes_List_DH2;
	$Good_Ability =~/\[(.*)\]/;
	$Good_Ability = $1;
	$Bad_Ability =~/\[(.*)\]/;
	$Bad_Ability = $1;
	if ($Good_Ability eq "Str" ) {
        $Attributes_List_DH2[1] = $Attributes_List_DH2[1] + (int(rand(10))+1);#Weapon Skill
        $Attributes_List_DH2[2] = $Attributes_List_DH2[2] + (int(rand(10))+1);#Strength
    }elsif($Good_Ability eq "Dex" ) {
        $Attributes_List_DH2[0] = $Attributes_List_DH2[0] + (int(rand(10))+1);#Ballistic Skill
        $Attributes_List_DH2[4] = $Attributes_List_DH2[4] + (int(rand(10))+1);#Agility 
    }elsif($Good_Ability eq "Con" ) {
        $Attributes_List_DH2[3] = $Attributes_List_DH2[3] + (int(rand(10))+1);#Toughness
        $Attributes_List_DH2[10] = $Attributes_List_DH2[10] + (int(rand(5))+1);#Wounds
    }elsif($Good_Ability eq "Int" ) {
        $Attributes_List_DH2[5] = $Attributes_List_DH2[5] + (int(rand(10))+1);#Intellegence
    }elsif($Good_Ability eq "Wis" ) {
        $Attributes_List_DH2[7] = $Attributes_List_DH2[7] + (int(rand(10))+1);#Perception
        $Attributes_List_DH2[6] = $Attributes_List_DH2[6] + (int(rand(10))+1);#Willpower
    }elsif($Good_Ability eq "Cha" ) {
        $Attributes_List_DH2[8] = $Attributes_List_DH2[8] + (int(rand(10))+1);#Fellowship
        $Attributes_List_DH2[9] = $Attributes_List_DH2[9] + (int(rand(10))+1);#Influence
	}
	if ($Bad_Ability eq "Str" ) {
        $Attributes_List_DH2[1] = $Attributes_List_DH2[1] - (int(rand(10))+1);#Weapon Skill
        $Attributes_List_DH2[2] = $Attributes_List_DH2[2] - (int(rand(10))+1);#Strength
    }elsif($Bad_Ability eq "Dex" ) {
        $Attributes_List_DH2[0] = $Attributes_List_DH2[0] - (int(rand(10))+1);#Ballistic Skill
        $Attributes_List_DH2[4] = $Attributes_List_DH2[4] - (int(rand(10))+1);#Agility 
    }elsif($Bad_Ability eq "Con" ) {
        $Attributes_List_DH2[3] = $Attributes_List_DH2[3] - (int(rand(10))+1);#Toughness
        $Attributes_List_DH2[10] = $Attributes_List_DH2[10] - (int(rand(5))+1);#Wounds
    }elsif($Bad_Ability eq "Int" ) {
        $Attributes_List_DH2[5] = $Attributes_List_DH2[5] - (int(rand(10))+1);#Intellegence
    }elsif($Bad_Ability eq "Wis" ) {
        $Attributes_List_DH2[7] = $Attributes_List_DH2[7] - (int(rand(10))+1);#Perception
        $Attributes_List_DH2[6] = $Attributes_List_DH2[6] - (int(rand(10))+1);#Willpower
    }elsif($Bad_Ability eq "Cha" ) {
        $Attributes_List_DH2[8] = $Attributes_List_DH2[8] - (int(rand(10))+1);#Fellowship
        $Attributes_List_DH2[9] = $Attributes_List_DH2[9] - (int(rand(10))+1);#Influence
	}
	return @Attributes_List_DH2;
    
}
#################################################### D&D Appearance ###########################
sub Appearance{
	my @Appearance_List = ("Distinctive item"," Piercings","Flamboyant or outlandish clothes","Formal, clean clothes","Ragged, dirty clothes","Pronounced scar","Missing teeth",
	"Missing fingers","Unusual eye color","Tattoos","Birthmark","Unusual skin colour","Bald","Braided beard or hair","Unusual hair colour","Nervous eye twitch",
	"Distinctive nose","Crooked posture","Rigid posture","Exceptionally beautiful","Exceptionally ugly");
	my $Appearance = @Appearance_List[int(rand(@Appearance_List))];
	return $Appearance;
}
#################################################### D&D Good Abilities ###########################
sub Good_Abilities{
	my $Bad_Ability = shift;
	my @Good_Abilities_List = ("Powerful, brawny, strong as an ox [Str]","Lithe, agile, graceful [Dex]","Hardy, hale, healthy [Con]",
			"Studious, learned, inquisitive [Int]","Perceptive, insightful [Wis]","Persuasive, forceful, born leader [Cha]");
	my $Good_Ability = @Good_Abilities_List[int(rand(@Good_Abilities_List))];
	if ($Bad_Ability) {
		$Bad_Ability =~/\[(.*)\]/;
		$Bad_Ability = $1;
		while($Good_Ability =~ /\[$Bad_Ability\]/) {
			$Good_Ability = @Good_Abilities_List[int(rand(@Good_Abilities_List))];
		}
    }
    return $Good_Ability;
}
#################################################### D&D Bad Abilities ###########################
sub Bad_Abilities{
	my $Good_Ability = shift;
	my @Bad_Abilities_List = ("Feeble, scrawny [Str]","Clumsy, fumbling [Dex]","Sickly, pale [Con]","Dim witted, slow [Int]",
			"Oblivious, absentminded [Wis]","Dull, boring [Cha]");
	my $Bad_Ability = @Bad_Abilities_List[int(rand(@Bad_Abilities_List))];
	if ($Good_Ability) {
		$Good_Ability =~/\[(.*)\]/;
		$Good_Ability = $1;
		while($Bad_Ability =~ /\[$Good_Ability\]/) {
			$Bad_Ability = @Bad_Abilities_List[int(rand(@Bad_Abilities_List))];
		}
    }
    return $Bad_Ability;
}
#################################################### D&D Talents ###########################
sub Talents{
   my @Talents_List =("Plays a musical instrument","Speaks several languages","Unbelievablly lucky","Perfect memory","Great with animals","Great with children",
   "Great at solving puzzles","Great at one game","Great at impersonations","Draws beautifully","Paints beautifully","Sings beautifully","Drinks everyone under the table",
   "Expert carpenter","Expert cook","Expert dart thrower and rock skipper","Expert juggler","Skilled actor and master of disguise","Skilled dancer","Street smart");
	my $Talent = @Talents_List[int(rand(@Talents_List))];
	return $Talent;
}
#################################################### D&D Mannerisms ###########################
sub Mannerisms{
   my @Mannerisms_List =("Prone to singing","Whistles","Humms quietly","Speaks in rhyme, or other odd way","Particularly high voice","Particularly low voice","Slurs","Stutters",
   "Lisps","Enunciates overly clearly","Speaks loudly","Whispers","Uses flowery speech or long words","Frequently uses the wrong words","Uses colourful oaths and exclamations",
   "Makes constant jokes or puns","Prone to predictions of doom","Fidgets","Squints","Stares into the distance","Chews something","Paces","Taps fingers",
   "Bites fingernails","Twirls hair or tugs beard");
	my $Mannerisms = @Mannerisms_List[int(rand(@Mannerisms_List))];
	return $Mannerisms;
}
#################################################### D&D Interactive Traits ###########################
sub Interactive_Traits{
	my @Interactive_Traits_List = ("Argumentative","Arrogant","Blustering","Rude","Curious","Friendly","Honest","Hot tempered","Irritable","Ponderous","Quiet","Suspecious");
	my $Interactive_Traits = @Interactive_Traits_List[int(rand(@Interactive_Traits_List))];
	return $Interactive_Traits;	
}
#################################################### D&D Alignment ########################
sub Alignment{
	my @Alignment_List = ("Good","Evil","Lawful","Chaotic","Neutral","Other");
	my $Alignment = @Alignment_List[int(rand(@Alignment_List))];
	return $Alignment;
}
#################################################### D&D Ideals ###########################
sub Ideals{
	my $Alignment = shift;
	my $Ideal;
	unless($Alignment){
		my @Alignment_List = ("Good","Evil","Lawful","Chaotic","Neutral","Other");
		$Alignment = @Alignment_List[int(rand(@Alignment_List))];
	}else{
	if ($Alignment eq "Good") {
		my @Good_Ideal = ("Beauty","Charity","Great good","Life","Respect","Self-sacrifice");
		$Ideal = @Good_Ideal[int(rand(@Good_Ideal))];
    }elsif($Alignment eq "Evil") {
		my @Evil_Ideal = ("Dominion","Greed","Might","Pain","Retribution","Slaughter");
		$Ideal = @Evil_Ideal[int(rand(@Evil_Ideal))];
    }elsif($Alignment eq "Lawful") {
		my @Lawful_Ideal = ("Community","Fairness","Honour","Logic","Responsibility","Tradtition");
		$Ideal = @Lawful_Ideal[int(rand(@Lawful_Ideal))];
    }elsif($Alignment eq "Chaotic") {
		my @Chaotic_Ideal = ("Change","Creativity","Freedom","Independence","No Limits","Whimsy");
		$Ideal = @Chaotic_Ideal[int(rand(@Chaotic_Ideal))];
    }elsif($Alignment eq "Neutral") {
		my @Neutral_Ideal = ("Balance","Knowledge","Live and let live","Moderation","Neutrality","People");
		$Ideal = @Neutral_Ideal[int(rand(@Neutral_Ideal))];
    }elsif($Alignment eq "Other") {
		my @Other_Ideal = ("Aspiration","Discovery","Glory","Nation","Redemption","Self-knowledge");
		$Ideal = @Other_Ideal[int(rand(@Other_Ideal))];
    }
	}
	return $Ideal;
}
#################################################### D&D Bonds ###########################
sub Bonds{
   my @Bonds_List = ("Dedicated to fulfilling a personal life goal","Protective of close family member","Protective of colleagues or compatriots","Loyal to a benefactor, patron, or employer",
   "Captivated by a romantic interest","Drawn to a special place","Protective of a sentimental keepsake","Protective of a valuable possession","Out for revenge","Roll twice");
	my $Bonds = $Bonds_List[int(rand(@Bonds_List))];
	if($Bonds eq "Roll twice"){
		my $Bonds_One = $Bonds_List[int(rand(scalar(@Bonds_List)-1))];
		my $Bonds_Two = $Bonds_List[int(rand(scalar(@Bonds_List)-1))];
		while($Bonds_One eq $Bonds_Two){$Bonds_Two = $Bonds_List[int(rand(scalar(@Bonds_List)-1))];}
		$Bonds = $Bonds_One . ", and " . $Bonds_Two;
	}
	return $Bonds;
}
#################################################### D&D Flaws & Secrets ###########################
sub Flaws_And_Secrets{
   my @Flaws_And_Secrets_List = ("Forbidden love","susceptibility to romance","Enjoys decadent pleasures","Arrogance","Envies another creature's possessions or station","Overpowering greed",
   "Prone to rage","Has a powerful enemy","Specific phobia","Shameful or scandalous history","Secret crime or misdeed","Possession of forbidden lore","Foolhardy bravery");
	my $Flaws_And_Secrets = $Flaws_And_Secrets_List[int(rand(@Flaws_And_Secrets_List))];
	return $Flaws_And_Secrets;
}
######################################## Metric to Imperial ##########################
sub Metric_Imp{
	my $Metric = shift;
	$Metric =~ /(.*)m\/(.*)kg/;
	my $Metric_Height = $1;
	my $Metric_Weight = $2;
	my $Imp_Height = (($Metric_Height)*(39.37008));
	my $Imp_Height_Feet = int(($Imp_Height)/12);
	my $Imp_Height_Inch = $Imp_Height % 12;
	$Imp_Height = "$Imp_Height_Feet.$Imp_Height_Inch\"";
	my $Imp_Weight = int($Metric_Weight*2.20462) . "lbs";
	my @Imp_Return = ($Imp_Height, $Imp_Weight);
	return @Imp_Return;
}
