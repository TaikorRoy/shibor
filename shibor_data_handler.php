<?php
$servername = "localhost";
$username = "root";
$password = "";

$json = file_get_contents('php://input');
$data = json_decode($json, true);
$request_validation = array_key_exists("term", $data)&&array_key_exists("rate", $data);

if ($request_validation)
{
	$con = mysql_connect($servername, $username, $password);
	if (!$con)
	  {
		  die('Could not connect: ' . mysql_error());
		  echo 'Could not connect DB';
	  }
	else
	  {
		mysql_select_db("shibor", $con);
		$sql = "INSERT INTO shibor (term, rate, shifting, linkurl, issuetime) VALUES ('$data[term]', '$data[rate]', '$data[change]', '$data[linkurl]', '$data[issuetime]')";
		mysql_query($sql);
		mysql_close($con);
		echo "Php Update DB Success !";
	  }
}
else
{
    echo "Invalid Request";
}
?>