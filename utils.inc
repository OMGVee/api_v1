<?php
//connect db
echo "a";
mysql_connect("localhost","root","V1ctor*2011!") or die(mysql_error());
mysql_select_db("test") or die(mysql_error());
//who cares about closing fucking db connections these days, really =)
//this is just a short demo of a simple API, not production shit, so sue me

//validate token and limits against db (provided you leave the db connection code above this, like a good girl)
function valid_token($token) {
	//returns true or false if token is valid and per method call limit is not reached
	$token = strip_tags(stripslashes($token));
	$sql = "select * from tokens where token='$token'";
	$result = mysql_query($sql);
	if (mysql_num_rows($result) == 1 ) {
		while ($row=mysql_fetch_array($result)) {
			$dbtoken = $row['token'];
			$limit = $row['limit'];
			$used = $row['used'];
			if ($limit >= $used) {
				$valid = true;
			} else {
				$valid = false;
				echo "<br>token limit reached<br>";
			}
		}
		$found = true;
	} else {
		$found = false;
	}
	if ($found && $valid) {
		return true;
	} else {
		return false;
	}
}

?>
