<?php
    $host = 'localhost';
	$banco = 'p1';
	$username = 'root';
	$pass = '';

return new PDO('mysql:host='.$host.';dbname='.$banco, $username, $pass,[
        PDO::MYSQL_ATTR_INIT_COMMAND=>'SET NAMES utf8',
        PDO::ATTR_ERRMODE=> PDO::ERRMODE_EXCEPTION
	]
);