<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" AutoEventWireup="true" CodeBehind="AddBookings.aspx.cs" Inherits="GuestHouse.Views.AddBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script type="text/javascript">
        $(function () {

            $("#<%= booking_from.ClientID %>").flatpickr({
                enableTime: true,
                dateFormat: "Y-m-d H:i",
                altInput: true,
                altFormat: "F j, Y H:i",
            });
            $("#<%= booking_to.ClientID %>").flatpickr({
                enableTime: true,
                dateFormat: "Y-m-d H:i",
                altInput: true,
                altFormat: "F j, Y H:i",
            });
        });
        function pageLoad(sender, args) {
            $(".ddl").select2({
                allowClear: true,
                placeholder: { id: "0", text: "Please select..." }

            });
        }
       
        function showHideBT(dd) {
            var indexVal = dd.selectedIndex;
            var trainingName = document.getElementById('<%= training_name.ClientID %>');
            var trainingDirector = document.getElementById('<%= training_director.ClientID %>');
            var lblName = document.getElementById('<%= lblTN.ClientID %>');
            var lblDir = document.getElementById('<%= lblTD.ClientID %>');
            if (dd.options[indexVal].value == "1")  //If training
            {
                trainingName.style.display = 'block';    // this will display the textbox
                trainingDirector.style.display = 'block';
                lblName.style.display = 'inherit';
                lblDir.style.display = 'inherit';
            }
            else
            {
                trainingName.style.display = 'none';  // this will hide the textbox
                trainingDirector.style.display = 'none';
               lblName.style.display = 'none';
                lblDir.style.display = 'none';
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainBody" runat="server">
    <div class="container-fluid">
        <div class="mt-4" id="formnew">

            <form role="form" id="newRoom" action="#" method="post" runat="server" style="margin-left: 20px">
                <h2 class="mt-2">Enter Booking Details</h2>
                <br />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanelBT" runat="server">
                    <ContentTemplate>
                        <div class="form-row ml-2 mb-1 mt-3">
                            <div class="col-md-3">
                                <label class="required" for="ddlBT">Booking Type: </label>
                                <asp:DropDownList ID="ddlBT" runat="server" AutoPostBack="True" DataTextField="BookingType" DataValueField="BookingTypeID" CssClass="form-control ddl" Width="150px"  onchange="javascript:return showHideBT(this);"></asp:DropDownList>

                            </div>

                        </div>
                        </ContentTemplate>
                </asp:UpdatePanel>
                        <div class="form-row ml-2 mb-1 mt-3">
                            <div class="col-md-4">
                                <asp:Label runat="server" AssociatedControlID="training_name" style="display: none;" Id="lblTN">Training Name</asp:Label>
                                <asp:TextBox Type="text" ClientIDMode="Static" CssClass="form-control" ID="training_name" runat="server" Style="display: none;" placeholder="Enter Training Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="valT" runat="server" ErrorMessage="This is a  required field." ForeColor="Red" ControlToValidate="training_name"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-4">
                                <asp:Label runat="server" AssociatedControlID="training_director" style="display: none;" Id="lblTD">Training Director</asp:Label>
                                <asp:TextBox Type="text" ClientIDMode="Static" CssClass="form-control" ID="training_director" runat="server" Style="display: none;" placeholder="Enter Director of Training"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="valTd" runat="server" ErrorMessage="This is a  required field." ForeColor="Red" ControlToValidate="training_director"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                         
                <asp:UpdatePanel ID="UpdatePanelRoom" runat="server">
                    <ContentTemplate>
                        <div class="form-row ml-2 mb-1 mt-6">
                            <div class="col-md-2">
                                <label class="required" for="ddlGH">Guest House </label>
                                <asp:DropDownList ID="ddlGH" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="GuestHouseID" Width="150px"  CssClass="form-control ddl" AppendDataBoundItems="true"  onselectedindexchanged="ddlGH_SelectedIndexChanged"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="valGH" runat="server" InitialValue="0" ErrorMessage="Invalid Selection" ForeColor="Red" ControlToValidate="ddlGH"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-2">
                                <label class="required" for="ddlRT">Room Type </label>
                                <asp:DropDownList ID="ddlRT" runat="server" AutoPostBack="True" DataTextField="RoomType" DataValueField="RoomTypeID" Width="150px"  CssClass="form-control ddl" AppendDataBoundItems="true" onselectedindexchanged="ddlRT_SelectedIndexChanged" ></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="valRT" runat="server" InitialValue="0" ErrorMessage="Invalid Selection" ForeColor="Red" ControlToValidate="ddlRT"></asp:RequiredFieldValidator>
                            </div>
                        
                        <div class="col-md-4">
                                <label class="required" for="ddlAR">Available Rooms </label>
                                <asp:DropDownList ID="ddlAR" runat="server" AutoPostBack="True" DataTextField="RoomNumber" DataValueField="RoomNumber" Width="150px"  CssClass="form-control ddl" AppendDataBoundItems="true" ></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="valAR" runat="server" InitialValue="0" ErrorMessage="Invalid Selection" ForeColor="Red" ControlToValidate="ddlAR"></asp:RequiredFieldValidator>
                            </div>
                            </div>
                   </ContentTemplate>
                </asp:UpdatePanel>
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



                <asp:Button class="btn btn-primary ml-2 mt-4" ID="Bookings" runat="server" Text="Back" OnClientClick="javascript:window.location.href='Bookings.aspx'; return false;"></asp:Button>
                <asp:Button class="btn btn-primary ml-2 mt-4" ID="submitBtn" runat="server" Text="Submit" ClientIDMode="Static"></asp:Button>



            </form>
        </div>
    </div>
</asp:Content>
