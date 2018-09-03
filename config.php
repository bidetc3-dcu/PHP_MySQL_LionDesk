<?php

// Code copied and adapted from https://www.tutorialspoint.com/php/php_mysql_login.htm

   define('DB_SERVER', 'localhost');
   define('DB_USERNAME', 'user'); 
   define('DB_PASSWORD', 'basicuser'); 
   define('DB_DATABASE', 'liondesk1');
   $conn = mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE); 
   
?>
