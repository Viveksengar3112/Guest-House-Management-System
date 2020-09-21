<%@ Page Title="Room Details" Language="C#" MasterPageFile="~/Views/admin.Master" AutoEventWireup="true" CodeBehind="RoomDetails.aspx.cs" Inherits="GuestHouse.Views.RoomDetails" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainBody" runat="server">
   <main>

	<div class="container-fluid">
        <div class="mb-4" id="roomDetail">
            
			<h2 class="mt-4">Room Details</h2>
			<br />
            <form id="formTable"  action="#" runat="server" > 
          <div class="table-responsive">
           <asp:ScriptManager id="ScriptManager2" runat="server" >
           </asp:ScriptManager>
             <asp:UpdatePanel ID ="UpdatePanel3" runat="server">
             <ContentTemplate>  
           <asp:Repeater ID="RoomTable" runat="server" OnItemDataBound="RepeaterItemBound">
            <HeaderTemplate>
            <table class="table table-striped" style= "border: 1px hidden; width: 1200px; border-collapse: separate;
        border-spacing: 0 15px;"  >
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
                     <button ID="btnEdit" runat="server" class="button_glyph" onserverclick="OnEdit" >
                        <span aria-hidden="true" class="fa fa-pencil-alt"></span>
                     </button>&nbsp;&nbsp;
                      <button ID="btnUpdate" runat="server" class="button_glyph" visible="false" onserverclick="OnUpdate"  >
                        <span aria-hidden="true" class="fa fa-check"></span>
                     </button>
                      <button ID="btnCancel" runat="server" class="button_glyph" visible="false" onserverclick="OnCancel">
                        <span aria-hidden="true" class="fa fa-times"></span>
                     </button>&nbsp;&nbsp;
                     <asp:Linkbutton ID="btnDelete" runat="server" class="button_glyph" onClick="OnDelete" OnClientClick="return GetConfirmation();" >
                        <span aria-hidden="true" class="fa fa-trash"></span>
                     </asp:Linkbutton>
                 
                 <td>
                <asp:Label ID="lblRoomID" runat="server" Text='<%# Eval("RoomID") %>' Visible = "false" />
               
                     <asp:Label ID="lblGH" runat="server" Text='<%# Eval("Name") %>' />
                    <asp:DropDownList ID="ddlGH" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="GuestHouseID" Width="120px" Height="25px" Visible="false" ValidationGroup="g1" ></asp:DropDownList>
                 </td>
                 
            <td>
                <asp:Label ID="lblRN" runat="server" Text='<%# Eval("RoomNumber") %>' />
                 <asp:Textbox ID="txtRN" runat="server" Text='<%# Eval("RoomNumber") %>' Visible = "false" Width="50px" />
            </td>
            <td>
                <asp:Label ID="lblRP" runat="server" Text='<%# Eval("RoomPrice") %>' />
                <asp:Textbox ID="txtRP" runat="server" Text='<%# Eval("RoomPrice") %>' Visible = "false" Width="50px"/>
            </td>
                <td>
                <asp:Label ID="lblRC" runat="server" Text='<%# Eval("RoomCapacity") %>' />
                <asp:Textbox ID="txtRC" runat="server" Text='<%# Eval("RoomCapacity") %>' Visible = "false" Width="50px"/>
                </td>
                 
                  <td>
                <asp:Label ID="lblBS" runat="server" Text='<%# Eval("BookingStatus") %>' />
                <asp:DropDownList ID="ddlBS" runat="server" AutoPostBack="True" DataTextField="BookingStatus" DataValueField="BookingStatusID" Width="120px" Height="25px" Visible="false" ValidationGroup="g1" ></asp:DropDownList>

                </td>
                  
                  <td>
                <asp:Label ID="lblRT" runat="server" Text='<%# Eval("RoomType") %>' />
                <asp:DropDownList ID="ddlRT" runat="server" AutoPostBack="True" DataTextField="RoomType" DataValueField="RoomTypeID" Width="120px" Height="25px" Visible="false" ValidationGroup="g1" ></asp:DropDownList>
                </td>
                 
                  <td>
                <asp:Label ID="lblRD" runat="server" Text='<%# Eval("RoomDescription") %>' />
                <asp:Textbox ID="txtRD" runat="server" Text='<%# Eval("RoomDescription") %>' Visible = "false" Width="100px" />
                </td>
                 <asp:RequiredFieldValidator InitialValue="0" ID="Req_ID" Display="Dynamic" 
                         ValidationGroup="g1" runat="server" ControlToValidate="ddlRT"
                            Text="*" ErrorMessage="ErrorMessage"></asp:RequiredFieldValidator>

        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
              </ContentTemplate>
                    </asp:UpdatePanel>   
              <br \>
                
          </div>
                
                 <asp:button type="button" class="btn btn-primary" id="addroom"  runat="server" PostBackUrl="~/Views/AddRooms.aspx" Text="Add Room"></asp:button>
		 </form>
		 
            
        </div> 
       </div>
  <script type="text/javascript">
  function GetConfirmation()
  {
      var reply = confirm("Are you sure you want to delete this room?");
      if(reply)
      {
         return true;
      }
      else
      {
         return false;
      }
  }
  </script>
       
	</main>
</asp:Content>
 