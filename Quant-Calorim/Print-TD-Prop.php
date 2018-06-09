<?php

// $eh=4.35974418e-18;
$eh=2625.499748; // кДж/моль
$BASIS="RB3LYP-aug-cc-pVDZ-T298";
$mprop=array();

function get_component($str,$k) {
    $r = array();
    $lst = explode(" ",$str);
    foreach ($lst as $s) {
	$comp=ltrim(rtrim($s));
	if(strlen($comp)<1) continue;
	if(strcasecmp($comp, "+") == 0) continue;
//	$ml=preg_split('/^\d+$/',$comp);
////	$ml = sscanf($comp,"%f%s");
////	if($ml[0]==NULL) $ml=array(1.0,$comp);
////	$ml[0]*=$k;
//	echo '<'.implode(',',$ml).'> ';
	$ml=array($k,$comp);
	array_push($r, $ml);
    }
    return $r;
}


function get_reaction($str) {
    list($src, $dst) = explode("=", $str);
    $msrc = get_component($src,-1.0);
    $mdst = get_component($dst,1.0);
    return(array_merge($msrc,$mdst));
}

function read_prop($name) {
/*
Group N4-N3-C0 Distance C-N=1.4319 Distance N-N=1.1073 Angle=175.61
Ring C0-C1-C2-N9-N8-N7 SumAnges=720.00(100.00%) SumDistance=0.0005
LUMO=-0.35447
HOMO=-0.47157
*/
    global $mprop,$mmt,$eh,$BASIS;

    $prop = array( 'HOMO'=>0.0, 'LUMO'=>0.0, 'C-N'=>0.0, 'N-N'=>0.0, 'AngCNN'=>0.0, 'RSD'=>0.0 );
    $fname = sprintf("prop/$name.prop");
//    echo "fname=$fname\n";
    $f = fopen($fname,"r");
    if(!$f) return $prop;
    while (!feof ($f)) {
        $s = rtrim(ltrim(fgets($f))); if(strlen($s)<1) continue; 
//	echo "s=[$s]\n";
        if( ($p=strpos($s,'HOMO='))!==false ) $prop['HOMO'] = floatval( substr($s,$p+5,$p+14) );
        if( ($p=strpos($s,'LUMO='))!==false ) $prop['LUMO'] = floatval( substr($s,$p+5,$p+14) );
        if( ($p=strpos($s,'C-N='))!==false ) $prop['C-N'] = floatval( substr($s,$p+4,$p+10) );
        if( ($p=strpos($s,'N-N='))!==false ) $prop['N-N'] = floatval( substr($s,$p+4,$p+10) );
        if( ($p=strpos($s,'Angle='))!==false ) $prop['AngCNN'] = floatval( substr($s,$p+6,$p+12) );
        if( ($p=strpos($s,'SumDistance='))!==false ) $prop['RSD'] = floatval( substr($s,$p+12,$p+18) );
//	printf("*** [%s] %p \n", $s, strpos($s,'C-N=') );
      }
    fclose($f);
    $mprop[$name] = $prop;
//    var_dump($prop);
    return $prop;
}

function read_reactions($fname) {
    global $mprop,$mmt,$eh,$BASIS;

    $m = array();
    $row = 1;
    if (($f = fopen($fname, "r")) !== FALSE) {
	fgets($f);
	while (($data = fgetcsv($f, 1000, ";")) !== FALSE) {
	    $num = count($data);
	    $row++;
	    $rs = $data[0];
//	    $dE = $data[1];
	    $dG = $data[1];
	    $dH = $data[2];
	    $dST = $data[3];
//	    printf("\"%s\"; %.5f; %.5f; %.5f; %.5f;\n", $rs, $dE, $dG, $dH, $dST );
//	    $m[$rs] = array( 'reaction'=>$rs, 'dE'=>$dE, 'dG'=>$dG, 'dH'=>$dH, 'dST'=>$dST );
	    $m[$rs] = array( 'reaction'=>$rs, 'dG'=>$dG, 'dH'=>$dH, 'dST'=>$dST );
	}
	fclose($f);
    }
    return($m);
}

function make_reactions( $fname, $m ) {
    global $mprop,$mmt,$eh,$BASIS;

    $out = fopen("Table-td-prop.csv", "w");
    fprintf($out,"Reaction; dG; dH; dS*T; LUMO(src); LUMO(prod); HOMO(src); HOMO(prod); Ring Deviation (src); Ring Deviation (prod); C-N-N; N-N; C-N;\n");

    if (($f = fopen($fname, "r")) !== FALSE) {
	while ( ($Str = fgets($f)) !== FALSE) {
	    $Name = ltrim(rtrim($Str));
	    if(strlen($Name)<2) continue;
	
	    $mp = read_prop("$Name-$BASIS");
	    $RSD = $mp['RSD'];
	    $AngCNN = $mp['AngCNN'];
	    $LUMO = $mp['LUMO'];
	    $HOMO = $mp['HOMO'];
	    $CN = $mp['C-N'];
	    $NN = $mp['N-N'];

	    $pos = strpos($Name, "BF4");
	    if ($pos === false) { 
		$Name_prod = str_replace("N2-", "", $Name);
		$mp = read_prop("$Name_prod-$BASIS");
		$r = "$Name = $Name_prod + N2";
	    } else {
		$Name_prod = str_replace("N2-BF4", "F", $Name);
		$r = "$Name = $Name_prod + BF3 + N2";
	    }
	    $RSD_prod = $mp['RSD'];
	    $LUMO_prod = $mp['LUMO'];
	    $HOMO_prod = $mp['HOMO'];
	    $td = $m[$r];

//    fprintf($out,"Reaction; dG; dH; dS*T; LUMO(src); LUMO(prod); HOMO(src); HOMO(prod); Ring Deviation (src); Ring Deviation (prod); C-N-N; C-N; N-N;\n");
	    fprintf($out,"\"%s\"; %.2f; %.2f; %.2f; %.6f; %.6f; %.6f; %.6f;", $r, $td['dG'], $td['dH'], $td['dST'], $LUMO, $LUMO_prod, $HOMO, $HOMO_prod);
	    fprintf($out," %.4f; %.4f; %.0f; %.4f; %.4f;\n", $RSD, $RSD_prod, $AngCNN, $CN, $NN);

	}
	fclose($f);
    }
    fclose($out);
}

$mtd = read_reactions('TD-All.dat');
make_reactions('php://stdin', $mtd);

?>
