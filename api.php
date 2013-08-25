<?php
require_once 'utils.inc';

if (isset($_REQUEST['method']) && !empty($_REQUEST['method']))  { $method = $_REQUEST['method'];}
if (isset($_REQUEST['apitoken']) && !empty($_REQUEST['apitoken']))  { $apitoken = $_REQUEST['apitoken'];}
if (isset($_REQUEST['name']) && !empty($_REQUEST['name']))  { $name = $_REQUEST['name'];}

//only exec api functions if they exist, else bail with message
if (function_exists($method) && !empty($apitoken) && !empty($name)) {
	$method($apitoken, $name);
} elseif (empty($apitoken) && empty($name))  {
	$method();
} else {
	echo "unsupported API function, please RTFM";
}

//API methods
function getAllUsers() {
	$user_sql = mysql_query("select * from user;");
	$users = array();
	while ($user = mysql_fetch_array($user_sql)) {
		$users[] = $user;
	}
	$users = json_encode($users);
	echo '(' . $users . ')';
}

function insertUser($token, $username) {
	$user_sql1 = "insert into user (id,name) values ('','$username');";
	$user_sql2 = "update tokens set used=used+1 where token='$token';";
	if (valid_token($token)) {
		$result1 = mysql_query($user_sql1);
		$result2 = mysql_query($user_sql2);
		echo "<br>inserted user: $username<br>";
	} else {
		echo "operation not allowed - invalid token<br>";
	}
}

function deleteUser($token, $username) {
	$user_sql1 = "delete from user where name = '$username';";
	$user_sql2 = "update tokens set used=used+1 where token='$token';";
	if (valid_token($token)) {
		$result1 = mysql_query($user_sql1);
		$result2 = mysql_query($user_sql2);
		if (!$result1 && !$result2) {
			echo(mysql_error());
		} else {
			echo "<br>deleted user: $username<br>";
		}
	} else {
		echo "operation not allowed - invalid token<br>";
	}
}
?>