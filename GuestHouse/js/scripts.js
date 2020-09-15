/*!
   * Start Bootstrap - SB Admin v6.0.1 (https://startbootstrap.com/templates/sb-admin)
   * Copyright 2013-2020 Start Bootstrap
   * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
   */
(function ($) {
    "use strict";

    // Add active state to sidbar nav links
    var path = window.location.href; // because the 'href' property of the DOM element is the absolute path
    $("#layoutSidenav_nav .sb-sidenav a.nav-link").each(function () {
        if (this.href === path) {
            $(this).addClass("active");
        }
    });

    // Toggle the side navigation
    $("#sidebarToggle").on("click", function (e) {
        e.preventDefault();
        $("body").toggleClass("sb-sidenav-toggled");
    });
})(jQuery);


//function for add new room
   

function saveRoomData() {
    /*    var formData = new FormData;
        formData.append("RoomNumber", $("#inputRoomNumber").val());
        formData.append("RoomPrice", $("#inputRoomPrice").val());
        formData.append("BookingStatusID", $("#inputBookingStatus").val());
        formData.append("RoomTypeID", $("#inputRoomType").val());
        formData.append("RoomCapacity", $("#inputRoomCapacity").val());
        formData.append("RoomDescription", $("#inputRoomDescription").val());
        formData.append("GuestHouseID", $("#inputGuestHouse").val());
        formData.append("InputImage", $("#InputImage").get(0).files[0]);
        */
    }
    
    // need to add these functionalities
    /*
    function moredetail(id) {
        var x = "booking" + id;
        document.getElementById(x).style.display = "block";
    }
    $('.delete').click(function () {
        return confirm("Are you sure you want to delete?");
    });
  



    var password = document.getElementById("inputPassword");
    var confirm_password = document.getElementById("inputConfirmPassword");

    function validatePassword() {
        if (password.value != confirm_password.value) {
            confirm_password.setCustomValidity("Passwords Don't Match");
        } else {
            confirm_password.setCustomValidity('');
        }
    }

    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
      */