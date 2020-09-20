<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" AutoEventWireup="true" CodeBehind="PendingRegistration.aspx.cs" Inherits="GuestHouse.Views.PendingRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/dist/jquery.simple-checkbox-table.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //$('#roomsTable').DataTable();
            //$('.dataTables_length').addClass('bs-select');
            $("table#roomsTable").simpleCheckboxTable();

            //driver code
            ajaxPendingRegistration().then((data) => updateTable(data.d));

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
                    requests += '<td><input type = "checkbox" name="rowBox"></td>';
                    requests += '<td>' + value.FirstName + '</td>';
                    requests += '<td>' + value.LastName + '</td>';
                    requests += '<td>' + value.MobileNo + '</td>';
                    requests += '<td>' + value.ID + '</td>';
                    requests += '<td>' + value.Email + '</td>';
                    requests += '</tr>';
                });
                $('#roomsTable').append(requests);
            }

            function getSelectedEmails() {
                var rows = [];
                $("input[name=rowBox]:checked").each(function () {
                    rows.push($(this).closest("tr").find('td:eq(5)').text());
                });
                if (rows.length == 0) {
                    alert("Select atleast 1 entry!");
                    return false;
                }
                else {
                    if ($("#masterCheckbox").is(":checked")) {
                        confirm("Are you sure you want to accept all requests?");
                    }
                    else {
                        confirm("Are you sure you want to continue?");
                    }
                }
                return rows;
            }

            // ajax function to accept request
            function acceptRequest(rows) {
                console.log("inside accept");
                console.log(rows);

                var postData = {
                    values: rows
                };

                const result = $.ajax({
                    type: "POST",
                    url: "PendingRegistration.aspx/AcceptRequests",
                    data: JSON.stringify(postData),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    traditional: true,
                    success: function () {
                        $("input[name=rowBox]:checked").each(function () {
                            $(this).closest("tr").remove();
                        });
                    },
                    failure: function () {
                        alert("not working...");
                    }
                });
                return result;
            }

            //accept button function
            $("#acceptbtn").click(function () {
                var rows = getSelectedEmails();
                console.log(rows);
                if (rows) {
                    var r = acceptRequest(rows);
                }
            });


            // ajax function to reject request
            function rejectRequest(rows) {
                console.log("inside reject");
                console.log(rows);

                var postData = {
                    values: rows
                }; 

                const result = $.ajax({
                    type: "POST",
                    url: "PendingRegistration.aspx/RejectRequests",
                    data: JSON.stringify(postData),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    traditional: true,
                    success: function () {
                        $("input[name=rowBox]:checked").each(function () {
                            $(this).closest("tr").remove();
                        });
                    },
                    failure: function () {
                        alert("not working...");
                    }
                });
                return result;
            }

            //reject button function
            $("#rejectBtn").click(function () {
                var rows = getSelectedEmails();
                console.log(rows);
                if (rows) {
                    var r = rejectRequest(rows);
                }
            });
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
              <thead class="grey lighten-2">
                <tr>
                    <th><input type="checkbox" id="masterCheckbox"></th>
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
                    <td><input type="checkbox" name="rowBox"></td>
                    <td>lorem ipsum</td>
                    <td>lorem ipsum</td>
                    <td>lorem ipsum</td>
                    <td>lorem ipsum</td>
                    <td>lorem ipsum</td>
                </tr>
              </tbody>
            </table>
          </div>	
          <button type="button" class="btn btn-default btn-success" id="acceptbtn">Accept</button>
          <button type="button" class="btn btn-danger" id="rejectBtn">Reject</button>
        </div>
    </div>
    </main>
</asp:Content>
