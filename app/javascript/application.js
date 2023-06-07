// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).ready(function() {
    var totalPrice = 4100;
    $("#borang_total_price").val(totalPrice);
  
    $('.checkboxClass').change(function() {
      if($(this).is(":checked")) {
        totalPrice += parseFloat($(this).attr("data-price"));
        $("#borang_total_price").val(totalPrice);
      } else {
        totalPrice -= parseFloat($(this).attr("data-price"));
        $("#borang_total_price").val(totalPrice);
      }
    });
  });
  

  
  
  
  