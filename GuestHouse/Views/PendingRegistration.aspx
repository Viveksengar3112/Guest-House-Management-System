<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" AutoEventWireup="true" CodeBehind="PendingRegistration.aspx.cs" Inherits="GuestHouse.Views.PendingRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            //driver code
            const result = ajaxPendingRegistration();
            ajaxPendingRegistration().then((data) => updateTable(data.d));
            //console.log(result);

            // ajax function to retrieve data from server
            async function ajaxPendingRegistration() {
                const result = await $.ajax({
                    type: "POST",
                    url: "PendingRegistration.aspx/GetPendingRequests",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json"
                });
                return result;
            }

            // function to dynamically update the table
            function updateTable(res) {
                var data = $.parseJSON(res);
                //console.log(data);

                var requests = '';
                $.each(data.Table, function (key, value) {
                    requests += '<tr>';
                    requests += '<td><input type = "checkbox"></td>';
                    requests += '<td>' + value.FirstName + '</td>';
                    requests += '<td>' + value.LastName + '</td>';
                    requests += '<td>' + value.MobileNo + '</td>';
                    requests += '<td>' + value.ID + '</td>';
                    requests += '<td>' + value.EmailAddress + '</td>';
                    requests += '</tr>';
                });
                $('#roomsTable').append(requests);
            }
        });

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainBody" runat="server">
    <main>
	<div class="container-fluid">
        <div class="mb-4" id="roomDetail">
			<h2 class="mt-4">Pending Registrations</h2>
			<br />
          <div class="table-responsive">
            <table class="table table-striped" id="roomsTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                    <th><input type="checkbox"></th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Mobile No.</th>
			        <th>ID</th>
                    <th>Email</th>
                </tr>
              </thead>
              <tbody id="roominfo">			
               <!-- Here I need to figure out how to insert the details of all rooms -->
				  <tr>
                    <td><input type="checkbox"></td>
                    <td>lorem ipsum</td>
                    <td>lorem ipsum</td>
                    <td>lorem ipsum</td>
                    <td>lorem ipsum</td>
                    <td>lorem ipsum</td>
                </tr>
              </tbody>
            </table>
          </div>		 
        </div>
    </div>
    </main>
</asp:Content>
