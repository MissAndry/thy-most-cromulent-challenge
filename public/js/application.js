$(document).ready(function() {
  var phoneNumber;
  
  $("#phone-number").on("submit", function(e){
    var phoneNumberChildren;
    
    e.preventDefault();
    phoneNumberChildren = $(this).children();
    phoneNumber = phoneNumberChildren[0].value;
    
    $.ajax({
      url: $(this).attr("action"),
      type: "get",
      success: function(response){
        console.log(response);
        $("#send-form").html(response);
        $(".instructions").hide();
        $(".generate").css({"margin-right": "37%"});
        $(".generate").text("Try again?");
      }
    });
  });

  $("#send-form").on("submit", "#send", function(e){
    var url, data;
    e.preventDefault();

    url = $(this).attr("action");
    data = $(this).serialize();
    console.log(url);
    console.log(data);

    $.ajax({
      url: url,
      type: "post",
      data: { phoneNumber: phoneNumber,
              data: data },
      success: function(response){
        console.log($(this));
        console.log($(this).parent());
        $("#send-form").parent().html(response);
      }
    });
  });

});
