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
           
              
           <asp:Repeater ID="RoomTable" runat="server">
            <HeaderTemplate>
            <table class="table table-striped" style= "border: 1px hidden; width: 1200px; border-collapse: separate;
        border-spacing: 0 15px;" cellpadding="0" >
            <tr style="background-color: #007bff; color: white; font-size: large; font-weight: bold;  text-align: center; vertical-align: middle;">

                 <th scope="col" style="width: 200px">
                    Action
                </th>
                <th scope="col" style="width: 200px">
                    Guest House Name
                </th>
                <th scope="col" style="width: 200px">
                    Room Number
                </th>
                <th scope="col" style="width: 200px">
                    Room Price
                </th>
                <th scope="col" style="width: 200px">
                    Room Capacity
                </th>
                 <th scope="col" style="width: 200px">
                    Booking Status
                </th>
                 <th scope="col" style="width: 200px">
                    Room Type
                </th>
                 <th scope="col" style="width: 200px">
                    Room Description
                </th>
            </tr>
           </HeaderTemplate>
            <ItemTemplate>
             <tr>
                  <td>
                     <button ID="btnEdit" runat="server" class="button_glyph"  >
                        <span aria-hidden="true" class="glyphicon glyphicon-pencil"></span>
                     </button>&nbsp;&nbsp;
                      <button ID="btnUpdate" runat="server" class="button_glyph" visible="false"  >
                        <span aria-hidden="true" class="glyphicon glyphicon-ok"></span>
                     </button>&nbsp;&nbsp;
                      <button ID="btnCancel" runat="server" class="button_glyph" visible="false"  >
                        <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
                     </button>&nbsp;&nbsp;
                     <button ID="btnDelete" runat="server" class="button_glyph" onserverclick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" >
                        <span aria-hidden="true" class="glyphicon glyphicon-trash"></span>
                     </button>
                  </td>
                 <td>
                <asp:Label ID="lblRoomID" runat="server" Text='<%# Eval("RoomID") %>' Visible = "false" />
                <asp:Label ID="lblGH" runat="server" Text='<%# Eval("Name") %>' />
                <asp:Textbox ID="txtGH" runat="server" Text='<%# Eval("Name") %>' Visible = "false" />
                </td>
            <td>
                <asp:Label ID="lblRN" runat="server" Text='<%# Eval("RoomNumber") %>' />
                 <asp:Textbox ID="txtRN" runat="server" Text='<%# Eval("RoomNumber") %>' Visible = "false" />
            </td>
            <td>
                <asp:Label ID="lblRP" runat="server" Text='<%# Eval("RoomPrice") %>' />
                <asp:Textbox ID="txtRP" runat="server" Text='<%# Eval("RoomPrice") %>' Visible = "false" />
            </td>
                <td>
                <asp:Label ID="lblRC" runat="server" Text='<%# Eval("RoomCapacity") %>' />
                <asp:Textbox ID="txtRC" runat="server" Text='<%# Eval("RoomCapacity") %>' Visible = "false" />
                </td>
                  <td>
                <asp:Label ID="lblBS" runat="server" Text='<%# Eval("BookingStatus") %>' />
                <asp:Textbox ID="txtBS" runat="server" Text='<%# Eval("BookingStatus") %>' Visible = "false" />
                </td>
                  <td>
                <asp:Label ID="lblRT" runat="server" Text='<%# Eval("RoomType") %>' />
                      <asp:Textbox ID="txtRT" runat="server" Text='<%# Eval("RoomType") %>' Visible = "false" />
                </td>
                  <td>
                <asp:Label ID="lblRD" runat="server" Text='<%# Eval("RoomDescription") %>' />
                <asp:Textbox ID="txtRD" runat="server" Text='<%# Eval("RoomDescription") %>' Visible = "false" />
                </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
                
              <br \>
                
          </div>
		 
		  <button type="button" class="btn btn-primary" id="addroom">Add Room</button>
            
        </div> 
        </div>

        <!-- The new room form starts here -->
        <div class="mt-4" id="formnew" style="display:none; padding-left :20px">
            <h2 class="mt-4"> Enter Room Details</h2>
			<br />
			<form role="form" id="newRoom" action="#" method="post" runat="server" >
				<asp:ScriptManager id="ScriptManager2" runat="server" >
                 </asp:ScriptManager>
        
                    <asp:UpdatePanel ID ="UpdatePanel1" runat="server">
                        <ContentTemplate>
                             <div class="form-group">
					            <label class="required" for="guest_house">Guest House</label>
                                <asp:DropDownList ID="DropDownListGH" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="GuestHouseID" Width="120px" Height="25px"></asp:DropDownList>
				        	<!--<input type="text" class="form-control" name="room_type" id="room_type" placeholder="Room Type" required> -->
				            </div>
                            <div class="form-group">
				        	<label class="required" for="room_type">Room Type</label>
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
                <button type="button" class="btn btn-outline-primary" id="back">Back</button>
                <button type="submit" class="btn btn-default btn-primary" id="submitBtn" onclick="submitBtn_click">Submit</button>
			</form>
		</div>
	 
	<script type="text/javascript">
        $(document).ready(function () {
            LoadRoomDetails();
            $("#addroom").click(function () {
                $("#formnew").toggle();
                $("#roomDetail").toggle();
            });
            $("#back").click(function () {
                $("#formnew").toggle();
                $("#roomDetail").toggle();
            });

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

                url: 'RoomDetails.aspx/SaveRoomDetails',
                data: JSON.stringify({ roomData: JSON.parse(JSON.stringify(room)) }),
                success: function (result) {
                    alert('success');
                    ResetRoomInformation();
                    this.BindRepeater();
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
 