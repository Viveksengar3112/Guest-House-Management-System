/*!
    * Start Bootstrap - SB Admin v6.0.1 (https://startbootstrap.com/templates/sb-admin)
    * Copyright 2013-2020 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
    */
    (function($) {
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


$('#registrationForm').submit(function(e){
    e.preventDefault();

    //validate mobile number
    num = document.getElementById("inputMobileNumber");
    var a = /^\d{10}$/;  
    if (!a.test(num.value))   
    {  
        alert("Please enter a valid mobile number.");
        num.focus();
        return;
    }   

    //checking confirm pass
    password1 = document.getElementById("inputPassword"); 
    password2 = document.getElementById("inputConfirmPassword");
            
    // If Not same return False.     
    if (password1.value != password2.value) { 
        alert ("\nPassword did not match: Please try again");
        password2.focus(); 
    } 

    // If same return True. 
    else{ 
        location.href = "login.html";
        alert ("Account Created Successfully!");
    }
});

$('#loginForm').submit(function(e){
    e.preventDefault();
    //need to check the id, pass against database
    location.href = "index.html";    
});

$('#resetForm').submit(function(e){
    e.preventDefault();

    //need to check the id, pass against database
    alert("Password reset link sent to your registered Email address");
    location.href = "login.html";    
});