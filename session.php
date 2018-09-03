<?php
// code copied and adapted from https://www.tutorialspoint.com/php/php_mysql_login.htm
   include('config.php');
   session_start();
   
   $user_check =  $_SESSION['user_email'];
   
   $ses_sql = mysqli_query($conn,"select employee_ID from employees where email = '$user_check' "); 
   
   $row = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
   
   $login_session = $row['employee_ID'];
   
   if(!isset($_SESSION['user_email'])){
      header("location:login.php");
   }
?>