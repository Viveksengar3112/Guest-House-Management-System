<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" AutoEventWireup="true" CodeBehind="AddBookings.aspx.cs" Inherits="GuestHouse.Views.AddBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#<%= booking_from.ClientID %>").datepicker();
            $("#<%= booking_to.ClientID %>").datepicker();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainBody" runat="server">
    <div class="container-fluid">
        <div class="mt-4" id="formnew">

            <form role="form" id="newRoom" action="#" method="post" runat="server" style="margin-left: 20px">
                <h2 class="mt-2">Enter Booking Details</h2>
                <br />
                <div class="form-row ml-2 mb-1">
                
                    <div class="col-md-4 mr-1">
                        <label class="required" for="first_name">First Name</label>
                        <asp:TextBox type="text" ClientIDMode="Static" class="form-control" ID="first_name" placeholder="First Name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valFN" runat="server" ErrorMessage="First Name is a  required field." ForeColor="Red" ControlToValidate="first_name"></asp:RequiredFieldValidator>
                    </div>
              
                
                    <div class="col-md-4">
                        <label class="required" for="last_name">Last Name</label>
                        <asp:TextBox type="text" ClientIDMode="Static" class="form-control" ID="last_name" placeholder="Last Name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valLN" runat="server" ErrorMessage="Last Name is a  required field." ForeColor="Red" ControlToValidate="last_name"></asp:RequiredFieldValidator>
                    </div>
               
                    </div>
                
                <div class="form-row ml-2 mb-1">
                    <div class="col-md-4 mr-1">
                        <label class="required" for="members">Number Of Members</label>
                        <asp:TextBox type="number" ClientIDMode="Static" class="form-control" ID="members" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valMem" runat="server" ErrorMessage="Number of Members is a  required field." ForeColor="Red" ControlToValidate="members"></asp:RequiredFieldValidator>
                    </div>
               
                    <div class="col-md-4">
                        <label class="required" for="ph_number">Phone Number</label>
                        <asp:TextBox type="tel" pattern="[789][0-9]{9}" ClientIDMode="Static" class="form-control" ID="ph_number" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valPH" runat="server" ErrorMessage="Phone Number is a  required field." ForeColor="Red" ControlToValidate="ph_number"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-row ml-2 mb-1">
                    <div class="col-md-8">
                        <label class="required" for="address">Address</label>
                        <asp:TextBox type="text" ClientIDMode="Static" class="form-control" ID="address" placeholder="Address" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valAD" runat="server" ErrorMessage="Address is a  required field." ForeColor="Red" ControlToValidate="address"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-row ml-2 mb-1">
                    <div class="col-md-4 mr-1">
                        <label class="required" for="booking_from">Booking From</label>
                        <asp:TextBox ClientIDMode="Static" class="form-control" ID="booking_from" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valBF" runat="server" ErrorMessage="Not a valid selection." ForeColor="Red" ControlToValidate="booking_from"></asp:RequiredFieldValidator>
                    </div>
              
                    <div class="col-md-4">
                        <label class="required" for="booking_to">Booking To</label>
                        <asp:TextBox ClientIDMode="Static" class="form-control" ID="booking_to" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valBT" runat="server" ErrorMessage="Not a valid selection." ForeColor="Red" ControlToValidate="booking_to"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:Button class="btn btn-primary ml-2" ID="Bookings" runat="server" Text="Back" OnClientClick="javascript:window.location.href='Bookings.aspx'; return false;"></asp:Button>
                <asp:Button class="btn btn-primary ml-2" ID="submitBtn" runat="server" Text="Submit" ClientIDMode="Static"></asp:Button>

            </form>
        </div>
    </div>
</asp:Content>
