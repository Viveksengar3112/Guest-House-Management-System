﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RoomDetails.aspx.cs" Inherits="GuestHouse.Views.RoomDetails" %>

<!DOCTYPE html>

<html lang="en">
	<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">

    <title>Admin Dashboard</title>
	<link href="../css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
	<script type= "text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/dashboard.css" rel="stylesheet">
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

	

 </head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="index.html">Start Bootstrap</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a>
					<a class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="login.html">Logout</a>
				</div>
			</li>
		</ul>
	</nav>

	<!-- Side NAV Bar -->
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<!-- Core -->
						<!-- <div class="sb-sidenav-menu-heading">Core</div> -->
						<a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
							Dashboard
						</a>
						<a class="nav-link" href="roomDetails.html">
							<div class="sb-nav-link-icon"><i class="fas fa-bars"></i></div>
							Room Details
						</a>
					</div>
				</div>

				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					<!-- This needs to be dynamicly updated -->
					User Name
				</div>
			</nav>
		</div>
    <div class="container-fluid">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="roomDetail">
          <h2 class="sub-header">Room Details</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Room Type</th>
                  <th>Thumbnail</th>
                  <th>Total Rooms</th>
			      <th>Occupancy</th>
                  <th>Rate</th>
                  <th>Description</th>
                </tr>
              </thead>
              <tbody id="roominfo"  >			
               <!-- Here I need to figure out how to insert the details of all available rooms -->
              </tbody>
            </table>
          </div>
		 
		  <button type="button" class="btn" id="addroom">Add Room</button>
        </div>
        <!-- The new room form starts here -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="divForm" style="display:none;">
            <h2 class="sub-header">Enter Room Details</h2>
					<form role="form" id="formRoom" action="#" method="post">
					  <div class="form-group">
						<label for="room_name">Room Number</label>
						<input type="text" class="form-control" name="inputRoomNumber" id="inputRoomNumber" placeholder="Room Number" required>
					  </div>
					  <div class="form-group">
						<label for="total_room">Room Type </label>
						<input type="number" class="form-control" name="inputRoomType"   id="inputRoomType" placeholder="enter" required>
					  </div>
					   <div class="form-group">
						<label for="occupancy">Occupancy</label>
						<input type="number" class="form-control" name="occupancy" id="inputRoomCapacity" placeholder="Max number of occupants" required>
					  </div>
					  <div class="form-group">
						<label for="rate">Rate</label>
						<input type="number" class="form-control"  name="rate" id="inputRoomPrice" placeholder="Write per day rate in INR" required>
					  </div>
					  <div class="form-group">
						<label for="BookingStatus">Booking Status </label>
						<input type="number" class="form-control" name="inputBookingStatus"   id="inputBookingStatus" placeholder="enter" required>
					  </div>
					  <div class="form-group">
						<label for="GuestHouseID">Guest House </label>
						<input type="number" class="form-control" name="inputGuestHouse"   id="inputGuestHouse" placeholder="enter" required>
					  </div>
					  <div class="form-group">
						<label for="desc">Descriptions</label>
						<input type="text" class="form-control" name="desc" id="inputRoomDescription" placeholder="">
					  </div>
					  <div class="form-group">
						<label for="img">Upload Room Image [recommended size is 400 X 400]</label>
						<input type="file" id="InputImage" class="form-control" name="roomImage" title="Load Image" onchange="DisplayImage(this)" />
                        <img id="imgRoom" height="100" width="100" style="border:solid" />

						<!-- p class="help-block">Example block-level help text here.</p-->
                      </div>
                      <button type="button" class="btn" id="back">Back</button>
                      <button type="submit" class="btn btn-default" id="submitBtn">Submit</button>
					</form>
		</div>
		
      </div>
    </div>

  <script type="text/javascript">
      $(document).ready(function () {
          $("#addroom").click(function () {
              $("#divForm").toggle();
              $("#roomDetail").toggle();
          });
          $("#back").click(function () {
              $("#divForm").toggle();
              $("#roomDetail").toggle();
		  });

		  $("#submitBtn").click(function () {
			  saveRoomData();
		  });

	  });

	  function saveRoomData() {
		  var formData = new FormData;
		  formData.append("RoomNumber", $("#inputRoomNumber").val());
		  formData.append("RoomPrice", $("#inputRoomPrice").val());
		  formData.append("BookingStatusID", $("#inputBookingStatus").val());
		  formData.append("RoomTypeID", $("#inputRoomType").val());
		  formData.append("RoomCapacity", $("#inputRoomCapacity").val());
		  formData.append("RoomDescription", $("#inputRoomDescription").val());
		  formData.append("GuestHouseID", $("#inputGuestHouse").val());
		  formData.append("Image", $("#InputImage").get(0).files[0]);
		  
		
		 /* var room = {};
		  room.RoomNumber = $("#inputRoomNumber").val();
		  room.RoomPrice = $("#inputRoomPrice").val();
		  room.BookingStatusID = $("#inputBookingStatus").val();
		  room.RoomTypeID = $("#inputRoomType").val();
		  room.RoomCapacity = $("#inputRoomCapacity").val();
		  room.RoomDescription = $("#inputRoomDescription").val();
		  room.GuestHouseID = $("#inputGuestHouse").val();
		  room.Image = $("#inputImage").get(0).files[0];
		  */
		  $.ajax({
			  type: "POST",
			  contentType: false,
			  processData: false,
              data: formData,
              url: 'RoomDetails.aspx/SaveRoomDetails',
			  success: function (data) {
                  alert('success');
			  },
			  error: function () {
				  alert('error');
			  }
		  })

      }


      function moredetail(id) {
          var x = "booking" + id;
          document.getElementById(x).style.display = "block";
      }

      $('.delete').click(function () {
          return confirm("Are you sure you want to delete?");
      });

      function DisplayImage(result) {
          if (result.files && result.files[0]) {
             // console.log("hello");
              var fileReader = new FileReader;
              fileReader.onload = function (e) {
                  $("#imgRoom").attr('src', e.target.result);
              }
              fileReader.readAsDataURL(result.files[0]);
          }
      }


  </script>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>
