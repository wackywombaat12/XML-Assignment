<?php
	header("Cache-Control: no-cache");
	header("Expires: -1");
	
	$username = $_POST["username"]; 
    $password = $_POST["password"];  

$xmlDoc = new DOMDocument();
$xmlDoc->preserveWhiteSpace = false;
$xmlDoc->load("staff.xml");  

$root = $xmlDoc->documentElement;

$found = false;
print $root->childNodes->firstChild->nodeValue;

foreach ($root->childNodes AS $item)
  {
	$user = $item->firstChild->nodeValue;
	$pass = $item->lastChild->nodeValue;
	
	if($username == $user and $password == $pass )
	{
	$found = true; 
	break;
	}
	else {
	$found = false;
	}
} if($found == false){
	print "not found";
	} else { 
	session_start();
		$_SESSION["username"] = $username;
	header("location: default.php");
	}
  
  
?>