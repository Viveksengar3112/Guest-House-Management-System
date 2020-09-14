<%@ Page Title="Room Details" Language="C#" MasterPageFile="~/Views/admin.Master" AutoEventWireup="true" CodeBehind="RoomDetails.aspx.cs" Inherits="GuestHouse.Views.RoomDetails" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainBody" runat="server">
   <main>
	<div class="container-fluid">
        <div class="mb-4" id="roomDetail">
			<h2 class="mt-4">Room Details</h2>
			<br />
          <div class="table-responsive">
            <table class="table table-striped" id="roomsTable" width="100%" cellspacing="0">
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
              <tbody id="roominfo">			
               <!-- Here I need to figure out how to insert the details of all rooms -->
				  <tr>
                    <td>Delux</td>
                    <td></td>
                    <td>25</td>
                    <td>3</td>
                    <td>1000</td>
                    <td>nice room</td>
                </tr>
              </tbody>
            </table>
          </div>
		 
		  <button type="button" class="btn btn-primary" id="addroom">Add Room</button>
        </div>

        <!-- The new room form starts here -->
        <div class="mt-4" id="formnew" style="display:none;">
            <h2 class="mt-4"> Enter Room Details</h2>
			<br />
			<form role="form" id="newRoom" action="#" method="post">
				<div class="form-group">
					<label class="required" for="room_name">Room Type</label>
					<input type="text" class="form-control" name="room_name" id="room_name" placeholder="Room Type" required>
				</div>
				<div class="form-group">
					<label class="required" for="total_room">Total Rooms</label>
					<input type="text" class="form-control" name="total_room"   id="total_room" placeholder="Number of Rooms" required>
				</div>
				<div class="form-group">
					<label class="required" for="occupancy">Occupancy</label>
					<input type="number" class="form-control" name="occupancy" id="occupancy" placeholder="max number of occupant" required>
				</div>
				<div class="form-group">
					<label class="required" for="rate">Rate</label>
					<input type="number" class="form-control"  name="rate" id="rate" placeholder="Write per day rate in INR" required>
				</div>
				<div class="form-group">
					<label for="desc">Descriptions</label>
					<input type="text" class="form-control" name="desc" id="desc" placeholder="">
				</div>
				<div class="form-group">
					<label for="img">Upload Room Image [recommended size is 400 X 400]: </label>
					<input type="file" id="img" name="img">
				<!-- p class="help-block">Example block-level help text here.</p-->
				<br />
                </div>
                <button type="button" class="btn btn-outline-primary" id="back">Back</button>
                <button type="submit" class="btn btn-default btn-primary">Submit</button>
			</form>
		</div>
	 </div>
	</main>
</asp:Content>
 