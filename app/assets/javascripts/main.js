$(document).ready(function(){
  var price = $("#price").text();
  var num_of_pass = parseInt($("#num_of_pass").text());

  $("#num").change(function(){
    var num = parseInt($("#num").val());
    var total = num * price;
    $("#total").val(total);
  });
});
