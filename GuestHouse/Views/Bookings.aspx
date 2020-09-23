<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" AutoEventWireup="true" CodeBehind="Bookings.aspx.cs" Inherits="GuestHouse.Views.Bookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainBody" runat="server">
    <main>
        <div style="margin-top: 20px">

            <form role="form" id="Booking" action="#" method="post" runat="server" style="margin-left: 15px">
                <asp:Button type="button" class="btn btn-primary" ID="addBooking" runat="server" PostBackUrl="~/Views/AddBookings.aspx" Text="New Booking"></asp:Button>
            </form>
        </div>
    </main>
</asp:Content>
