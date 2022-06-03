#!/bin/bash

if [ $HOSTNAME == "BATOCERA" ]; then
	ESOS="batocera"
	LC_PATH="/usr/share/locale/ko/LC_MESSAGES"
	THEME_PATH="/userdata/themes"
	BIOS_PATH="/userdata/bios"
	RES_PATH="/usr/share/emulationstation/resources"
	PSPFONT_PATH="/usr/share/ppsspp/PPSSPP/flash0/font"

elif [ $HOSTNAME == "ANBERNIC" ]; then
	ESOS="anbernic"
	LC_PATH="/usr/share/locale/ko/LC_MESSAGES"
	THEME_PATH="/userdata/themes"
	BIOS_PATH="/userdata/bios"
	RES_PATH="/usr/share/emulationstation/resources"
	PSPFONT_PATH="/usr/share/ppsspp/PPSSPP/flash0/font"

elif [ $HOSTNAME == "EMUELEC" ]; then
	ESOS="emuelec"
	LC_PATH="/storage/.config/emuelec/configs/locale/ko/LC_MESSAGES"
	THEME_PATH="/storage/.config/emulationstation/themes"
	BIOS_PATH="/storage/roms/bios"
	RES_PATH="/storage/.config/emulationstation/resources"
	PSPFONT_PATH="/storage/.config/ppsspp/assets/flash0/font"

elif cat /etc/*release | grep AmberELEC >/dev/null; then
	ESOS="amberelec"
	LC_PATH="/storage/.config/emulationstation/locale/ko/LC_MESSAGES"
	THEME_PATH="/storage/.config/emulationstation/themes"
	BIOS_PATH="/storage/roms/bios"
	RES_PATH="/storage/.config/emulationstation/resources"
	PSPFONT_PATH="/storage/roms/gamedata/ppsspp/assets/flash0/font"

elif cat /etc/*release | grep JELOS >/dev/null; then
	ESOS="jelos"
	LC_PATH="/storage/.config/emulationstation/locale/ko/LC_MESSAGES"
	THEME_PATH="/storage/.config/emulationstation/themes"
	BIOS_PATH="/storage/roms/bios"
	RES_PATH="/storage/.config/emulationstation/resources"
	PSPFONT_PATH="/storage/.config/ppsspp/assets/flash0/font"

elif [ -d /home/ark ]; then
	ESOS="arkos"
	LC_PATH="/usr/bin/emulationstation/resources/locale/ko"
	THEME_PATH="/roms/themes"
	BIOS_PATH="/roms/bios"
	RES_PATH="/usr/bin/emulationstation/resources"
	PSPFONT_PATH="/opt/ppsspp/assets/flash0/font"

else
	echo "This operating system is not supported."
	exit 0
fi

TEMP="ddccpp"
VER="1.0.4"
HEIGHT=18
WIDTH=60
SEL_HEIGHT=12
BACKTITLE="DDCCPP ${VER} - ${ESOS^^}"
TITLE=""
MENU="Choose one of the following options"
VTC=("4in1" "005" "8ball" "8ball1" "8ballact" "8ballat2" "8bpm" "19xx" "19xxa" "19xxar1" "19xxb" "19xxd" "19xxh" "19xxj" "19xxjr1" "19xxjr2" "19xxu" "20pacgal" "20pacgalr0" "20pacgalr1" "20pacgalr2" "20pacgalr3" "20pacgalr4" "25pacman" "25pacmano" "99lstwar" "99lstwara" "99lstwarb" "99lstwark" "99lstwra" "600" "800fath" "800fatha" "1941" "1941j" "1941r1" "1941u" "1942" "1942a" "1942abl" "1942b" "1942c64" "1942h" "1942w" "1943" "1943b" "1943b2" "1943bj" "1943j" "1943ja" "1943jah" "1943kai" "1943mii" "1943u" "1943ua" "1945kiii" "1945kiiin" "1945kiiio" "aafb" "aafbb" "aafbc" "aafbd2p" "abscam" "aceattac" "aceattaca" "acitya" "acrobatm" "ad2083" "aerofgt" "aerofgtb" "aerofgtc" "afighter" "afightera" "afighterb" "afighterc" "afighterd" "afightere" "afighterf" "afighterg" "afighterh" "agallet" "agalleta" "agalletah" "agalletaj" "agalletak" "agalletat" "agalletau" "agalleth" "agalletj" "agalletk" "agallett" "agalletu" "airass" "airattck" "airattcka" "airduel" "airduelm72" "airraid" "ajax" "ajaxj" "akkanvdr" "alcon" "alibaba" "alibabab" "alieninv" "alienres" "alinvade" "alleymas" "alphaho" "alphamis" "alphaxz" "alpine" "alpinea" "amatelas" "amazon" "amazont" "amidar" "amidar1" "amidarb" "amidaro" "amidars" "amidaru" "amigo" "androidp" "androidpo" "andromed" "angelkds" "anteater" "anteaterg" "anteateruk" "apb" "apb1" "apb2" "apb3" "apb4" "apb5" "apb6" "apbf" "apbg" "aponow" "arabian" "arabiana" "aracnis" "arbalest" "arcadia" "arcadian" "argus" "arian" "ark1ball" "ark1balla" "arkangc" "arkangc2" "arkanoid" "arkanoidj" "arkanoidja" "arkanoidjb" "arkanoidjbl" "arkanoidjbl2" "arkanoidjbla" "arkanoidu" "arkanoiduo" "arkatayt" "arkatour" "arkbl2" "arkbl3" "arkbloc2" "arkblock" "arkgcbl" "arknid2j" "arknid2u" "arknoid2" "arknoid2b" "arknoid2j" "arknoid2u" "arknoidj" "arknoidu" "arknoiuo" "arktayt2" "armedf" "armedff" "armorca2" "armorcar" "armorcar2" "ashura" "ashuraj" "ashurau" "asideral" "aso" "assault" "assaultj" "assaultp" "astinvad" "astrians" "astrob" "astrob1" "astrob2" "astrof" "astrof2" "astrof3" "asuka" "asukaj" "asylum" "atetckt2" "atetcktl" "atetrisc" "atetrisc2" "atlantis" "atlantis2" "atlantisb" "atlants2" "avefenix" "avefenixl" "avefenixrf" "avenger2" "avengers" "avengers2" "azurian" "bagman" "bagmanj" "bagmanm2" "bagmanmc" "bagmans" "bagmans2" "bagnard" "bagnarda" "bagnardi" "bakubrkr" "ballbomb" "baluba" "bandido" "barrier" "baryon" "baryona" "batman2" "batrider" "batriderc" "batriderhk" "batriderj" "batriderja" "batriderk" "batridert" "batrideru" "batridra" "batridrk" "batsugun" "batsuguna" "batsugunb" "batsugunsp" "battlan2" "battlan3" "battlane" "battlane2" "battlane3" "battleg" "battlega" "battlegb" "battles" "battlntj" "battlnts" "battlntsa" "battlntsj" "battroad" "batugnsp" "batwings" "bbakradu" "bbakraid" "bbakraidc" "bbakraidj" "bbakraidja" "bcruzm12" "beaminv" "beastf" "beastfp" "beezer" "beezer1" "bermudaa" "bermudao" "bermudat" "bermudata" "bermudatj" "bgaregga" "bgareggabl" "bgareggabla" "bgareggacn" "bgareggahk" "bgaregganv" "bgareggat2" "bgareggatw" "bgareggaz" "bigbang" "bigbucks" "bigevglf" "bigprowr" "bikkuric" "billiard" "bioatack" "birdiy" "birdtry" "birdtrya" "bjtwin" "bjtwina" "bjtwinp" "bjtwinpa" "bking" "bking2" "bking3" "bladestl" "bladestle" "bladestll" "bladstle" "blastoff" "blazer" "blckgalb" "blkbustr" "blkhole" "block" "blocka" "blockbl" "blockcar" "blockgal" "blockj" "blockr1" "blockr2" "blswhstl" "blswhstla" "bluehawk" "bluehawkn" "bluehawn" "blueprnj" "blueprnt" "blueprntj" "bnj" "boggy84" "boggy84b" "bombbee" "bomber" "bombjac2" "bombjack" "bombjack2" "bombjackt" "bongo" "boobhack" "boomrang" "boomranga" "botanic" "botanicf" "bowler" "bowlrama" "brdrlinb" "brickzn" "brickzn3" "brix" "brubber" "brvblade" "btime" "btime2" "btime3" "btimem" "btlfield" "btlfieldb" "bucaner" "buggychl" "buggychlt" "buggycht" "bullfgtr" "buraiken" "buzzard" "bwcasino" "bwing" "bwings" "bwingsa" "bwingso" "cadanglr" "cairblad" "calibr50" "calipso" "cannballv" "cannonb" "cannonbp" "capbowl" "capbowl2" "capbowl3" "capbowl4" "capitol" "caractn" "carjmbre" "carnival" "carnivalc" "carnvckt" "castfant" "catacomb" "catapult" "cavelon" "cbdash" "cbnj" "cbtime" "cburnrb2" "cburnrub" "cburnrub2" "cchasm" "cchasm1" "cdiscon1" "cdsteljn" "cencourt" "centipb2" "centipd2" "centipdb" "centiped" "centiped3" "centtime" "cexplore" "cfboy0a1" "cfghtice" "cfishing" "cflyball" "cgraplop" "cgraplop2" "cgraplp2" "chamburger" "chanbara" "checkmaj" "checkman" "checkmanj" "cheekyms" "chewing" "chinher2" "chinhero" "chkun" "chopper" "choppera" "chopperb" "chqflag" "chqflagj" "chwy" "circusc" "circusc2" "circusc3" "circusc4" "circuscc" "circusce" "citybmrj" "citybomb" "citybombj" "ckong" "ckonga" "ckongalc" "ckongg" "ckongjeu" "ckongmc" "ckongo" "ckongs" "clapapa" "clapapa2" "clbowl" "clocknch" "clocknchj" "clubpacm" "cluckypo" "cmanhat" "cmissnx" "cnights2" "cnightst" "cnightst2" "cocean1a" "cocean6b" "colony7" "colony7a" "combh" "commandj" "commando" "commandob" "commandob2" "commandob3" "commandoj" "commandou" "commandou2" "commandu" "commsega" "complexx" "condor" "condorn" "congo" "congoa" "contra" "contra1" "contrab" "contrabj" "contrabj1" "contrae" "contraj" "contraj1" "contrajb" "cookrace" "coozumou" "cosmica" "cosmica2" "cosmicg" "cosmicmo" "cosmo" "cosmogng" "cosmognj" "cosmos" "cottong" "cppicf" "cppicf2" "cprobowl" "cprogolf" "cprogolf18" "cprogolfj" "cprosocc" "cpsoccer" "cpsoccerj" "cptennis" "cptennisj" "crazyblk" "crazycop" "crbalon2" "crbaloon" "crbaloon2" "crockman" "crockmnf" "crshrac2" "crshrace" "crshrace2" "crush" "crush2" "crush3" "crush4" "crush5" "crushbl" "crushbl2" "crushbl3" "crushs" "crzrally" "crzrallya" "crzrallyg" "cscrtry" "cscrtry2" "csdtenis" "cshooter" "cshootre" "cskater" "csuperas" "csweetht" "cterrani" "ctisland" "ctisland2" "ctisland3" "ctislnd2" "ctislnd3" "ctornado" "ctrpllrp" "ctsttape" "curvebal" "cutieq" "cybattlr" "cyclshtg" "cyvern" "cyvernj" "czeroize" "daioh" "daioha" "daiohc" "daiohp" "daisenpu" "dambustr" "dambustra" "dambustruk" "dangar" "dangar2" "dangara" "dangarb" "dangarbt" "dangarj" "dangseed" "darkmist" "darkwar" "darwin" "dazzler" "dblewing" "ddaydoo" "ddayjlc" "ddayjlca" "ddonpach" "ddonpacha" "ddonpachj" "ddonpchj" "ddp2" "ddp2c" "ddp2hk" "ddp2j" "ddp2k" "ddp2t" "ddp3" "ddp2100" "ddp2100c" "ddp2100hk" "ddp2100j" "ddp2100k" "ddp2100t" "ddp2101" "ddp2101c" "ddp2101hk" "ddp2101j" "ddp2101k" "ddp2101t" "ddpdoj" "ddpdoja" "ddpdojb" "ddpdojblk" "ddpdojblka" "ddpdojblkbl" "dealer" "decocass" "decomult" "demoneye" "desertbr" "desertbrd" "desertbrj" "desertbrjd" "desertwr" "desterth" "detatwin" "devilfsg" "devilfsh" "devstor2" "devstor3" "devstors" "devstors2" "devstorsv" "devstorsx" "devzone" "devzone2" "dfeveron" "digdug" "digdug2" "digdug2o" "digduga1" "digdugat" "digdugb" "digger" "dimahoo" "dimahoou" "dimahoud" "dingo" "dirtfoxj" "disco" "discof" "divebomb" "dkcbarrel" "dkchrmx" "dkingjr" "dkngjnrb" "dkngjnrj" "dkong" "dkong3" "dkong3b" "dkong3j" "dkongf" "dkonghrd" "dkongj" "dkongjnrj" "dkongjo" "dkongjo1" "dkongjp" "dkongjr" "dkongjr2" "dkongjrb" "dkongjrj" "dkongjrm" "dkongo" "dkongp" "dkongpac" "dkongpe" "dkongrev" "dkongx" "dkongx11" "dkpace" "dkrainbow" "dkrdemo" "dkspkyrmx" "dktrainer" "docastl2" "docastle" "docastlo" "dockman" "dogfight" "dogosokb" "dogosoke" "dogyuun" "dogyuuna" "dogyuunt" "dommy" "donight" "donpachi" "donpachihk" "donpachij" "donpachikr" "donpachj" "donpachk" "dorachan" "dorodon" "dorodon2" "douni" "downtown" "downtown2" "downtownj" "downtownp" "dragnblz" "drakton" "dremshpr" "driftout" "driftoutj" "driveout" "drivfrcb" "drivfrcg" "drivfrcp" "drivfrct" "drktnjr" "drmicro" "drtoppel" "drtoppela" "drtoppelj" "drtoppelu" "drtopplj" "drtopplu" "dsaber" "dsabera" "dsaberj" "dspirit" "dspirit1" "dspirit2" "dspirito" "dualaslt" "dyger" "dygera" "dynamski" "dynobop" "dzigzag" "eagle" "eagle2" "eagle3" "earthinv" "earthjkr" "earthjkra" "earthjkrp" "eeekk" "eeekkp" "efdt" "eggor" "eggs" "eightfrc" "elecyoy2" "elecyoyo" "elecyoyo2" "enigma2" "enigma2a" "equites" "equitess" "espgal" "espgalbl" "esprade" "espradej" "espradejo" "espradeo" "evilston" "excthour" "exctscc2" "exctscca" "exctsccb" "exctsccr" "exedexes" "exerion" "exerionb" "exeriont" "exerizer" "exerizerb" "exerizrb" "exodus" "explbrkr" "explbrkrk" "explorer" "extrmatn" "extrmatnj" "extrmatnu" "extrmatnur" "eyes" "eyes2" "eyesb" "eyeszacb" "f1gp" "f1gp2" "fa" "falcon" "falconz" "fantasia" "fantasiaa" "fantasiab" "fantasian" "fantastc" "fantasy" "fantasyg" "fantasyg2" "fantasyj" "fantasyu" "fantazia" "fantsy95" "fastfred" "fastlane" "fcombat" "fenix" "fenixn" "feversos" "fghtatck" "fhawk" "fhawkj" "fightrol" "finalizb" "finalizr" "finalizra" "finalizrb" "firebarr" "firebatl" "fireshrk" "fireshrka" "fireshrkd" "fireshrkdh" "firetpbl" "firetrap" "firetrapa" "firetrapbl" "firetrapj" "firetrk" "fitter" "fitterbl" "fixeight" "fixeighta" "fixeightat" "fixeighth" "fixeightht" "fixeightj" "fixeightjt" "fixeightk" "fixeightkt" "fixeightt" "fixeighttw" "fixeighttwt" "fixeightu" "fixeightut" "flipjack" "flkatck" "flkatcka" "flyboy" "flyboyb" "flytiger" "flytigera" "fnkyfish" "fnshark" "freekckb" "freekick" "freekicka" "freekickb1" "freekickb3" "freeze" "frogf" "frogg" "frogger" "froggermc" "froggers" "froggers1" "froggers2" "froggers3" "froggrmc" "froggrs" "frogseg1" "frogseg2" "frontlin" "fshark" "fsharkbt" "fspiderb" "fstarfrc" "fstarfrcj" "funkybee" "funkybeeb" "funnymou" "futspy" "fx" "gaiapols" "gaiapolsj" "gaiapolsu" "galag88b" "galag88j" "galaga" "galaga3" "galaga3a" "galaga3b" "galaga3c" "galaga3m" "galaga84" "galaga88" "galaga88a" "galaga88j" "galagab2" "galagads" "galagamf" "galagamk" "galagamw" "galagao" "galap1" "galap4" "galapx" "galaxbsf" "galaxiaj" "galaxian" "galaxiana" "galaxianbl" "galaxiani" "galaxianm" "galaxianmo" "galaxiant" "galaxrcgg" "galaxrf" "galaxrfgg" "galaxygn" "galemp" "galivan" "galivan2" "galivan3" "gallag" "galmedes" "galmidw" "galmidwo" "galpani2" "galpanib" "galpanic" "galspnbl" "galturbo" "galxwar2" "galxwars" "galxwart" "gametngk" "gangonta" "gaplus" "gaplusa" "gaplusd" "gapluso" "gaplust" "gardia" "gardiab" "garuka" "gatsbee" "gbusters" "gbustersa" "gcpinbal" "geebee" "geebeea" "geebeeb" "geebeeg" "gekiridn" "gekiridnj" "gekirido" "gemini" "geminib" "geminij" "gground" "ggroundj" "ghostmun" "ghox" "ghoxj" "ghoxjo" "gigas" "gigasb" "gigasm2" "gigasm2b" "gmahou" "gmgalax" "gnbarich" "goindol" "goindolj" "goindolu" "goldbug" "gomoku" "gondo" "gorf" "gorfpgm1" "gorkans" "gotya" "grasspin" "grchamp" "grdnstrm" "grdnstrmg" "grdnstrmj" "grdnstrmk" "grdnstrmv" "greenber" "grescue" "griffon" "grindsta" "grindstm" "grindstma" "grobda" "grobda2" "grobda3" "gryzor" "gryzor1" "gseeker" "gseekerj" "gseekeru" "gteikob2" "gteikokb" "gteikoku" "gteikokub" "gteikokub2" "gulfstr2" "gulfstrm" "gulfstrma" "gulfstrmb" "gulfstrmk" "gulfstrmm" "gulfwar2" "gulfwar2a" "gunball" "gunbird" "gunbird2" "gunbird2a" "gunbirdj" "gunbirdk" "gundeala" "gundealr" "gundealt" "gundhara" "gundharac" "gunfronj" "gunfront" "gunfrontj" "gunlock" "gunnail" "gunnailp" "gunsmoka" "gunsmoke" "gunsmokeb" "gunsmokej" "gunsmokeu" "gunsmokeua" "gunsmokeub" "gunsmokj" "gunsmoku" "gutangtn" "guwange" "guwanges" "guzzler" "gwar" "gwara" "gwarb" "gwarj" "gyrodine" "gyrodinet" "gyruss" "gyrussb" "gyrussce" "hal21" "hal21j" "halleycj" "halleys" "halleysc" "hamaway" "hangly" "hangly2" "hangly3" "hbarrel" "hbarrelu" "hbarrelw" "headonn" "heartatk" "heiankyo" "helifira" "helifire" "herbiedk" "hero" "herodk" "herodku" "hexpool" "hexpoola" "himesiki" "hishouza" "hncholms" "hoccer" "hoccer2" "homo" "hopprobo" "horekid" "horekidb" "horshoes" "hotdogst" "hotpinbl" "hotshock" "hotshockb" "hotsmash" "hstenn10" "hstennis" "hunchbak" "hunchbkd" "hunchbkg" "hunchbks" "huncholy" "hustler" "hustlerb" "hwrace" "hyhoo" "hyhoo2" "igmo" "ikari" "ikaria" "ikaria2" "ikarijp" "ikarijpb" "ikarinc" "ikariram" "imago" "imagoa" "imgfight" "imgfightj" "intrepi2" "intrepid" "intrepid2" "intrepidb" "intrepidb2" "intrepidb3" "invad2ct" "invaddlx" "invaderl" "invaders" "invadpt2" "invds" "invho2" "invinco" "invrvnga" "invrvnge" "ipminvad" "ixion" "jack" "jack2" "jack3" "jackal" "jackalbl" "jackalj" "jackalr" "jackrab2" "jackrabs" "jackrabt" "jcross" "jin" "jjack" "joinem" "jollyjgr" "josvolly" "journey" "joust2" "joyfulr" "joyman" "jrking" "jrpacman" "jrpacmanf" "jspecter" "jspectr2" "jumpbug" "jumpbugb" "jumpcoas" "jumpcoasa" "jumpcoast" "jumpkun" "jumpshot" "jumpshotp" "jungler" "junglers" "junofrst" "junofrstg" "junofstg" "kageki" "kagekih" "kagekij" "kagekiu" "kaitei" "kaitein" "kamakazi3" "kamikaze" "kamikazesp" "kamikcab" "kangaroa" "kangarob" "kangaroo" "kangarooa" "kangaroob" "kaos" "karatedo" "karatevs" "kchamp" "kchampvs" "kchampvs2" "kchampvs3" "kchampvs4" "ket" "ket1" "keta" "ketarr" "ketarr10" "ketarr15" "ketarr151" "ketarrf" "ketarrs15" "ketarrs151" "ketb" "ketbl" "kick" "kicka" "kickc" "kicker" "kickman" "kikikai" "kingbalj" "kingball" "kingballj" "kingdmgp" "kingofb" "kingofbj" "knightb" "knockout" "kong" "kong2600" "kopunch" "korosuke" "krull" "krzybowl" "ktiger" "ktiger2" "kuhga" "kyros" "kyrosj" "labyrunk" "labyrunr" "labyrunrk" "ladybug" "ladybugb" "ladybugb2" "ladybugg" "ladyfrog" "ladykill" "ladymstr" "ladymstr2" "lagirl" "lagunar" "laser" "lasso" "lastday" "lastdaya" "lastduel" "lastduelb" "lastduelj" "lastduelo" "lastmisn" "lastmisnj" "lastmisnu5" "lastmisnu6" "lastmsnj" "lastmsno" "leds2011" "leds2011u" "ledstorm" "legion" "legionj" "legionjb" "legiono" "legofair" "lethalth" "levers" "lgtnfght" "lgtnfghta" "lgtnfghtu" "liberatb" "liberate" "lizwiz" "lnc" "locoboot" "locomotn" "logger" "looping" "loopinga" "losttmbh" "losttomb" "losttombh" "loverboy" "lrescue" "lsasquad" "lstduela" "lstduelb" "luctoday" "lupin3" "lwings" "lwings2" "lwingsb" "lwingsj" "lwingsja" "lwingsjp" "m660" "m660b" "m660j" "mach9" "machomou" "macross" "macrossp" "madgear" "madgearj" "madshark" "magspot" "magspot2" "magworm" "mahoudai" "majest12" "majest12j" "majest12u" "maketrax" "maketrxb" "makyosen" "maniach" "maniach2" "manybloc" "mappy" "mappyj" "marinedt" "mariner" "mars" "marvins" "masterw" "masterwj" "masterwu" "matmania" "mazinger" "mazingerj" "mbrush" "megadon" "megaforc" "megaforcu" "megaznik" "megazone" "megazonea" "megazoneb" "megazoneh" "megazonei" "megazonej" "mercenario" "mercs" "mercsj" "mercsu" "mercsua" "mercsur1" "merlinmm" "metafox" "meteor" "metlfrzr" "metlhawk" "metlhawkj" "mightguy" "mikie" "mikiehs" "mikiej" "milliped" "millpac" "mimonkey" "mimonsco" "mimonscr" "mimonscra" "minefld" "mirax" "miraxa" "mjleague" "mltiwars" "mmagic" "mmonkey" "mmonkeyj" "mnchmobl" "moegonta" "mofflott" "moguchan" "monkeyd" "monsterb" "montecar" "monymony" "moonal2" "moonal2b" "moonaln" "moonbase" "mooncmw" "mooncptc" "mooncreg" "mooncrgx" "mooncrs2" "mooncrs3" "mooncrs4" "mooncrs5" "mooncrsa" "mooncrsb" "mooncrsg" "mooncrsl" "mooncrst" "mooncrstg" "mooncrsto" "mooncrstso" "mooncrstu" "mooncrstuk" "mooncrstuku" "mooncrsu" "moonqsr" "moonwar" "moonwara" "motorace" "motos" "mototour" "mouser" "mouserc" "mplanets" "mplanetsuk" "mplanuk" "mrdo" "mrdofix" "mrdot" "mrdoy" "mrdu" "mrflea" "mrjong" "mrkougar" "mrkougar2" "mrkougb" "mrkougb2" "mrkougr2" "mrlo" "mrtnt" "mrviking" "mrvikingj" "mrvikngj" "mschamp" "mschamps" "msheartb" "msisaac" "msjiken" "mspacmab" "mspacmab2" "mspacman" "mspacmanbcc" "mspacmanbco" "mspacmanbg" "mspacmanbg2" "mspacmanbgd" "mspacmanbhe" "mspacmanblt" "mspacmat" "mspacmbe" "mspacmbmc" "mspacmnf" "mspacpls" "mspuzzle" "musicbal" "mustache" "mustachei" "mx5000" "myqbert" "myststno" "mystston" "myststono" "myststonoi" "naughtya" "naughtyb" "naughtyba" "naughtybb" "naughtybc" "naughtyc" "navalone" "navarone" "ncv1" "ncv1j" "ncv1j2" "ncv2" "ncv2j" "nebulbee" "nebulray" "nebulryj" "neobattl" "netwars" "newfant" "newfanta" "newpuc2" "newpuc2b" "newpuckx" "newsin7" "nextfase" "nibbler" "nibbler6" "nibbler7" "nibbler8" "nibblera" "nibblero" "nibblerp" "ninjemak" "nitrobal" "nitrobala" "nmouse" "nmouseb" "nob" "nobb" "noboranb" "nomnlnd" "nomnlndg" "nost" "nostj" "nostk" "nunchaku" "nyny" "nynyg" "offensiv" "oigas" "olibochu" "omega" "omegaa" "omegab" "omegaf" "omegafs" "omni" "orbitron" "ottopz" "outline" "outzone" "outzonea" "outzoneb" "outzonec" "outzonecv" "outzoneh" "overdriv" "ozmawar2" "ozmawars" "ozmawars2" "ozon1" "pacgal" "pacheart" "packbang" "packetman" "pacman" "pacmanbl" "pacmanbla" "pacmanblv" "pacmanf" "pacmanfm" "pacmania" "pacmaniaj" "pacmaniao" "pacmanij" "pacmanpe" "pacmanso" "pacmansp" "pacmanug" "pacmanvg" "pacmod" "pacnchmp" "pacnpal" "pacnpal2" "pacplus" "pacuman" "paddle2" "paddlema" "paintrlr" "pairlove" "pajaroes" "pandoras" "panic" "panic2" "panic3" "panicger" "panich" "paprazzi" "paradise" "passht4b" "passsht" "passsht16a" "passshta" "passshtad" "passshtb" "passshtd" "passshtj" "passshtjd" "pbactio2" "pbaction" "pbaction2" "pbaction3" "pbaction4" "pbactiont" "pballoon" "pballoonr" "peggle" "pegglet" "pengo" "pengo2" "pengo2u" "pengo3u" "pengo4" "pengo5" "pengob" "penta" "percuss" "perestro" "perfrman" "perfrmanu" "perfrmau" "phelios" "pheliosj" "phoenix" "phoenix2" "phoenix3" "phoenixa" "phoenixass" "phoenixb" "phoenixc" "phoenixc2" "phoenixc3" "phoenixc4" "phoenixdal" "phoenixgu" "phoenixha" "phoenixi" "phoenixj" "phoenixs" "phoenixt" "phoenxp2" "phozon" "phozons" "pickin" "pignewt" "pignewta" "pinbo" "pinbos" "piranha" "piranhah" "piranhao" "pisces" "piscesb" "pitnrun" "pitnruna" "playball" "pleiadbl" "pleiadce" "pleiads" "pleiadsb2" "pleiadsi" "pleiadsn" "pleiadss" "plgirls" "plgirls2" "plgirls2b" "plusalph" "plygonet" "polaris" "polarisa" "pollux" "polluxa" "polluxa2" "polluxn" "pootan" "pooyan" "pooyans" "popeyeman" "popflama" "popflamb" "popflame" "popflamea" "popflameb" "popflamen" "popper" "porky" "porter" "portman" "portmanj" "portrait" "poundfor" "poundforj" "poundforu" "poundfou" "pprobe" "progolf" "progress" "promutrv" "promutrva" "promutrvb" "promutrvc" "prosoccr" "prosport" "prtytime" "psurge" "psychic5" "psychic5j" "pturn" "puckman" "puckmana" "puckmanb" "puckmanf" "puckmanh" "puckmod" "pulsar" "puzlclub" "qbert" "qberta" "qbertj" "qbertjp" "qbertqub" "qberttst" "qix" "qix2" "qixa" "qixb" "qixo" "quantum" "quantum1" "quantump" "quarterb" "quartrba" "quester" "questers" "qwak" "r2dtank" "r2dx_v33" "r2dx_v33_r2" "rackemup" "radarscp" "radarscp1" "radarzn1" "radarznt" "radarzon" "raflesia" "raiden" "raiden2" "raiden2dx" "raiden2e" "raiden2ea" "raiden2eg" "raiden2eu" "raiden2eua" "raiden2f" "raiden2g" "raiden2hk" "raiden2i" "raiden2j" "raiden2k" "raiden2nl" "raiden2sw" "raiden2u" "raidena" "raidenb" "raidendx" "raidendxa1" "raidendxa2" "raidendxch" "raidendxg" "raidendxj" "raidendxja" "raidendxk" "raidendxnl" "raidendxpt" "raidendxu" "raidenk" "raidenkb" "raident" "raidenu" "raidenua" "raidenub" "rallybik" "raphero" "rapheroa" "rayforce" "rayforcej" "rayforcj" "razmataz" "reaktor" "redalert" "redclash" "redclask" "redfoxwp2" "redfoxwp2a" "redhawk" "redhawke" "redhawkk" "redlin2p" "redrobin" "redufo" "redufob" "redufob2" "regulus" "reguluso" "regulusu" "repulse" "rescue" "retofin1" "retofin2" "retofinv" "retofinvb" "retofinvb1" "retofinvb2" "retofinvb3" "revenger" "revngr84" "ridleofp" "ringfgt" "ringfgt2" "ringkin2" "ringkin3" "ringking" "ringking2" "ringking3" "ringkingw" "roadf" "roadf2" "roadf3" "rockduck" "rockn" "rockn2" "rockn3" "rockn4" "rockna" "rocktrv2" "rocnrope" "rocnropek" "rocnropk" "rollace" "rollace2" "rollingc" "rompers" "romperso" "ropeman" "rotaryf" "roundup" "route16" "route16a" "route16b" "route16bl" "route16c" "routex" "rshark" "rugrats" "rumba" "rundeep" "rushcrsh" "ryujin" "s1945" "s1945a" "s1945ii" "s1945iii" "s1945j" "s1945jn" "s1945k" "s1945n" "s1945nj" "s1945p" "safarir" "safarirj" "samesam2" "samesame" "samesame2" "samesamecn" "samesamenh" "samurai" "samuraia" "sandscrp" "sandscrpa" "sandscrpb" "sasuke" "satansat" "satansata" "satansatind" "saturn" "saturnzi" "savgbees" "sbagman" "sbagmani" "sbagmans" "sbasketb" "sbaskete" "sbasketg" "sbasketh" "sbasketo" "sbasketu" "sbdk" "sbomber" "sbombera" "sbomberb" "sbowling" "sbrkout" "sbugger" "schaser" "schasrcv" "scobra" "scobrab" "scobrae" "scobrae2" "scobrag" "scobraggi" "scobras" "scobrase" "scontra" "scontraj" "scorpion" "scorpiona" "scorpionb" "scorpionmc" "scorpnmc" "scotrsht" "scramb2" "scramblb" "scramble" "scramblebb" "scramblebf" "scrambler" "scrambles" "scrambls" "scrambp" "scramce" "scrampt" "scramrf" "scregg" "scudhamm" "sdtennis" "sdungeon" "sdungeona" "searchar" "searcharj" "searcharu" "sectrzon" "seicross" "sengekij" "sengekis" "sengekisj" "senjyo" "sercharu" "sfeverbw" "sflush" "sformula" "shaolinb" "shaolins" "sheriff" "shienryu" "shippumd" "shollow" "shollow2" "shootbul" "shtrider" "shtridera" "shtriderb" "shuffle" "sia2650" "sicv" "silvmil" "sindbadm" "sinista1" "sinista2" "sinistar" "sinistar2" "sinvasn" "sinvasnb" "sinvemag" "sinvzen" "sisv" "sisv1" "sisv2" "sisv3" "sitv" "sitv1" "skullfng" "skullfnga" "skullfngj" "skyadvnj" "skyadvnt" "skyadvntj" "skyadvntu" "skyadvnu" "skyalert" "skyarmy" "skybase" "skybump" "skychut" "skyfox" "skylancr" "skylancre" "skyraidr" "skyshark" "skysharka" "skysmash" "skysoldr" "skysoldrbl" "slapbtjp" "slapbtuk" "slapfigh" "slapfigha" "slapfighb1" "slapfighb2" "slapfighb3" "sliksh17" "slikshot" "slither" "slithera" "slspirit" "smooncrs" "sncwgltd" "sngkace" "sngkacea" "solarfox" "solfight" "sonicbom" "sonicbomd" "sonicwi" "sonofphx" "sos" "spacbat2" "spacbatt" "spacbeam" "spaceat2" "spaceatt" "spacebrd" "spacecho" "spacecho2" "spacecr" "spacedem" "spacefb" "spacefba" "spacefbb" "spacefbe" "spacefbe2" "spacefbg" "spacefev" "spacefrt" "spaceint" "spacempr" "spaceod" "spaceph" "spaceplt" "spacetrk" "spacewr3" "spbactn" "spbactnj" "spcdrag" "spceking" "spcewarl" "spcewars" "spcforc2" "spcforce" "spcfrcii" "spcinv95" "spcinv95u" "spcking2" "spclaser" "spclforc" "spcnv95u" "spcpostn" "spctbird" "spdcoin" "speakres" "speakresb" "spec2k" "speedbal" "spiders" "spiders2" "sprglbpg" "sprglobp" "springer" "sptrekct" "spyhunt" "spyhuntp" "sqbert" "sqixbl" "sraider" "srdarwin" "srdarwinj" "srdarwnj" "srdmissn" "srumbler" "srumbler2" "srumbler3" "srumblr2" "ssi" "ssmissin" "ssozumo" "sspacaho" "sspacat2" "sspacatc" "sspaceat" "sspeedr" "sspiritj" "sspirits" "sspirtfc" "ssrj" "sstarcrs" "sstingry" "sstrangr" "sstrangr2" "sstrike" "sstriker" "sstrikerk" "sstrngr2" "stagger1" "starfght" "starfgmc" "starfigh" "starforc" "starforca" "starforcb" "starforce" "starfore" "starjack" "starjacks" "starjacs" "starw" "starwarr" "stera" "stg" "stinger" "stinger2" "stmblade" "stmbladej" "storming" "stratab" "stratab1" "stratvox" "stratvoxb" "streakng" "streaknga" "strfbomb" "strtheat" "strvmstr" "stuntair" "sub" "sucasino" "sundance" "supdrapo" "superbar" "superbik" "superbon" "superbug" "superg" "superinv" "superpac" "superpacm" "superpcm" "superqix" "supertnk" "superx" "superxm" "supmodel" "suprglob" "suprheli" "suprmous" "suprridr" "survival" "swarm" "swat" "sxevious" "szaxxon" "tacscan" "tactcan2" "tactcian" "tactcian2" "tagteam" "tail2nos" "tankbatt" "tankbust" "taxidrvr" "tazmani2" "tazmania" "tazzmang" "tazzmang2" "tcobra2" "tcobra2u" "tdfever" "tdfever2" "tdfeverj" "tdpgal" "tdragon" "tdragon1" "tdragon2" "tdragon2a" "tdragon3h" "tdragonb" "teamqb" "teamqb2" "teedoff" "telmahjn" "tempest" "tempest1" "tempest1r" "tempest2" "tempest3" "temptube" "terracra" "terracrb" "terracre" "terracrea" "terracren" "terracreo" "tharierj" "tharrier" "tharrieru" "thedeep" "theend" "theends" "theglob" "theglob2" "theglob3" "theglobp" "thehand" "thehustj" "thehustl" "thehustlj" "thepit" "thepitj" "thepitm" "thepitu1" "thepitu2" "thndblst" "thunderl" "tigerh" "tigerh2" "tigerhb1" "tigerhb2" "tigerhb3" "tigerhj" "timefgtr" "timelimt" "timeplt" "timeplta" "timepltc" "timescan" "timescan1" "timesol1" "timesold" "timesold1" "timscanr" "tinv2650" "tiptop" "titanpac" "tndrcade" "tndrcadej" "tndrcadj" "tnexspce" "tnextspc" "tnextspc2" "tnextspcj" "tnk3" "tnk3j" "todruaga" "todruagao" "todruagas" "todruago" "tokio" "tokiob" "tokioo" "tokiou" "tokisens" "tokisensa" "tomahaw5" "tomahawk" "toobin" "toobin1" "toobin2" "toobin2e" "toobine" "toobing" "topgunbl" "topgunr" "toratora" "tp84" "tp84a" "tp84b" "tranqgun" "travrusa" "travrusab" "treahunt" "tricktrp" "trigon" "trikitri" "triplep" "triplepa" "tripool" "tripoola" "trisport" "tron" "tron2" "tron3" "tron4" "tron5" "tronger" "truxton" "truxton2" "trvgns" "trvmstr" "trvmstra" "trvmstrb" "trvmstrc" "tryout" "tsamura2" "tsamurai" "tsamurai2" "tsamuraih" "tst_galx" "ttfitter" "tugboat" "tunhunt" "tunhuntc" "turbo" "turboa" "turbob" "turbobl" "turboc" "turbod" "turbofrc" "turbofrco" "turbofrcu" "turbotag" "turpin" "turpins" "turtles" "tutankhm" "tutankhms" "tutankst" "twinbee" "twincobr" "twincobru" "twincobu" "twineag2" "twineagl" "twinhawk" "twinhawku" "twinhwku" "typhoon" "ultrax" "ultraxg" "unclepoo" "uniwars" "uniwarsa" "upndown" "upndownu" "usclssic" "valkyrie" "valtric" "vandyjal" "vandyke" "vandykeb" "vandykejal" "vandykejal2" "vangrd2" "vangrdce" "vanguard" "vanguardc" "vanguardj" "vanvan" "vanvanb" "vanvank" "vaportra" "vaportra3" "vaportrau" "vaportru" "varth" "varthb" "varthj" "varthjr" "varthr1" "varthu" "vasara" "vasara2" "vasara2a" "vastar" "vastar2" "vastar3" "vastar4" "vautour" "vautourz" "vautourza" "venus" "verbena" "vfive" "victoryc" "victorycb" "victroad" "videopin" "vimana" "vimana1" "vimanaj" "vimanan" "vmetal" "vmetaln" "volfied" "volfiedj" "volfiedjo" "volfiedu" "vpool" "vsgongf" "vulgus" "vulgus2" "vulgusa" "vulgusj" "wallst" "wanted" "warofbug" "warofbugu" "warpwar2" "warpwarp" "warpwarpr" "warpwarpr2" "warpwarr" "waterski" "wiggie" "wingforc" "wiping" "wiz" "wizt" "wizta" "wmatch" "wndrplnt" "woodpeca" "woodpeck" "worldwar" "wrestwar" "wrestwar1" "wrestwar1d" "wrestwar2" "wrestwar2d" "wrofaero" "wtennis" "wwester1" "wwestern" "wwestern1" "wyvernf0" "wyvernf0a" "xevios" "xevious" "xeviousa" "xeviousb" "xxmissio" "yamagchi" "yamato" "yamato2" "yankeedo" "yellowcbb" "yellowcbj" "yosakdon" "youjyudn" "youma" "youma2" "yukiwo" "zaryavos" "zarzon" "zaviga" "zavigaj" "zaxxon" "zaxxon2" "zaxxon3" "zaxxonb" "zaxxonj" "zerohour" "zerotime" "zerotimed" "zerotimemc" "zigzag" "zigzag2" "zigzagb" "zigzagb2" "zingzip" "zipzap" "zoar" "zodiack" "zzyzzyx2" "zzyzzyxx" "zzyzzyxx2")

function dcContinue(){
	read -n 1 -s -r -p $'\nPress any key to continue...' key
	rm -rf ./$TEMP
	exec "$0"
}

function dcReboot(){
	read -n 1 -s -r -p $'\nPress any key to continue...' key
	rm -rf ./$TEMP
	init 6
}

function dcESreboot(){
	if [ $HOSTNAME == "BATOCERA" ]; then
		batocera-es-swissknife --restart > /dev/null 2>&1

	elif [ $HOSTNAME == "ANBERNIC" ]; then
		anbernic-es-swissknife --restart > /dev/null 2>&1

	else
		if [ $ESOS == "arkos" ]; then
			sudo -u root touch /tmp/es-restart; pkill -f "/emulationstation$"
		else
			touch /tmp/es-restart; kill $(pgrep -l -n emulationstatio | awk '!/grep/ {printf "%s ",$1}'); rm -f "/tmp/es-restart"
		fi
	fi
}

rm -rf ./$TEMP
if ping -q -c 1 -W 1 google.com >/dev/null; then
	mkdir ./$TEMP
else
	echo "The network is off."
	exit 0
fi

OPTIONS=(1 "Apply EmulationStation UI Korean patch"
	2 "Apply Retroarch UI Korean patch"
	3 "Apply Retroarch Vertical arcade settings"
	4 "Install Anbernic Epic noir OE theme"
	5 "Install PPSSPP Patched font"
	6 "Restore PPSSPP Original font"
	7 "Change all platform integer scales"
	B "Install Minimal Support pack"
	E "Restart EmulationStation"
	R "Reboot System"
	Q "Quit")

SEL=$(dialog --clear \
	--backtitle "$BACKTITLE" \
	--title "$TITLE" \
	--menu "$MENU" \
	$HEIGHT $WIDTH $SEL_HEIGHT \
	"${OPTIONS[@]}" \
	2>&1 >/dev/tty)

clear
case $SEL in
	1)
		#Apply EmulationStation UI Korean patch
		
		if [ $HOSTNAME == "EMUELEC" ]; then
			echo "ERROR: This operating system is not supported."
			dcContinue
		fi

		if [ ! -d $LC_PATH ]; then
			echo "ERROR: Failed to find locale directory."
			dcContinue
		fi
		
		wget --no-hsts -P ./$TEMP https://github.com/byunjaeil/es-Storage/raw/main/opensans_hebrew_condensed_light.ttf
		wget --no-hsts -P ./$TEMP https://github.com/byunjaeil/es-Storage/raw/main/opensans_hebrew_condensed_regular.ttf
		wget --no-hsts -P ./$TEMP https://github.com/byunjaeil/es-Storage/raw/main/emulationstation2.po
		wget --no-hsts -P ./$TEMP https://github.com/byunjaeil/es-Storage/raw/main/emulationstation2.mo
		
		if [ $ESOS != "arkos" ]; then
			cp -f ./$TEMP/emulationstation2.* $LC_PATH/
			cp -f ./$TEMP/opensans_hebrew_condensed_light.ttf $RES_PATH/NanumMyeongjo.ttf
		else
			cp -f ./$TEMP/emulationstation2.po $LC_PATH/

			wget --no-hsts -P ./$TEMP https://github.com/byunjaeil/es-Storage/raw/main/NotoSansKR-Light.otf
			if [ -f "$THEME_PATH/es-theme-arkos-carbon/art/Cabin-Regular.ttf" ]; then
				cp -f ./$TEMP/opensans_hebrew_condensed_light.ttf $THEME_PATH/es-theme-arkos-carbon/art/Cabin-Regular.ttf
			fi
			if [ -f "$THEME_PATH/es-theme-arkos-carbon/art/Cabin-Bold.ttf" ]; then
			cp -f ./$TEMP/opensans_hebrew_condensed_regular.ttf $THEME_PATH/es-theme-arkos-carbon/art/Cabin-Bold.ttf
			fi
			if [ -f "$THEME_PATH/es-theme-epic-cody-RG351P-M/_art/Acre.otf" ]; then
			cp -f ./$TEMP/NotoSansKR-Light.otf $THEME_PATH/es-theme-epic-cody-RG351P-M/_art/Acre.otf
			fi
			if [ -f "$THEME_PATH/es-theme-epicnoir/_art/Acre.otf" ]; then
			cp -f ./$TEMP/NotoSansKR-Light.otf $THEME_PATH/es-theme-epicnoir/_art/Acre.otf
			fi
			if [ -f "$THEME_PATH/es-theme-freeplay/_inc/fonts/Helsinki-Narrow.ttf" ]; then
			cp -f ./$TEMP/opensans_hebrew_condensed_light.ttf $THEME_PATH/es-theme-freeplay/_inc/fonts/Helsinki-Narrow.ttf
			fi
			if [ -f "$THEME_PATH/es-theme-gbz35_mod/_inc/fonts/RobotoCondensed-Regular.ttf" ]; then
			cp -f ./$TEMP/opensans_hebrew_condensed_light.ttf $THEME_PATH/es-theme-gbz35_mod/_inc/fonts/RobotoCondensed-Regular.ttf
			fi
			if [ -f "$THEME_PATH/es-theme-magical-pixel/_inc/fonts/font.ttf" ]; then
			cp -f ./$TEMP/opensans_hebrew_condensed_light.ttf $THEME_PATH/es-theme-magical-pixel/_inc/fonts/font.ttf
			fi
			if [ -f "$THEME_PATH/es-theme-minimal-arkos/assets/SST.ttf" ]; then
			cp -f ./$TEMP/opensans_hebrew_condensed_light.ttf $THEME_PATH/es-theme-minimal-arkos/assets/SST.ttf
			fi
			if [ -f "$THEME_PATH/es-theme-minimal-arkos/assets/noto.ttf" ]; then
			cp -f ./$TEMP/opensans_hebrew_condensed_regular.ttf $THEME_PATH/es-theme-minimal-arkos/assets/noto.ttf
			fi
			if [ -f "$THEME_PATH/es-theme-nes-box/_inc/fonts/Cabin-Bold.ttf" ]; then
			cp -f ./$TEMP/opensans_hebrew_condensed_light.ttf $THEME_PATH/es-theme-nes-box/_inc/fonts/Cabin-Bold.ttf
			fi
			if [ -f "$THEME_PATH/es-theme-switch/assets/Oxygen-Bold.ttf" ]; then
			cp -f ./$TEMP/opensans_hebrew_condensed_light.ttf $THEME_PATH/es-theme-switch/assets/Oxygen-Bold.ttf
			fi
		fi

		cp -f ./$TEMP/opensans*.ttf $RES_PATH/

		if [ $HOSTNAME == "BATOCERA" ]; then
			sed -i 's/system.language=.*/system.language=ko_KR/g' /userdata/system/$ESOS.conf
			
			cp -f ./$TEMP/opensans_hebrew_condensed_light.ttf /usr/share/fonts/truetype/nanum/NanumMyeongjo.ttf
			batocera-save-overlay

		elif [ $HOSTNAME == "ANBERNIC" ]; then
			sed -i 's/system.language=.*/system.language=ko_KR/g' /userdata/system/$ESOS.conf

			cp -f ./$TEMP/opensans_hebrew_condensed_light.ttf /usr/share/fonts/truetype/nanum/NanumMyeongjo.ttf
			wget --no-hsts -P ./$TEMP https://github.com/byunjaeil/es-Storage/raw/main/notice.pdf
			cp -f ./$TEMP/notice.pdf /usr/share/anbernic/doc/notice.pdf
			anbernic-save-overlay

		elif [ $ESOS == "amberelec" ]; then
			sed -i 's/system.language=.*/system.language=ko_KR/g' /storage/.config/distribution/configs/distribution.conf

		elif [ $ESOS == "jelos" ]; then
			sed -i 's/system.language=.*/system.language=ko_KR/g' /storage/.config/system/configs/system.cfg
		
		elif [ $ESOS == "arkos" ]; then
			sed -i 's/name="Language" value=.*"/name="Language" value="ko"/g' /home/ark/.emulationstation/es_settings.cfg
		fi

		echo -e "\nProcessing complete."
		dcESreboot
		dcContinue
		;;

	2)
		#Apply Retroarch UI Korean patch

		if [ $HOSTNAME == "EMUELEC" ]; then
			echo "ERROR: This operating system is not supported."
			dcContinue
		fi

		if [ $HOSTNAME == "BATOCERA" ] || [ $HOSTNAME == "ANBERNIC" ]; then
			LCONF="/userdata/system/$ESOS.conf"

			if [ ! -f "/userdata/system/configs/retroarch/retroarchcustom.cfg" ]; then
				echo "ERROR: Failed to find Retroarch Config."
				dcContinue
			fi

			wget --no-hsts -P ./$TEMP https://github.com/byunjaeil/es-Storage/raw/main/font.ttf

			if [ ! -d "/userdata/system/configs/retroarch/assets" ]; then
				mkdir -p /userdata/system/configs/retroarch/assets
			fi

			cp -f ./$TEMP/font.ttf /userdata/system/configs/retroarch/assets/

			if cat $LCONF | grep global.retroarch.video_font_path >/dev/null; then
				sed -i 's/global.retroarch.video_font_path.*/global.retroarch.video_font_path = \"\/userdata\/system\/configs\/retroarch\/assets\/font.ttf\"/g' $LCONF
			else
				echo -e '\nglobal.retroarch.video_font_path = "/userdata/system/configs/retroarch/assets/font.ttf"' >> $LCONF
			fi

			if cat $LCONF | grep global.retroarch.xmb_font >/dev/null; then
				sed -i 's/global.retroarch.xmb_font.*/global.retroarch.xmb_font = \"\/userdata\/system\/configs\/retroarch\/assets\/font.ttf\"/g' $LCONF
			else
				echo -e 'global.retroarch.xmb_font = "/userdata/system/configs/retroarch/assets/font.ttf"' >> $LCONF
			fi
			
			sed -i \
			-e 's/user_language.*/user_language = \"10\"/g' \
			-e 's/menu_driver.*/menu_driver = \"xmb\"/g' \
			/userdata/system/configs/retroarch/retroarchcustom.cfg
		
		elif [ $ESOS == "arkos" ]; then
			if [ ! -f "/home/ark/.config/retroarch/retroarch.cfg" ]; then
				echo "ERROR: Failed to find Retroarch Config."
				dcContinue
			fi

			sed -i \
			-e 's/user_language.*/user_language = \"10\"/g' \
			-e 's/menu_driver.*/menu_driver = \"xmb\"/g' \
			-e 's/xmb_font.*/xmb_font = \"\/home\/ark\/.config\/retroarch\/assets\/xmb\/monochrome\/font.ttf\"/g' \
			/home/ark/.config/retroarch/retroarch.cfg
		else
			if [ ! -f "/storage/.config/retroarch/retroarch.cfg" ]; then
				echo "ERROR: Failed to find Retroarch Config."
				dcContinue
			fi

			sed -i \
			-e 's/user_language.*/user_language = \"10\"/g' \
			-e 's/menu_driver.*/menu_driver = \"xmb\"/g' \
			/storage/.config/retroarch/retroarch.cfg
			
			SCONF=""
			if [ $ESOS == "amberelec" ]; then
				SCONF="/storage/.config/distribution/configs/distribution.conf"
			elif [ $ESOS == "jelos" ]; then
				SCONF="/storage/.config/system/configs/system.cfg"
			fi
			
			if [ $SCONF != "" ]; then
				if cat $SCONF | grep global.retroarch.menu_driver >/dev/null; then
					sed -i 's/global.retroarch.menu_driver.*/global.retroarch.menu_driver=xmb/g' $SCONF
				else
					echo -e 'global.retroarch.menu_driver=xmb' >> $SCONF
				fi
			fi
		fi

		echo -e "\nProcessing complete."
		dcESreboot
		dcContinue
		;;

	3)
		#Apply Retroarch Vertical arcade settings

		CORE=("FinalBurn Neo"
			"FB Alpha"
			"FB Alpha 2012"
			"MAME"
			"MAME 2000"
			"MAME 2003-Plus"
			"MAME 2010"
			"MAME 2015"
		)
		
		for ((i = 0; i < ${#CORE[@]}; i++))
		do
			SS="off"
			if [ $i -eq 0 ]; then
				SS="on"
			fi

			ITEM+=( "$((i+1))" "${CORE[$i]}" "${SS}" )
		done

		MENU="Select the core to use from the following options"
		SEL=$(dialog --clear \
			--backtitle "$BACKTITLE" \
			--title "$TITLE" \
			--checklist "$MENU" \
			$HEIGHT $WIDTH $SEL_HEIGHT \
			"${ITEM[@]}" \
			2>&1 >/dev/tty)

clear

mkdir ./$TEMP/mam
mkdir ./$TEMP/fbn

echo -n -e "Creating config MAME file"
for i in ${VTC[@]}
do
echo -n '.'
cat <<EOF >./$TEMP/mam/${i}.cfg
aspect_ratio_index = "0"
allow_video_rotate = "true"
video_rotation = "1"
EOF
done

echo -n -e "\nCreating config FBNEO file"
for i in ${VTC[@]}
do
echo -n '.'
cat <<EOF >./$TEMP/fbn/${i}.opt
fbneo-vertical-mode = "alternate"
EOF
done

echo -n -e "\nCreating remapping file"
for i in ${VTC[@]}
do
echo -n '.'
cat <<EOF >./$TEMP/${i}.rmp
input_libretro_device_p1 = "1"
input_libretro_device_p2 = "1"
input_libretro_device_p3 = "1"
input_libretro_device_p4 = "1"
input_libretro_device_p5 = "1"
input_player1_analog_dpad_mode = "4"
input_player1_btn_a = "0"
input_player1_btn_b = "1"
input_player1_btn_down = "6"
input_player1_btn_left = "4"
input_player1_btn_right = "5"
input_player1_btn_up = "7"
input_player1_btn_x = "8"
input_player1_btn_y = "9"
input_player2_analog_dpad_mode = "0"
input_player3_analog_dpad_mode = "0"
input_player4_analog_dpad_mode = "0"
input_player5_analog_dpad_mode = "0"
input_remap_port_p1 = "0"
input_remap_port_p2 = "1"
input_remap_port_p3 = "2"
input_remap_port_p4 = "3"
input_remap_port_p5 = "4"
EOF
done
			
		for i in ${SEL[@]}
		do
			TCORE="${CORE[$((i-1))]}"
			if [ $HOSTNAME == "BATOCERA" ] || [ $HOSTNAME == "ANBERNIC" ]; then
				TCORE_CFG="/userdata/system/.config/retroarch/config"
				TCORE_RMP="/userdata/system/.config/retroarch/config/remaps"
			elif [ $ESOS == "amberelec" ]; then
				TCORE_CFG="/storage/roms/gamedata/retroarch/config"
				TCORE_RMP="/storage/roms/gamedata/remappings"
			elif [ $ESOS == "jelos" ] || [ $HOSTNAME == "EMUELEC" ]; then
				TCORE_CFG="/storage/.config/retroarch/config"
				TCORE_RMP="/storage/remappings"
			elif [ $ESOS == "arkos" ]; then
				TCORE_CFG="/home/ark/.config/retroarch/config"
				TCORE_RMP="/home/ark/.config/retroarch/config/remaps"
			fi

			rm -rf "$TCORE_CFG/$TCORE"
			rm -rf "$TCORE_RMP/$TCORE"
			mkdir -p "$TCORE_CFG/$TCORE"
			mkdir -p "$TCORE_RMP/$TCORE"
			
			if [[ $TCORE == *"MAME"* ]]; then
				echo -e "Copying config file to $TCORE..."
				cp -f ./$TEMP/mam/* "$TCORE_CFG/$TCORE/"
			else
				echo -e "Copying config file to $TCORE..."
				cp -f ./$TEMP/fbn/* "$TCORE_CFG/$TCORE/"
			fi
			echo -e "Copying remapping file to $TCORE..."
			cp -f ./$TEMP/*.rmp "$TCORE_RMP/$TCORE/"

		done

		echo -e "\nProcessing complete."
		dcContinue
		;;

	4)
		#Install Anbernic Epic noir OE theme
		
		if [ $ESOS == "arkos" ]; then
			echo "ERROR: This operating system is not supported."
			dcContinue
		fi

		if [ ! -d $THEME_PATH ]; then
			echo "ERROR: Failed to find Themes directory."
			dcContinue
		fi

		THEME_NAME="es-theme-anbernic-dc"
		
		wget --no-hsts -P ./$TEMP https://github.com/byunjaeil/es-theme-anbernic-dc/archive/refs/heads/main.zip
		unzip ./$TEMP/main.zip -d ./$TEMP
		rm -rf $THEME_PATH/$THEME_NAME
		cp -rf ./$TEMP/es-theme-anbernic-dc* $THEME_PATH/$THEME_NAME
		
		if [ $HOSTNAME == "BATOCERA" ] || [ $HOSTNAME == "ANBERNIC" ]; then
			sed -i 's/name="ThemeSet" value=".*"/name="ThemeSet" value="es-theme-anbernic-dc"/g' /userdata/system/configs/emulationstation/es_settings.cfg
		elif [ $ESOS == "arkos" ]; then
			sed -i 's/name="ThemeSet" value=".*"/name="ThemeSet" value="es-theme-anbernic-dc"/g' /home/ark/.emulationstation/es_settings.cfg
		else
			sed -i 's/name="ThemeSet" value=".*"/name="ThemeSet" value="es-theme-anbernic-dc"/g' /storage/.config/emulationstation/es_settings.cfg
		fi

		echo -e "\nProcessing complete."
		dcESreboot
		dcContinue
		;;

	5)
		#Install PPSSPP Patched font
		
		if [ ! -d $PSPFONT_PATH ]; then
			echo "ERROR: Failed to find Font directory."
			dcContinue
		fi

		wget --no-hsts -P ./$TEMP https://github.com/byunjaeil/es-Storage/raw/main/kr0.pgf
		wget --no-hsts -P ./$TEMP https://github.com/byunjaeil/es-Storage/raw/main/jpn0.pgf
		cp -f ./$TEMP/*.pgf $PSPFONT_PATH/

		if [ $HOSTNAME == "BATOCERA" ]; then
			batocera-save-overlay

		elif [ $HOSTNAME == "ANBERNIC" ]; then
			anbernic-save-overlay
		fi

		echo -e "\nProcessing complete."
		dcContinue
		;;
	
	6)
		#Restore PPSSPP Original font
		
		if [ ! -d $PSPFONT_PATH ]; then
			echo "ERROR: Failed to find Font directory."
			dcContinue
		fi
		
		wget --no-hsts -P ./$TEMP https://github.com/byunjaeil/es-Storage/raw/main/kr0.original.pgf
		wget --no-hsts -P ./$TEMP https://github.com/byunjaeil/es-Storage/raw/main/jpn0.original.pgf
		cp -f ./$TEMP/kr0.original.pgf $PSPFONT_PATH/kr0.pgf
		cp -f ./$TEMP/jpn0.original.pgf $PSPFONT_PATH/jpn0.pgf
		
		if [ $HOSTNAME == "BATOCERA" ]; then
			batocera-save-overlay

		elif [ $HOSTNAME == "ANBERNIC" ]; then
			anbernic-save-overlay
		fi

		echo -e "\nProcessing complete."
		dcContinue
		;;
	
	7)
		#Change all platform integer scales
		
		if [ $ESOS != "amberelec" ] && [ $ESOS != "jelos" ]; then
			echo "ERROR: This operating system is not supported."
			dcContinue
		fi

		if [ $ESOS == "amberelec" ]; then
			SCONF="/storage/.config/distribution/configs/distribution.conf"
		elif [ $ESOS == "jelos" ]; then
			SCONF="/storage/.config/system/configs/system.cfg"
		fi

		if [ ! -f $SCONF ]; then
			echo "ERROR: Failed to find System Config."
			dcContinue
		fi

		OPTIONS=(1 "ON"
			2 "OFF")

		SEL=$(dialog --clear \
			--backtitle "$BACKTITLE" \
			--title "$TITLE" \
			--menu "$MENU" \
			$HEIGHT $WIDTH $SEL_HEIGHT \
			"${OPTIONS[@]}" \
			2>&1 >/dev/tty)
		
		clear
		case $SEL in
			1)
				sed -i 's/integerscale=.*/integerscale=1/g' $SCONF
				;;
			2)
				sed -i 's/integerscale=.*/integerscale=0/g' $SCONF
				;;
		esac
		
		echo -e "\nProcessing complete."
		dcContinue
		;;

	B)
		#Install Minimal Support pack

		if [ ! -d $BIOS_PATH ]; then
			echo "ERROR: Failed to find Bios directory."
			dcContinue
		fi

		wget --no-hsts -P ./$TEMP https://github.com/byunjaeil/minimal-Bios/archive/refs/heads/main.zip
		unzip -q ./$TEMP/main.zip -d ./$TEMP
		cp -rf ./$TEMP/minimal-Bios-main/* $BIOS_PATH

		echo -e "\nProcessing complete."
		dcContinue
		;;

	E)
		#Restart EmulationStation

		echo -e "\nProcessing complete."
		dcESreboot
		dcContinue
		;;
	
	R)
		#Reboot System

		dcReboot
		;;

	Q)
		#Quit
		
		echo "Bye~:)"
		;;

esac

rm -rf ./$TEMP
exit 0
