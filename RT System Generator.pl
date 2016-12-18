#!/usr/bin/perl

use strict;
use warnings;

#System Generator
#Features();
Government_Generation();
#Planet_Generator();
Customs_Generation();
######################### System Features #############
sub Features{
    my $Features;
    my $Feature_Number = (int(rand(5))+1) - 2;
    my @Feature_List = ("Bountiful","Gravity Tides","Haven","Ill-Omened","Pirate Den",
                        "Ruined Empire","Starfarers","Stellar Anomaly","Warp Stasis","Warp Turbulence");
    if ($Feature_Number < 1) {
        $Feature_Number = 1;
    }
    #my $Features = "System has $Feature_Number Features: ";
    until($Feature_Number == 0){
        my $Random_Feature = $Feature_List[int(rand(@Feature_List))];
        unless($Features) {
            $Features = "$Random_Feature";
        }else{
            while($Features =~ /$Random_Feature/){
                $Random_Feature = $Feature_List[int(rand(@Feature_List))];
            }
            $Features .= ", $Random_Feature";
        }
        $Feature_Number = $Feature_Number -1;
    }
    print $Features;    
}

################################## Star Generation ##################
sub Star_Generation{
    my @Star_List = ("Mighty","Vigorous","Luminous","Dull","Anomalous","Binary");
    my $Star = $Star_List[int(rand(@Star_List))];
}

###################################### Government ####################
sub Government_Generation{
	my $Government;
    my $Unity;
    my $Special_Con;
    my $Control_Rating;
    my $Unity_Roll = (int(rand(6))+1) + (int(rand(6))+1);
    my @Unity_Chance = (5,6,7,8,12);
    my @Unity_List = ("Diffuse","Factionalized","Coalition","World Government*","World Government");
	for(my $i=0; $i<scalar(@Unity_Chance); $i++){
		if($Unity_Roll <= $Unity_Chance[$i]){
			$Unity = "$Unity_List[$i] ";
			##//Found the Home World, stop the loop.
			last;
		}
	}
    if ($Unity_Roll == 8) {
        my $Special_Con_Roll = (int(rand(6))+1) + (int(rand(6))+1) + (int(rand(6))+1);
        my @Special_Con_Chance = (5,6,8,9,10,12,14,15,16,17,18);
        my @Special_Con_List =("Subjugated*","Sanctuary","Military Government","Socialist*","Bureaucracy",
                               "Colony","Oligarchy*","Meritocracy*","Matriarchy or Patriarchy","Utopia","Cybercracy");
        for(my $i=0; $i<scalar(@Special_Con_Chance); $i++){
            if($Special_Con_Roll <= $Special_Con_Chance[$i]){
            	$Special_Con = "$Special_Con_List[$i] ";
            	##//Found the Home World, stop the loop.
            	$i = scalar(@Special_Con_Chance) + 1;
            }
        }
        if ($Special_Con =~ /\*/) {
            $Special_Con_Roll = (int(rand(6))+1) + (int(rand(6))+1) + (int(rand(6))+1);
            for(my $i=0; $i<scalar(@Special_Con_Chance); $i++){
                if($Special_Con_Roll <= $Special_Con_Chance[$i]){
                	$Special_Con .= ",$Special_Con_List[$i] ";
                	##//Found the Home World, stop the loop.
                	$i = scalar(@Special_Con_Chance) + 1;
                }
            }
        }
    }
	##First Array is the list of Home World options
	my @Government_List = ("Anarchy","Clan/Tribal","Caste","Feudal","Corporate State","Athenian Democracy","Representative Democracy",
                           "Technocracy","Dictatorship","Theocracy");
	#my @CR_List = ("0","3-5","3-6","4-6","4-6","2-4","2-4","3-6","3-6","3-6");
    my @CR_List = ("Anarchy (0)","Very Free (1)","Free (2)","Moderate (3)","Controlled (4)","Repressive (5)","Total Control (6)");
	my @Government_Chance = (3, 10, 20, 35, 45, 48, 63, 70, 90, 100);
    my $Ran_Gov_Num = int(rand(100))+1;
	for(my $i=0; $i<scalar(@Government_Chance); $i++){
		if($Ran_Gov_Num <= $Government_Chance[$i]){
			$Government = "$Government_List[$i]";
			##//Found the Home World, stop the loop.
			last;
		}
	}
    if ($Special_Con) {
    print "Unity: $Unity\nGovernment: ($Special_Con) $Government\n";
    }else{
    print "Unity: $Unity\nGovernment: $Government\n";
    }
    unless($Government eq "Anarchy"){
        unless($Special_Con){$Special_Con = "Nothing Special";}
        my $Government_Structure;
        my $Ran_Gov_Structure = (int(rand(6))+1) + (int(rand(6))+1) + (int(rand(6))+1);
        if ($Government eq "Athenian Democracy") {
            $Ran_Gov_Structure = $Ran_Gov_Structure + 8 ;
        }elsif($Special_Con =~ /Meritocracy|Bureaucracy/){
            $Ran_Gov_Structure = $Ran_Gov_Structure + 2 ;
        }elsif($Government eq "Caste" ||$Government eq "Theocracy" ||$Government eq "Dictatorship" ||$Government eq "Clan/Tribal"){
            $Ran_Gov_Structure = $Ran_Gov_Structure - 8 ;
        }elsif($Government eq "Feudal" ||$Government eq "Corporate State" || $Special_Con =~ /Oligarchy|Subjugated/){
            $Ran_Gov_Structure = $Ran_Gov_Structure -4 ;
        }
        my @Gov_Structure_List = ("Single individual","Single individual with advisory council","Small council","Large council","Multiple councils","Limited direct participation","Full direct participation");
        my @Gov_Structure_Chance = (0,4,8,12,16,20,30);
        for(my $i=0; $i<scalar(@Gov_Structure_Chance); $i++){
        	if($Ran_Gov_Structure <= $Gov_Structure_Chance[$i]){
        		$Government_Structure = "$Gov_Structure_List[$i]";
        		##//Found the Home World, stop the loop.
        		last;
        	}
        }
        print "Government_Structure: $Government_Structure\n"
    }
    
    if ($Government eq "Anarchy") {
        $Control_Rating = "Anarchy";
    }elsif($Government eq "Clan/Tribal"){
        my $Control_Rating_Roll = int(rand(3))+3;
        $Control_Rating = $CR_List[$Control_Rating_Roll];
    }elsif($Government eq "Caste" ||$Government eq "Theocracy" ||$Government eq "Dictatorship" ||$Government eq "Technocracy"){
        my $Control_Rating_Roll = int(rand(4))+3;
        $Control_Rating = $CR_List[$Control_Rating_Roll];
    }elsif($Government eq "Feudal" ||$Government eq "Corporate State"){
        my $Control_Rating_Roll = int(rand(3))+4;
        $Control_Rating = $CR_List[$Control_Rating_Roll];
    }elsif($Government eq "Athenian Democracy" ||$Government eq "Representative Democracy"){
        my $Control_Rating_Roll = int(rand(2))+2;
        $Control_Rating = $CR_List[$Control_Rating_Roll];
    }
    my $Law_Uni;
    my $Law_Uni_Roll = (int(rand(6))+1) + (int(rand(6))+1);
#    if($Government eq "Balkanized"){
#        my $Gov_Mod = Balkanized();
#        print "Testing : $Gov_Mod";
#        $Government .= " (Commonly $Gov_Mod)";
#    }
#    if ($Government =~ /Oligarchy|Captive|Bureaucracy|Anarchy/) {
#        my @Gov_Mod_List =("Anarchy","Corporate State","Athenian Democracy","Representative Democracy",
#                           "Technocracy","Balkanized","Bureaucracy",
#                           "Dictatorship","Theocracy");
#        my $Gov_Mod = $Government_List[int(rand(@Government_List))];
#        $Government .= "($Gov_Mod)";
#    }
    ##############################Diversity
    my $Diversity;
    my $Diversity_Roll = (int(rand(6))+1) + (int(rand(6))+1) + (int(rand(6))+1);
    if ($Diversity_Roll <= 7) {
        $Diversity = "Monolithic($Diversity_Roll/3-18)";
        $Law_Uni_Roll = $Law_Uni_Roll -2;
    }elsif ($Diversity_Roll <= 13) {
        $Diversity = "Moderate($Diversity_Roll/3-18)";
    }else{$Diversity = "Diverse($Diversity_Roll/3-18)";}
    ###########################Uniformity of Law
    if ($Law_Uni_Roll <= 5) {
        $Law_Uni = "Personal($Law_Uni_Roll/2-12)";
    }elsif ($Law_Uni_Roll <= 7) {
        $Law_Uni = "Territorial($Law_Uni_Roll/2-12)";
    }else{$Law_Uni = "Undivided($Law_Uni_Roll/2-12)";}
    print "CR: $Control_Rating ($Law_Uni)\n";    
    print "Diversity Level: $Diversity\n";
    
    my $Tolerance;
    my $Tolerance_Roll = (int(rand(6))+1) + (int(rand(6))+1) + (int(rand(6))+1);
    if ($Tolerance_Roll <= 7) {
        $Tolerance = "Xenophobic($Tolerance_Roll/18)";
    }elsif ($Tolerance_Roll <= 13) {
        $Tolerance = "Moderate($Tolerance_Roll/18)";
    }else{$Tolerance = "Cordial($Tolerance_Roll/18)";}
    print "Tolerance Level: $Tolerance\n";
    
    my $Soldiarity;
    my $Soldiarity_Roll = (int(rand(6))+1) + (int(rand(6))+1) + (int(rand(6))+1);
    if ($Soldiarity_Roll <= 7) {
        $Soldiarity = "Egoistic($Soldiarity_Roll/18)";
    }elsif ($Soldiarity_Roll <= 13) {
        $Soldiarity = "Moderate($Soldiarity_Roll/18)";
    }else{$Soldiarity = "Collectivistic($Soldiarity_Roll/18)";}
    print "Soldiarity Level: $Soldiarity\n";
    
    my $Obedience;
    my $Obedience_Roll = (int(rand(6))+1) + (int(rand(6))+1) + (int(rand(6))+1);
    if ($Obedience_Roll <= 7) {
        $Obedience = "Rebellious($Obedience_Roll/18)";
    }elsif ($Obedience_Roll <= 13) {
        $Obedience = "Moderate($Obedience_Roll/18)";
    }else{$Obedience = "Submissive($Obedience_Roll/18)";}
    print "Obedience Level: $Obedience\n";
    
    my $Aggression;
    my $Aggression_Roll = (int(rand(6))+1) + (int(rand(6))+1) + (int(rand(6))+1);
    if ($Aggression_Roll <= 7) {
        $Aggression = "Pacific($Aggression_Roll/18)";
    }elsif ($Aggression_Roll <= 13) {
        $Aggression = "Moderate($Aggression_Roll/18)";
    }else{$Aggression = "Violent($Aggression_Roll/18)";}
    print "Aggression Level: $Aggression\n";
    
    my $Spirituality;
    my $Spirituality_Roll = (int(rand(6))+1) + (int(rand(6))+1) + (int(rand(6))+1);
    if ($Spirituality_Roll <= 7) {
        $Spirituality = "Empirical($Spirituality_Roll/18)";
    }elsif ($Spirituality_Roll <= 13) {
        $Spirituality = "Moderate($Spirituality_Roll/18)";
    }else{$Spirituality = "Mystical($Spirituality_Roll/18)";}
    print "Spirituality Level: $Spirituality\n";
    
    my $Innovation;
    my $Innovation_Roll = (int(rand(6))+1) + (int(rand(6))+1) + (int(rand(6))+1);
    if ($Innovation_Roll <= 7) {
        $Innovation = "Reactionary($Innovation_Roll/18)";
    }elsif ($Innovation_Roll <= 13) {
        $Innovation = "Moderate($Innovation_Roll/18)";
    }else{$Innovation = "Progressive($Innovation_Roll/18)";}
    print "Innovation Level: $Innovation\n";
    
    #######################################Customs
    my @Customs_List = ();
    sub Balkanized{
         my @Gov_Mod_List =("Anarchy/Tribal","Corporate State","Athenian Democracy","Oligarchy/Feudal","Representative Democracy",
                           "Technocracy","Bureaucracy",
                           "Dictatorship","Theocracy");
        my $Gov_Mod = $Gov_Mod_List[int(rand(@Gov_Mod_List))];
        return $Gov_Mod;
    }
	#return $Government;    
}

###################################### Planet #############################
sub Planet_Generator{
    my $Planet_Size;
    my $Gravity;
    my $Atmo_Pres;
    my $Atmo_Comp;
    my $System_Location;
    my $Habitability;
    my $Climate;
    my $Territories;
    my @Rocky_Size_List = ("Low-Mass","Small","Small and Dense","Large","Large and Dense","Vast");
    my @Rockey_Size_Chance = (1,3,4,7,8,10);
    my @Gravity_List = ("Low Gravity","Normal Gravity","High_Gravity");
    my @Gravity_Chance = (2,8,15);
    my @Atmo_Pres_List = ("None","Thin","Moderate","Heavy");
    my @Atmo_Pres_Chance = (1,4,9,20);
    my @Atmo_Comp_List = ("Deadly","Corrosive","Toxic","Tainted","Pure");
    my @Atmo_Comp_Chance = (1,2,5,7,20);
    my @System_Location_List = ("Inner Cauldron","Primary Bioshpere","Outer Reaches");
    my @System_Location_Chance = (2,8,10);
    my @Climate_List = ("Burning World","Hot World","Temperate World","Cold World","Ice World");
    my @Climate_Chance = (0,3,7,10,20);
    my @Hab_List = ("Inhospitable","Trapped Water","Liquid Water","Limited Ecosystem","Verdant");
    my @Hab_Chance = (0,3,7,10,20);
    my @Base_Terrain_List = ("Forest","Mountain","Plains","Swamp","Wasteland");
    my @Forests_List = ("Exotic Nature","Expansive","Extreme Temperature","Notable Species","Unique Compound","Unusual Location","Extra");
    my @Forests_Chance = (5,25,40,65,80,95,100);
    my @Mountain_Ranges_List = ("Boundary","Expansive","Extreme Temperature","Foothills","Notable Species","Unusual Location","Extra");
    my @Mountain_Ranges_Chance = (25,50,65,75,85,95,100);
    my @Plains_List = ("Broken Ground","Expansive","Extreme Temperature","Fertile","Notable Species","Unusual Location","Extra");
    my @Plains_Chance = (10,30,45,70,85,95,100);
    my @Swamps_List = ("Expansive","Extreme Temperature","Notable Species","Stagnant","Unusual Location","Virulent","Extra");
    my @Swamps_Chance = (10,30,45,65,75,95,100);
    my @Wastelands_List = ("Desolate","Expansive","Extreme Temperature","Notable Species","Ruined","Unusual Location","Extra");
    my @Wastelands_Chance = (20,40,70,75,80,95,100);
    my @Terrain_List = (["Exotic Nature","Expansive","Extreme Temperature","Notable Species","Unique Compound","Unusual Location","Extra"],
                        ["Boundary","Expansive","Extreme Temperature","Foothills","Notable Species","Unusual Location","Extra"],
                        ["Broken Ground","Expansive","Extreme Temperature","Fertile","Notable Species","Unusual Location","Extra"],
                        ["Expansive","Extreme Temperature","Notable Species","Stagnant","Unusual Location","Virulent","Extra"],
                        ["Desolate","Expansive","Extreme Temperature","Notable Species","Ruined","Unusual Location","Extra"]);
    #my @Terrain_Chance = (@Forests_Chance,@Mountain_Ranges_Chance,@Plains_Chance,@Swamps_Chance,@Wastelands_Chance);
    my @Terrain_Chance = ([5,25,40,65,80,95,100],[25,50,65,75,85,95,100],[10,30,45,70,85,95,100],[10,30,45,65,75,95,100],[20,40,70,75,80,95,100]);
    my $Ran_Size = int(rand(10))+1;
    my $Ran_Atmo_Pres = int(rand(10))+1;
    my $Ran_System_Location = int(rand(10))+1;
    my $Ran_Climate = int(rand(10))+1;
    my $Ran_Atmo_Comp = int(rand(15))+1;
    my $Ran_Hab = int(rand(10))+1;
    my $Ran_Terr_Num = int(rand(5))+1;
    my $Ran_Mineral_Num = int(rand(5))+1;
    my $Ran_Additional_Num = (int(rand(5))+1) -2;
    my $Ran_Orbital_Num = (int(rand(5))+1) -2;
    ########################## Size
    unless($Planet_Size){
        for(my $i=0; $i<scalar(@Rockey_Size_Chance); $i++){
        	if($Ran_Size <= $Rockey_Size_Chance[$i]){
        		$Planet_Size = "$Rocky_Size_List[$i]";
        		##//Found the Home World, stop the loop.
        		last;
        	}
        }
    }
    print "\n\n\n\nSize: $Planet_Size\n";
    ######################## Location
	for(my $i=0; $i<scalar(@System_Location_Chance); $i++){
		if($Ran_System_Location <= $System_Location_Chance[$i]){
			$System_Location = "$System_Location_List[$i]";
			##//Found the Home World, stop the loop.
			last;
		}
	}
    my $Ran_Gravity = int(rand(10))+1;
    if ($Planet_Size eq "Low-Mass") {
        $Ran_Gravity = $Ran_Gravity - 7;
        $Ran_Terr_Num = $Ran_Terr_Num - 2;
        $Ran_Mineral_Num = $Ran_Mineral_Num - 2;
        $Ran_Additional_Num = $Ran_Additional_Num -1;
    }elsif ($Planet_Size eq "Small") {
        $Ran_Gravity = $Ran_Gravity - 5;
        $Ran_Terr_Num = $Ran_Terr_Num - 2;
        $Ran_Mineral_Num = $Ran_Mineral_Num - 2;
        $Ran_Additional_Num = $Ran_Additional_Num -1;
    }elsif ($Planet_Size eq "Small and Dense") {
        $Ran_Terr_Num = $Ran_Terr_Num - 2;
        $Ran_Mineral_Num = $Ran_Mineral_Num - 2;
        $Ran_Additional_Num = $Ran_Additional_Num -1;
    }elsif ($Planet_Size eq "Large and Dense") {
        $Ran_Gravity = $Ran_Gravity + 5;
    }elsif ($Planet_Size eq "Vast") {
        $Ran_Gravity = $Ran_Gravity + 4;
        $Ran_Terr_Num = $Ran_Terr_Num + 3;
        $Ran_Mineral_Num = int(rand(10))+1;
        $Ran_Additional_Num = $Ran_Additional_Num + 1;
    }
    print "Location: $System_Location\n";
    ######################### Gravity
	for(my $i=0; $i<scalar(@Gravity_Chance); $i++){
		if($Ran_Gravity <= $Gravity_Chance[$i]){
			$Gravity = "$Gravity_List[$i]";
			##//Found the Home World, stop the loop.
			last;
		}
	}
    if ($Gravity eq "Low Gravity") {
        $Ran_Atmo_Pres = $Ran_Atmo_Pres - 2;
        $Ran_Orbital_Num = $Ran_Orbital_Num -1;
    }elsif ($Gravity eq "High Gravity") {
        $Ran_Atmo_Pres = $Ran_Atmo_Pres + 1;
        $Ran_Orbital_Num = $Ran_Orbital_Num + 1;
    }
    print "Gravity: $Gravity\n";
    ################################# Orbital
    my @Orbital_Features_List = ("No Features","Large Asteroid","Lesser Moon","Moon");
    my @Orbital_Features_Chance = (45,60,90,150);
    if ($Ran_Orbital_Num < 1) {$Ran_Orbital_Num = 1;}
    for(my $i=0; $i<$Ran_Orbital_Num; $i++){
        my $Orbital_Feature;
        my $Ran_Orb = int(rand(100))+1;
        if ($Gravity eq "Low Gravity") {$Ran_Orb = $Ran_Orb -10;}
        elsif ($Gravity eq "High Gravity") {$Ran_Orb = $Ran_Orb +10;}
    	for(my $i=0; $i<scalar(@Orbital_Features_Chance); $i++){
            if($Ran_Orb <= $Orbital_Features_Chance[$i]){
                $Orbital_Feature = "$Orbital_Features_List[$i]";
                $i = ((scalar(@Orbital_Features_Chance)) + 1);
            }else{next;}
            if ($Orbital_Feature eq "Lesser Moon") {
                #code
            }
            
        }
    }
    ######################### Atmo
	for(my $i=0; $i<scalar(@Atmo_Pres_Chance); $i++){
		if($Ran_Atmo_Pres <= $Atmo_Pres_Chance[$i]){
			$Atmo_Pres = "$Atmo_Pres_List[$i]";
			##//Found the Home World, stop the loop.
			last;
		}
	}
    unless($Atmo_Pres eq "None"){
        for(my $i=0; $i<scalar(@Atmo_Comp_Chance); $i++){
        	if($Ran_Atmo_Comp <= $Atmo_Comp_Chance[$i]){
        		$Atmo_Comp = "$Atmo_Comp_List[$i]";
        		##//Found the Home World, stop the loop.
        		last;
        	}
        }
    }
    if ($System_Location eq "Inner Cauldron") {
        $Ran_Climate = $Ran_Climate - 6;
    }elsif ($System_Location eq "Outer Reaches") {
        $Ran_Climate = $Ran_Climate + 6;
    }
    if ($Atmo_Comp) {
        print "Atmosphere: $Atmo_Pres $Atmo_Comp\n";
    }else{print "Atmosphere: $Atmo_Pres\n";}
    ######################### Climate
	for(my $i=0; $i<scalar(@Climate_Chance); $i++){
		if($Ran_Climate <= $Climate_Chance[$i]){
			$Climate = "$Climate_List[$i]";
			##//Found the Home World, stop the loop.
			last;
		}
	}
    print "Climate: $Climate\n";
    ######################### Hab
    if ($Climate eq "Burning World") {
        $Ran_Hab = $Ran_Hab - 7 ;
    }elsif ($Climate eq "Hot World") {
        $Ran_Hab = $Ran_Hab - 2 ;
    }elsif ($Climate eq "Cold World") {
        $Ran_Hab = $Ran_Hab -2 ;
    }elsif ($Climate eq "Ice World") {
        $Ran_Hab = $Ran_Hab -7 ;
    }   
	for(my $i=0; $i<scalar(@Hab_Chance); $i++){
		if($Ran_Hab <= $Hab_Chance[$i]){
			$Habitability = "$Hab_List[$i]";
			##//Found the Home World, stop the loop.
			last;
		}
	}
    if ($Ran_Hab <= 5) {
        my $Ran_Exotic = int(rand(4))+1;
        if ($Ran_Exotic == 1) {
            $Habitability .= "(Exotic Life)";
        }
        
    }
    print "Habitability: $Habitability\n";
    ##################### Territories
    if ($Habitability eq "Verdant") {
        $Ran_Terr_Num = $Ran_Terr_Num + 2 ;
    }
    if ($Ran_Terr_Num < 1) {
        $Ran_Terr_Num = 1;
    }
    
    print "Ran_Terr_Num :$Ran_Terr_Num\n";
	for(my $i=0; $i<$Ran_Terr_Num; $i++){
        my $Ran_Terr = int(rand(@Base_Terrain_List));
        my $Ran_Terr_Prop = int(rand(100))+1;
        my $Base_Terrain = $Base_Terrain_List[$Ran_Terr];  
    	for(my $i=0; $i< 7 ; $i++){
            if($Ran_Terr_Prop <= $Terrain_Chance[$Ran_Terr][$i]){
                my $Terrian_Desc = $Terrain_List[$Ran_Terr][$i];
                if ($Terrian_Desc eq "Extra") {
                    my $Terrian_Desc_One;
                    my $Terrian_Desc_Two;
                    my $Ran_Terr_Prop_One = int(rand(95))+1;
                    for(my $k=0; $k< 7 ; $k++){
                        if($Ran_Terr_Prop_One <= $Terrain_Chance[$Ran_Terr][$k]){
                            $Terrian_Desc_One = "$Terrain_List[$Ran_Terr][$k]";
                            $k = 100;
                        }
                    }
                    my $Ran_Terr_Prop_Two = int(rand(95))+1;
                    for(my $j=0; $j< 7 ; $j++){
                        if($Ran_Terr_Prop_Two <= $Terrain_Chance[$Ran_Terr][$j]){
                            $Terrian_Desc_Two = "$Terrain_List[$Ran_Terr][$j]";
                            $j = 100;
                        }
                    }
                    while ($Terrian_Desc_One eq $Terrian_Desc_Two) {
                        my $Ran_Terr_Prop_Two = int(rand(95))+1;
                        for(my $j=0; $j< 7 ; $j++){
                            if($Ran_Terr_Prop_Two <= $Terrain_Chance[$Ran_Terr][$j]){
                                $Terrian_Desc_Two = "$Terrain_List[$Ran_Terr][$j]";
                                $j = 100;
                            }
                        }                        
                    }
                    $Terrian_Desc = "$Terrian_Desc_One, $Terrian_Desc_Two"
                    
                }
                
            	$Territories .= "$Base_Terrain ($Terrian_Desc)\n";
            	##//Found the Home World, stop the loop.
            	last;
            }
        }
	}
    print "Territories:\n$Territories\n";
    
    ############################## Resources ##########################
    my @Resource_Output;
    my @Mineral_Resources_List =("Industrial Metal","Ornamental","Radioactive","Exotic Material");
    my @Mineral_Resources_Chance =(4,7,9,10);
    my @Additional_Resources_List = ("Archeotech Cache","Minerals","Organic Compound","Xenos Ruins");
    my @Additional_Resources_Chance = (2,6,8,10);
    my @Resource_Abundance_List = ("Minimal","Limited","Sustainable","Significant","Major","Plentiful");
    my @Resource_Abundance_Chance = (15,40,65,85,98,150);
    my @Organic_Resources_List =("Curative","Juvenat Compound","Toxin","Vivid Accessory","Exotic Compound");
    my @Organic_Resources_Chance =(2,4,6,9,10);
    my @Xeno_Ruins_List = ("Undiscovered Species","Minor Species","Necron","Tau","Eldar","Egarian","Yu'Vath","Ork","Kroot","Other Federation");
	print "Add Resources: $Ran_Additional_Num\n";
	print "Min Resources: $Ran_Mineral_Num\n";
    if ($Ran_Mineral_Num < 0) {
        $Ran_Mineral_Num = 0;
    }
    for(my $i=0; $i<$Ran_Additional_Num; $i++){
        my $Resource;
        my $Ran_Add = int(rand(10))+1;
    	for(my $i=0; $i<scalar(@Additional_Resources_Chance); $i++){
            if($Ran_Add <= $Additional_Resources_Chance[$i]){
                $Resource = "$Additional_Resources_List[$i]";
                $i = ((scalar(@Additional_Resources_Chance)) + 1);
            }else{next;}
        if ($Resource eq "Minerals") {
            $Ran_Mineral_Num = $Ran_Mineral_Num +1;
        }elsif($Resource eq "Organic Compound"){
            my $Ran_Org = int(rand(10))+1;
            for(my $i=0; $i<scalar(@Organic_Resources_List); $i++){
                if($Ran_Org <= $Organic_Resources_Chance[$i]){
                    push @Resource_Output, "$Resource($Organic_Resources_List[$i])";
                    $i = ((scalar(@Organic_Resources_List)) + 1);
                }
            }            
        }elsif($Resource eq "Xenos Ruins"){
            my $Resource_XR = $Xeno_Ruins_List[int(rand(@Xeno_Ruins_List))];
            push @Resource_Output, "$Resource($Resource_XR)";
        }elsif($Resource eq "Archeotech Cache"){
            push @Resource_Output, "$Resource";            
        }
        }
	}
	for(my $i=0; $i<$Ran_Mineral_Num; $i++){
        my $Resource;
        my $Ran_Mineral = int(rand(10))+1;
    	for(my $i=0; $i<scalar(@Mineral_Resources_Chance); $i++){
            if($Ran_Mineral <= $Mineral_Resources_Chance[$i]){
                $Resource = "$Mineral_Resources_List[$i]";
                $i = ((scalar(@Mineral_Resources_Chance)) + 1);
                push @Resource_Output, "Minerals($Resource)";
            }
		}
    }
    foreach (@Resource_Output){
        my $Abundance;
        my $Ran_Abundance = int(rand(100))+1;
        if ($Planet_Size eq "Low-Mass" && $Ran_Abundance >= 40 && $_ =~ /Minerals/) {
            $Ran_Abundance = 40;
        }elsif($Planet_Size eq "Small and Dense" || $Planet_Size eq "Large and Dense" && $_ =~ /^Minerals/){
            $Ran_Abundance = $Ran_Abundance + 10;            
        }
        
    	for(my $i=0; $i<scalar(@Resource_Abundance_Chance); $i++){
            if($Ran_Abundance <= $Resource_Abundance_Chance[$i]){
                $Abundance = "$Resource_Abundance_List[$i]";
                $i = ((scalar(@Resource_Abundance_Chance)) + 1);
                $_ .= "[$Abundance($Ran_Abundance)]";
                print "$_\n";
            }
		}        
    }
    #print "@Resource_Output";    
}
sub Customs_Generation{
    print "\nCustoms\n";
    ############################## Culture Quirks ######################
    #note there is a difference between * and **
    my @Culture_Quirks;
    my @Culture_Quirks_List =("Dressing Habits","Eating Habits","Living Quarters","Family Practices","Miscellaneous Customs 1","Miscellaneous Customs 2");
    my @Dressing_Quirks_List =("Same clothes for all sexes","Unusual clothes*","Unusual clothes*","Unusual clothes*","Unusual headgear*","Unusual headgear*","Shaved heads*","Shaved heads*",
                               "Hair never cut*","Hair never cut*","Unusual hair colour*","Unusual hair colour*","Unusual hairdos*","Unusual hairdos*","Unusual hairdos*","Unusual eyebrows*",
                               "Unusual facial alterations*","Unusual body alterations*","Unusual fingernails*","Unusual fingernails*","Unusual toenails*","Unusual toenails*","Unusual cosmetics*",
                               "Unusual cosmetics*","Unusual cosmetics*","Unusual jewelery*","Unusual jewelery*","Unusual jewelery*","Unusual accessories*","Unusual accessories*",
                               "Unusual handgear*","Unusual handgear*","Tatooing on face*","Tatooing on body*","Tatooing on body*","Hidden tatooing");
    my @Eating_Habits_Quirks_List =("Unusual foods*","Unusual foods*","Unusual beverages*","Unusual beverages*","Unusual food preparation*","Unusual food preparation*","Segregated during meals*",
                                    "Segregated during meals*","Vegetarians*","Vegetarians*","Carnivorous*","Carnivorous*","Omnivorous*","Omnivorous*","Certain coloured food taboo*",
                                    "Certain coloured food taboo*","Certain shaped food taboo*","Certain food sources taboo*","Eat in special location*","Eat only in private*",
                                    "Eat in special orientation*","Eat with unusual utensils","Eat only at home*","Eat only at home*","Eat at unusual times*","Eat at unusual times*",
                                    "Eat only at certain times*","Eat only certain ways*","Rituals before eating*","Rituals after eating*","One sex eats other's leftovers",
                                    "One age eats other's leftovers","One group eats other's leftovers**","One class eats other's leftovers","One race eats other's leftovers","Cannibalistic*");
    my @Living_Quarters_Quirks_List =("Live privately*","Live privately*","Live apart in groups*","Live apart in groups*","Live in special locations*","Live in special locations*",
                               "Live at place of work*","Live at place of work*","Live at place of work*","Live under special conditions*","Live under special conditions*","Confined to quarters*",
                               "Live under special care*","Have extravagant quarters*","Have extravagant quarters*","Have minimal quarters*","Have minimal quarters*","Have minimal quarters*",
                               "Have unusual quarters*","Have unusual quarters*","Quarters are taboo**","Quarters are taboo**","Quarters are taboo**",,"Quarters must be visited**",
                               "Quarters must be visited**","Quarters must be visited**","Live with extended families*","Live with groom's family*","Live with brides family*",
                               "Live with children's family*","Live with relatives*","Live in communal housing*","Live in communal housing*","Live in communal housing*",
                               "Live only in certain terrain*","Must move around*");
    my @Family_Practices_Quirks_List =("Child named by*","Child named for living realtive","Child named for dead realtive","Child named for hero","Child named for*","Child named for object",
                                       "child renamed at adulthood","child renamed when marries","Marriage arranged by*","Marriage performed by*","Marriage arranged by parents",
                                       "Marriage arranged by parents","Marriage performed by parents","Marriage only within group*","Remarriage prohibited*","Remarriage required*",
                                       "Groom's family pays dowery*","Groom's family pays dowery*","Dowery paid by outsider*","Very short marriages the rule*","Very long marriages the rule*",
                                       "None-marriage the rule*","Very short marriages prohibited*","Very long marriages prohibited*","Non-marriage prohibited*","Divorce and remarriage required*",
                                       "Widow must marry husband's relative*","Widow/Widower must commit suicide*","Widower must marry wife's relative*","Onerous prerequisite to marriage*",
                                       "Onerous prerequisite to marriage*","Marriage only at certian times*","Marriage must be blessed by*","Polyandry practiced*",
                                       "Polygyny practiced*","Communal polygamy practiced*");
    my @Miscellaneous_Customs_1_Quirks_List =("Unusual sleep location*","Unusual sleep time*","Unusual sleep duration*","Unusual sleep orientation*","Special language for*","Sacred symbols for*",
                                              "Unusual duties for*","Anonimity required for*","Drinking/drugs prohibited*","Drinking/drugs required*","Bodily abuse prohibited*",
                                              "Bodily abuse required*","Special privileges for*","Special privileges for*","Special privileges prohibited*","Unusual greetings*","Unusual greetings*",
                                              "Unusual mannerisms for*","Unusual leavetakings*","Unusual secret societies*","Closed meetings taboo*","Psionics allowed for*",
                                              "Psionics mean instant death*","Cloning allowed for*","Cloning required for*","Cloning prohibited for*","Robots allowed for*","Robots required for*",
                                              "Robots prohibited for*","High-tech allowed for*","High-tech required for*","High-tech prohibited for*","Offworld contact allowed for*",
                                              "Offworld contact required for*","Offworld contact prohibited for*","Unusual gift-giving customs*");
    my @Miscellaneous_Customs_2_Quirks_List =("Free food/clothing required for*","Free food/clothing prohibited for*","Free education required for*","Free education prohibited for*",
                                              "Unusual punishment required for*","Unusual punishment prohibited for*","Usual training required for*","Usual training prohibited for*",
                                              "Unusual responsibilites*","Fixed times for visiting*","Bargaining/haggling required*","Bargaining/haggling prohibited*","Travelling far away required*",
                                              "Travelling far away prohibited*","Unusual holidays for*","No holidays for*","Unusual leasure/recreation*","Regimented leasure/recreation*",
                                              "Unusual maturity ceremony*","Unusual attitudes toward*","Unusual significance of flora*","Unusual significance of fauna*","Unusual significance of smell*",
                                              "Unusual significance of sound*","Unusual significance of colour*","Unusual significance of air*","Unusual significance of water*",
                                              "Unusual significance of light*","Unusual significance of clothing*","Unusual significance of computers*","Unusual significance of technology*",
                                              "Unusual significance of robots*","Unusual significance of art*","Unusual significance of superstition*","Daytime (siesta) rest period required*",
                                              "Daytime (siesta) rest period prohibited*");
    my @Practicing_Group = ("Certian political groups","Certian political groups","Certian geographic regions","Certian geographic regions","Certian sex","Certian sex","Certian sex","Enforcement figures",
                            "Entertainment figures","Heroic figures","athletic figures","Certian races","Certian races","Certian races","Religious figures","Religious figures","Military figures",
                            "Military figures","Certain occupations","Certain occupations","Political figures","Political figures","Medical figures","Medical figures","Certain age groups",
                            "Certain age groups","Scientific figures","Scientific figures","Academic figures","Academic figures","Low social class","Low social class","High social class",
                            "High social class","Convicted criminals","Convicted criminals");
    
    my $Customs_Quirks_Nums = int(rand(6))+1;
    #print "$Customs_Quirks_Nums\n";
    for(my $Q=0; $Q< $Customs_Quirks_Nums ; $Q++){
        my $Culture_Quirk = $Culture_Quirks_List[int(rand(6))];
        #print "$Culture_Quirk\n";
            if ($Culture_Quirk eq "Dressing Habits") {
                push @Culture_Quirks, $Dressing_Quirks_List[int(rand(@Dressing_Quirks_List))];
            }
            if ($Culture_Quirk eq "Eating Habits") {
                push @Culture_Quirks, $Eating_Habits_Quirks_List[int(rand(@Eating_Habits_Quirks_List))];
            }
            if ($Culture_Quirk eq "Living Quarters") {
                push @Culture_Quirks, $Living_Quarters_Quirks_List[int(rand(@Living_Quarters_Quirks_List))];
            }
            if ($Culture_Quirk eq "Family Practices") {
                push @Culture_Quirks, $Family_Practices_Quirks_List[int(rand(@Family_Practices_Quirks_List))];
            }
            if ($Culture_Quirk eq "Miscellaneous Customs 1") {
                push @Culture_Quirks, $Miscellaneous_Customs_1_Quirks_List[int(rand(@Miscellaneous_Customs_1_Quirks_List))];
            }
            if ($Culture_Quirk eq "Miscellaneous Customs 2") {
                push @Culture_Quirks, $Miscellaneous_Customs_2_Quirks_List[int(rand(@Miscellaneous_Customs_2_Quirks_List))];
            }
    }
    foreach(@Culture_Quirks){
        if($_ =~/\*{1}/){
            chop $_;
            if ( 3 <(int(rand(6))+1)) {
                $_ .= ", ".$Practicing_Group[int(rand(@Practicing_Group))];
            }else{
                $_ .= ", Everyone";
            }
        }
        if($_ =~/\*{2}/){
            chop $_;
            chop $_;
            if ( 3 <(int(rand(6))+1)) {
                $_ .= ", ".$Practicing_Group[int(rand(@Practicing_Group))];
            }else{
                $_ .= ", Everyone";
            }
            if ( 3 <(int(rand(6))+1)) {
                $_ .= ", ".$Practicing_Group[int(rand(@Practicing_Group))];
            }else{
                $_ .= ", Everyone";
            }
        }
    }
    print "$_\n" for @Culture_Quirks;
}

