<?php

// code copied and adapted from https://www.tutorialspoint.com/php/php_mysql_login.htm

   include("config.php");
   session_start();
   $error="";
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      
	  // email and password sent from form 
      
      $myusername = mysqli_real_escape_string($conn,$_POST['email']); 
      $mypassword = mysqli_real_escape_string($conn,$_POST['password']); 
      
      $sql1 = "SELECT employee_ID FROM employees WHERE email = '$myusername' and password = '$mypassword'";
      $result1 = mysqli_query($conn,$sql1); 
      $row1 = mysqli_fetch_array($result1,MYSQLI_ASSOC);
      $user_ID = $row1['employee_ID'];
      
      $count = mysqli_num_rows($result1);
      
      // If result matched $myusername and $mypassword, table row must be 1 row
		
      if($count == 1) {
      //   set session variables
        $_SESSION['user_email'] = $myusername;
		$_SESSION['user_password'] = $mypassword;
		$_SESSION['user_ID'] = $user_ID;
		
		$sql2 = "SELECT employee_role FROM employee_roles WHERE employee = '$user_ID'";
		$result2 = mysqli_query($conn,$sql2); 
		$row2 = mysqli_fetch_array($result2,MYSQLI_ASSOC);
		$_SESSION['user_role'] = $row2['employee_role'];
		
         
         header("location: liondesk_book.php");
      }else {
         $error = "Your Email or Password is invalid";
      }
   }
?>
<html>
   
   <head>
	   <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1"> 
		<!-- code adapted from https://www.w3schools.com/bootstrap/bootstrap_get_started.asp 
			and
			https://www.w3schools.com/bootstrap/bootstrap_forms.asp -->
			
		<title>Liondesk Login Page</title>
		
		<!-- Bootstrap Elements -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
   </head>
  
   <body>
	<div align = "left" class="container">
	  <h2>Login</h2>
		<form action = "" method = "post">
		<div class="form-group">
		  <label for="email">Email:</label>
		  <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
		</div>
		<div class="form-group">
		  <label for="pwd">Password:</label>
		  <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password">
		</div>
		<button type="submit" class="btn btn-default">Submit</button>
	  </form>
	   <div style = "font-size:11px; color:#cc0000; margin-top:10px"><?php echo $error; ?></div>
	</div>
   </body>
</html>