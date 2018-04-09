// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
    $("#address").keyup(function() {
       $.ajax({
            url: "/addresses/search",
            crossDomain: true,
            dataType: "JSONP",
            data: { 
                q: $("#address").val()
            },
            
            type: "GET",
            success: function(response) {
        
            },
            error: function(xhr) {
        
            }
        });
     
    });
});
    //$(".nav-list li a").click(function(e) {
      //  e.preventDefault();
      //$(this).effect( "shake" );
    //});
    
    $(document).on("click", "#mowing", function(){
      if(document.getElementById('mowing').checked) {
            document.getElementById("lawn-mowing-qty").value = "1";
        } else {
            document.getElementById("lawn-mowing-qty").value = "0";
        }
    });
    
    $(document).on("click", "#spraying", function(){
      if(document.getElementById('spraying').checked) {
            document.getElementById("lawn-spraying-qty").value = "1";
        } else {
            document.getElementById("lawn-spraying-qty").value = "0";
        }
    });
    
    jQuery(document).on("click", "#results li", function(){
        
        var element = document.getElementById("address_id");
        if(this.dataset.id != null){
        element.value = this.dataset.id;
        }
        var address_textf = document.getElementById("address");
        if(this.dataset.address != null){
        address_textf.value = this.dataset.address;
        }
        jQuery("#results").html("");
    });
});


       
    