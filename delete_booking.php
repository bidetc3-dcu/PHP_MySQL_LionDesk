<?php

include('session.php');

$hotdesk=$_POST['desk'];
$date=$_POST['date'];
$email=$_POST['email'];

$result=mysqli_query($conn, 'select employee_ID 
								from employees 
								where email = \''.$email.'\'');
$employee_result=mysqli_fetch_array ($result,MYSQLI_ASSOC);								
$employee=$employee_result['employee_ID'];
													 

mysqli_query($conn,'DELETE FROM bookings 
							WHERE employee =\''.$employee.'\'
							AND hotdesk  =\''.$hotdesk.'\'
							AND date =\''.$date.'\'');
							
header('Location: liondesk_book.php');

?>