<?php


include('session.php');
							

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Adaptive -->
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1"> 
	<!-- code adapted from https://www.w3schools.com/bootstrap/bootstrap_get_started.asp -->
	<title>LionDesk - Usage Dashboard</title>
	<!-- Bootstrap Elements -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- Template from w3schools, adapted from code at https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_templates_analytics&stacked=h -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
	</style>

</head>
<body class="w3-light-grey">
<div class="button" style="margin-left:30px;margin-top:30px">
<script>
	<!-- code copied from https://stackoverflow.com/questions/8814472/how-to-make-an-html-back-link -->
    document.write('<a href="' + document.referrer + '">Back to Bookings</a>');
</script>
</div>

<?php

$hotdesk_quantity;
$hotdesk_pc_in_use_today;
$hotdesk_usage_yeartodate;
$hotdesk_most_popular;

// Retrieve the total number of hotdesks from the database

$result = mysqli_query($conn, 'select count(*)
								from hotdesks ');
$results = mysqli_fetch_array ($result, MYSQLI_NUM);
$hotdesk_quantity = $results[0];


/* Percentage of hotdesks in use today */

$date=date("Y-m-d");  //today's date

// Retrieve the number of bookings for today's date from the database
$result = mysqli_query($conn, 'select count(*)
								from bookings 
								where date = \''.$date.'\'');
$myresults = mysqli_fetch_array ($result, MYSQLI_NUM);
$hotdesk_in_use_today = (float)$myresults[0];

// Calculate the % of booked desks compared to total number of desks
$hotdesk_pc_in_use_today = $hotdesk_in_use_today / $hotdesk_quantity;

/* Percentage of hotdesks in use for the current year, year-to-date */
 
// I used the solution explained at https://stackoverflow.com/questions/9186741/sql-query-where-dates-year-is-year
$year = date("Y"); //The current year
// Retrieve the total number of bookings made in the current year from the database
$result = mysqli_query($conn, 'select count(*)
								from bookings 
								WHERE date BETWEEN \''.$year.'-01-01\' AND \''.$year.'-12-31\'');		
$myresults = mysqli_fetch_array ($result, MYSQLI_NUM);
$total_bookings_yeartodate = $myresults[0];

// Next Line of Code adapted from https://stackoverflow.com/questions/25906836/how-to-get-the-first-day-of-the-current-year
// Create the date of the first of January of the current year
$date_first_day_of_year =new DateTime('first day of january this year');
$first_of_year = $date_first_day_of_year ->format("Y-m-d");

//Create today's date object
$today = date_create_from_format("Y-m-d", $date);
//Calculate the interval between today and 1st January
$days_diff = date_diff($today, $date_first_day_of_year);
//Express this interval in days (integer)
$days_diff_number = (int) $days_diff->format('%a') + 1;
// Calculate the percentage of hotdesks utilisation since the beginning of the year until today
$hotdesk_utilisation_YTD_pc = $total_bookings_yeartodate / ($hotdesk_quantity * $days_diff_number);

/* Most popular desk */
// Retrieve the ID, picture and floor location of the hotdesk which is most often booked from the database
$result = mysqli_query($conn, 'select hotdesk_ID, picture, floor_location
								from hotdesks
								inner join
								(select count(*) as nb_bookings, hotdesk
										from bookings
										group by hotdesk
										order by nb_bookings DESC
										limit 1) as T
								on T.hotdesk = hotdesks.hotdesk_ID
								');
$myresults = mysqli_fetch_array ($result, MYSQLI_ASSOC);
$hotdesk_most_popular_ID= $myresults['hotdesk_ID'];
$hotdesk_most_popular_pic= $myresults['picture'];

// Create different message to print on screen depending on the floor number. For better UX only.
switch ($myresults['floor_location']) {
    case 0:
        $hotdesk_most_popular_floor="Ground floor";
        break;
    case 3:
        $hotdesk_most_popular_floor="Third floor";
        break;
    case 4:
        $hotdesk_most_popular_floor="Fourth floor";
        break;
    default:
        $hotdesk_most_popular_floor="";
}

/* Floor repartition of hotdesk usage */
$result = mysqli_query($conn, 'select count(*) as bookings_per_floor, floor_location 
										from
											(select hotdesk, floor_location
											from bookings
											left join
											hotdesks
											on hotdesk = hotdesk_ID) as T
										group by floor_location
										order by floor_location
									');
$row1=mysqli_fetch_array ($result,MYSQLI_ASSOC);	
$bookings_ground_floor = $row1['bookings_per_floor'];
$row2=mysqli_fetch_array ($result,MYSQLI_ASSOC);	
$bookings_third_floor = $row2['bookings_per_floor'];

$row3=mysqli_fetch_array ($result,MYSQLI_ASSOC);	
$bookings_fourth_floor = $row3['bookings_per_floor'];

?>	
	
	<!-- Header -->
  <header class="w3-container" style="padding-top:16px">
    <h5><b><i class="fa fa-dashboard"></i> My Dashboard</b></h5>
  </header>

  <div class="w3-row-padding w3-margin-bottom">
    <div class="w3-quarter">
      <div class="w3-container w3-red w3-padding-16">
        <div class="w3-left"></div>
        <div class="w3-right">
          <h3><?php print $hotdesk_quantity; ?></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Hotdesks</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-blue w3-padding-16">
        <div class="w3-left"></i></div>
        <div class="w3-right">
			<!-- Display the percentage of desks used today -->
          <h3><?php printf("%.0f%%", $hotdesk_pc_in_use_today * 100); ?></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>In Use Today</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-teal w3-padding-16">
        <div class="w3-left"></div>
        <div class="w3-right">
          <h3><?php printf("%.0f%%",$hotdesk_utilisation_YTD_pc* 100);?></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Usage YTD</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-orange w3-text-white w3-padding-8">
        <div class="w3-left"></div>
        <div class="w3-right">
          <h3 style="float:left;"><?php print $hotdesk_most_popular_ID
							."<img style=\"margin-left:8px;margin-right:8px;\" src=\"Pictures/".$hotdesk_most_popular_pic."\" alt=\"Picture of the hotdesk\" width=\"64\" height=\"64\">"
							.$hotdesk_most_popular_floor; ?></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>#1 Hotdesk</h4>
      </div>
    </div>
	</div>
	<div class="row">
	<div class="col-sm-6">
	<!-- Code for the pie-chart adapated from https://www.w3schools.com/howto/tryit.asp?filename=tryhow_google_pie_chart -->
	<h5 class="piechartheader w3-text" style="margin-left:24px"><b>Floor repartition of hotdesk usage</b></h5>
	<div id="piechart" style="float:center";>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	// Load google charts
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	// Draw the chart and set the chart values
	function drawChart() {
	  var data = google.visualization.arrayToDataTable([
	  ['Floor', '% of total usage'],
	  ['Ground Floor', <?php print($bookings_ground_floor);?>],
	  ['3rd Floor', <?php print($bookings_third_floor);?>],
	  ['4th Floor', <?php print($bookings_fourth_floor);?>]
	]);

  // Set the width and height of the chart, and other options
  var options = {
		width:400,
		height:400,
	  backgroundColor:'#f1f1f1',
	  chartArea:{left:32,top:10,width:'80%',height:'80%'},
	  legend:{position:'bottom'}
	  };

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>	
</div>
</div>
<div class="col-sm-6">
<div class="w3-container">
    <h5><b>Top Users</b></h5>
    <ul class="w3-ul w3-card-4 w3-white">
		<?php	
		/* Top users */
		$result = mysqli_query($conn, 'select count(*) as nb_bookings, email  
												from
													(select employee, email
													from bookings
													left join
													employees
													on employee = employee_ID) as T
												group by email
												order by nb_bookings DESC
												limit 5
											');
		while ($topusers=mysqli_fetch_array ($result,MYSQLI_ASSOC))
			{	
			print "<li class=\"w3-padding-16\">        
					<span class=\"w3-xlarge\">".$topusers['email']."</span><br>
				  </li>";
			}		  
	  ?>
    </ul>
  </div>
</div>
</div>
</body>
</html>