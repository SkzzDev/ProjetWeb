<?php

session_start();

if (isset($_SESSION['auth']))
    unset($_SESSION['auth']);

header("location: index.php");
$protocol = (isset($_SERVER["SERVER_PROTOCOL"])) ? $_SERVER["SERVER_PROTOCOL"] : "HTTP/1.0";
header($protocol . " 301 Moved Permanently");

exit();