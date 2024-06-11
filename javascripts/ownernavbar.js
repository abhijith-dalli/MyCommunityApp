//to give notification batch to the posts
$(document).ready(function(){ 
    $.ajax({
      url:"chechNotify.cfm",
      type:"GET",
      success: function(result){
        notifications= JSON.parse(result).DATA[0][0]
        console.log(notifications)
        if (notifications <1){
          $(".notification_badge").css("display","none")
        } 
        else{
          $(".notification_badge").css("display","inline")
          $(".notification_badge").html(notifications)
        }
      }
    });
  });


//to logout button
$(document).ready(function(){
  $("#logoutbtn").click(function(){
    window.location.replace("../index.cfm")
  });
});
