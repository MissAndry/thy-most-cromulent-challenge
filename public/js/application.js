$(document).ready(function() {

  $("a").on("click", function(event){
    event.preventDefault();

    $.ajax({
      url: $(this).attr("href"),
      type: "get",
      success: function(response){
        console.log("ding!");
        $("#send-form").html(response);
        $(".instructions").hide();
        $(".generate").css({"margin-right": "37%"});
        $(".generate").text("Try again?");
      }
    });
  });

  $("#send-form").on("submit", "#send", function(event){
    event.preventDefault();

    var url = $(this).attr("action");
    var data = $(this).serialize();
    console.log(url);
    console.log(data);


    $.ajax({
      url: url,
      type: "post",
      data: data,
      success: function(response){
        console.log($(this));
        console.log($(this).parent());
        $("#send-form").parent().html(response);
      }
    });
  });

});
