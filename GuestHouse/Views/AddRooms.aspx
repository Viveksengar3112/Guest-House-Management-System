<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" AutoEventWireup="true" CodeBehind="AddRooms.aspx.cs" Inherits="GuestHouse.Views.AddRooms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainBody" runat="server">
     <!-- The new room form starts here -->
    <main>
        <div class="mt-4" id="formnew"  >
            
			
			<form role="form" id="newRoom" action="#" method="post" runat="server" style="margin-left:15px" >
                <h2 class="mt-4"> Enter Room Details</h2>
                <br />
				
                      <asp:ScriptManager id="ScriptManager2" runat="server" >
                        </asp:ScriptManager>
                    <asp:UpdatePanel ID ="UpdatePanel1" runat="server">
                        <ContentTemplate>
                             <div class="form-group">
					            <label class="required" for="guest_house">Guest House  </label>&nbsp;&nbsp;&nbsp;&nbsp; 
                                <asp:DropDownList ID="DropDownListGH" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="GuestHouseID" Width="120px" Height="25px"></asp:DropDownList>
				        	<!--<input type="text" class="form-control" name="room_type" id="room_type" placeholder="Room Type" required> -->
				            </div>
                            <div class="form-group">
				        	<label class="required" for="room_type">Room Type   </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="DropDownListRoom" runat="server" AutoPostBack="True" DataTextField="RoomType" DataValueField="RoomTypeID" Width="120px" Height="25px"></asp:DropDownList>
					        <!--<input type="text" class="form-control" name="room_type" id="room_type" placeholder="Room Type" required> -->
				            </div>
                            <div class="form-group">
				    	    <label class="required" for="booking_status">Booking Status</label>
                            <asp:DropDownList ID="DropDownListBS" runat="server" AutoPostBack="True" DataTextField="BookingStatus" DataValueField="BookingStatusID" Width="120px" Height="25px"></asp:DropDownList>
					        <!--<input type="text" class="form-control" name="booking_status" id="booking_status" placeholder="Booking Status" required> -->
				            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
               
               
				<div class="form-group">
					<label class="required" for="total_room">Room Number</label>
					<input type="text" class="form-control" name="room_number" id="room_number" placeholder="Room Number" required>
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
				<!--<div class="form-group">
					<label for="img">Upload Room Image [recommended size is 400 X 400]: </label>
					<input id="img" type="file" class="form-control" name="img" title="load image"  >
                    <img id="imgRoom" height="150" width="150" style="border:solid" />
				 p class="help-block">Example block-level help text here.</p
				<br />
                </div>--> 
      <asp:button type="button" class="btn btn-primary" id="addroom"  runat="server" Text="Back" OnClientClick="javascript:window.location.href='RoomDetails.aspx'; return false;"></asp:button>

                <button type="submit" class="btn btn-default btn-primary" id="submitBtn" >Submit</button>
			</form>
		</div>
	
	<script type="text/javascript">
        $(document).ready(function () {
           /* LoadRoomDetails();
            $("#addroom").click(function () {
                $("#formnew").toggle();
                $("#roomDetail").toggle();
            });
            $("#back").click(function () {
                $("#formnew").toggle();
                $("#roomDetail").toggle();
            });
            */
            $("#submitBtn").click(function (e) {
                e.preventDefault();
                console.log("hello!");

                var room = {};
               // console.log(DropDownListRoom.SelectedItem.Value);
                room.RoomPrice = $("#rate").val();
                room.RoomNumber = $("#room_number").val();
                room.RoomCapacity = $("#occupancy").val();
                room.RoomDescription = $("#desc").val();
                room.RoomTypeID = $("#<%=DropDownListRoom.ClientID%> option:selected").val();
                room.BookingStatusID = $("#<%=DropDownListBS.ClientID%> option:selected").val();
                room.GuestHouseID = $("#<%=DropDownListGH.ClientID%> option:selected").val();
                //room.InputImage = $("#img").get(0).files[0];

            $.ajax({
                type: "POST",

                contentType: 'application/json;charset=utf-8',

                url: 'AddRooms.aspx/SaveRoomDetails',
                data: JSON.stringify({ roomData: JSON.parse(JSON.stringify(room)) }),
                success: function (result) {
                    alert('success');
                    ResetRoomInformation();
                   
                },
                error: function (result) {
                    alert(result.responseText);
                }
            });


        });

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

        function LoadRoomDetails() {
            $.ajax({
                async: true,
                data: 'GET',
                dataType: 'HTML',
                contentType: false,
                processData: false,
                url: 'RoomDetails.aspx/GetRoomDetails',
                success: function (data) {
                },
                error: function () {
                    alert('There is an error in the request.');
                }
            });

        }

        function ResetRoomInformation() {
            $("#rate").val('');
            $("#room_number").val('');
            $("#occupancy").val('');
            $("#desc").val('');
            $("#<%=DropDownListRoom.ClientID%> option:selected").removeAttr('selected');
            $("#<%=DropDownListBS.ClientID%> option:selected").removeAttr('selected');
            $("#<%=DropDownListGH.ClientID%> option:selected").removeAttr('selected');
            $("#room_number").focus();
        }

    </script>
        </main>
</asp:Content>
