<?php

$host = "mysql-skzzdev.alwaysdata.net"; /* Host name */
$user = "skzzdev"; /* User */
$pass = "ltg04MBp05"; /* Password */
$dbname = "skzzdev_db"; /* Database name */

$con = mysqli_connect($host, $user, $pass, $dbname);

// Check connection
if (!$con) {
	die("Connection failed: " . mysqli_connect_error());
}