<?php
include('session.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Adaptive -->
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1"> 
	<!-- code adapted from https://www.w3schools.com/bootstrap/bootstrap_get_started.asp -->
	<title>LionDesk - Book A HotDesk</title>
	<!-- Bootstrap Elements -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body>
	<div class="container"> 

	<div class="tab-content">
	

    <div id="home" class="tab-pane fade in active" style="homepage">
		<br>
		
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-primary">
						<div class="panel-heading" style="text-align:center;"><h2>LIONBRIDGE HOTDESK BOOKING SYSTEM</h2></div>
					</div>
					<div class="panel panel-info" >
						<div class="panel-heading">
						<h4>
							<i class="glyphicon glyphicon-user" style="padding:16px;font-size:30px;"></i>
							<?php print $_SESSION['user_email']; 
									if ($_SESSION['user_role'] == 'superuser')
									{
										print "<a href=\"liondesk_dashboard.php\"><p style=\"float:right;margin-right:16px;\"><i class=\"glyphicon glyphicon-dashboard\" style=\"text-align:right;padding:16px;font-size:30px;\"></i>
										Usage Dashboard</p></a>";
									} 
							?>
						</h4>
						</div>
					</div>		
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="panel panel-default">
					<div class="panel-heading">
											1. Select and submit the date. The available desks will be displayed.
											<br>2. Click on the desired desk button to book it.
					</div>
																											
					<div class="container">
						<form id="bookingform" method="post">
							<span class="glyphicon glyphicon-calendar" style="padding:16px;font-size:30px;"></span>						    
							<input type="date" id="datePicker" name="bookingdate" min="2018-04-03" max="2018-06-30" value="<?php echo $bookingdate;?>">
							<input type="submit" value="Check availability" style="margin-left:20px">
						</form>
					</div>
											
					<!-- If the form has been submitted, display the desks available on this date --> 
					<?php 	if(isset($_POST['bookingdate'])){ //check if form was submitted
						
						$date = $_POST['bookingdate']; //get input date
						print "<div class=\"panel-heading\" style=\"text-align:center;font-weight:bold;color:green\">Desks available on ".$date."<br></div>						
						<!-- Start of the table displaying the Hotdesks to be booked -->
						<table class=\"table\">
							<thead>
							  <tr>
								<th>Desk ID</th>
								<th>Floor #</th>
								<th>Picture</th>
								<th></th>
							  </tr>
							</thead>
						<tbody>";

						
							// If the user has not selected any date yet, the date will be today's date by default
						
							//$date = $_POST['bookingdate'];

							// Query the database: check which desks are available on this date
							$result=mysqli_query($conn, 'select * 
															from hotdesks 
															where hotdesk_ID not in (select hotdesk
																				from bookings
																				where date = \''.$date.'\') 
															order by floor_location'); 
							
														
							
								while ($reservations=mysqli_fetch_array ($result,MYSQLI_ASSOC))
									{	
						
										print "
												<!-- code adapted from https://stackoverflow.com/questions/27573676/php-post-a-specific-query-result-into-another-php -->
												<form action=\"insert_booking.php\" method=\"post\">
												
												<tr>
												<td><input type=\"hidden\" name=\"date\" value=\"".$date."\">
													<input type=\"hidden\" name=\"email\" value=\"".$_SESSION['user_email']."\">
													<input type=\"submit\" name=\"desk\" value=\"".$reservations['hotdesk_ID']."\">
													
												</form>
												</td>
												<td>".$reservations['floor_location']."</td>
												<td><img src=\"Pictures/".$reservations['picture']."\" alt=\"Picture of the hotdesk\" width=\"64\" height=\"64\"></td>
												</tr>"; 
									}
						
						print "</tbody></table></div></div>";
					}
					else {
						print "</div></div>";
					}
				?>	
				<div class="col-sm-1">
				</div>
				
				<div class="col-sm-5">
					<div class="panel panel-default">
					<div class="panel-heading" style="text-align:center;font-weight:bold;">MY BOOKINGS</div>
					<!-- Start of the table displaying the user's bookings -->
					<table class="table">
						<thead>
						  <tr>
							<th>Desk ID</th>
							<th>Floor #</th>
							<th>Picture</th>
							<th>Date</th>
							<th></th>
						  </tr>
						</thead>
						<tbody>

						<?php

							$result=mysqli_query($conn, 'select bookings.hotdesk, hotdesks.floor_location, hotdesks.picture, bookings.date
															from bookings
															inner join hotdesks on bookings.hotdesk = hotdesks.hotdesk_ID
															where employee = \''.$_SESSION['user_ID'].'\'
															order by bookings.date'); 
															
							
							while ($myreservations=mysqli_fetch_array ($result,MYSQLI_ASSOC))
								{				
								
								
								print "<tr>
										<td>".$myreservations['hotdesk']."</td>
										<td>".$myreservations['floor_location']."</td>
										<td><img src=\"Pictures/".$myreservations['picture']."\" alt=\"Picture of the hotdesk\" width=\"64\" height=\"64\"></td>
										<td>".$myreservations['date']."</td>
										<td> 
											<form action=\"delete_booking.php\" method=\"post\">
											<input type=\"hidden\" name=\"email\" value=\"".$_SESSION['user_email']."\">
											<input type=\"hidden\" name=\"date\" value=\"".$myreservations['date']."\">
											<input type=\"hidden\" name=\"desk\" value=\"".$myreservations['hotdesk']."\">
											<button type=\"submit\" class=\"btn\"><i class=\"glyphicon glyphicon-remove\"></i></button></td>
											</form>
										</tr>"; 
								}
							
						?>	
						</tbody>
					</table>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>