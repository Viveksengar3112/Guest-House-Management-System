/*!
    * Start Bootstrap - SB Admin v6.0.1 (https://startbootstrap.com/templates/sb-admin)
    * Copyright 2013-2020 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
    */

(function ($) {
    "use strict";

    // Add active state to sidbar nav links
    var path = window.location.href; // because the 'href' property of the DOM element is the absolute path
        $("#layoutSidenav_nav .sb-sidenav a.nav-link").each(function() {
            if (this.href === path) {
                $(this).addClass("active");
            }
        });

    // Toggle the side navigation
    $("#sidebarToggle").on("click", function(e) {
        e.preventDefault();
        $("body").toggleClass("sb-sidenav-toggled");
    });
    })(jQuery);


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

function trialFxn() {
    if (document.getElementById("testName").value == "Submit") {
        confirm("are you sure?");
    }
    else {
        alert("NOICE");
    }
}


$('#loginForm').submit(function(e){
    e.preventDefault();
    //need to check the id, pass against database
    location.href = "index.aspx";    
});

$('#resetForm').submit(function(e){
    e.preventDefault();

    //need to check the id, pass against database
    alert("Password reset link sent to your registered Email address");
    location.href = "login.aspx";    
});