function login_form(){
  $('#home_log_in').addClass("hsi_short");
  $('.sign-in-form').addClass("sif_short");
}

$(document).ready(function() { 
  $(".logo").mouseover(function(){
    $("#take").animate({ opacity: 1}, 50);
    $("#stance").animate({ opacity: 1}, 50);
    $("#an_a").css('color', '#acacac');
  });
  $(".logo").mouseleave(function(){
    $("#take").animate({ opacity: 0}, 50);
    $("#stance").animate({ opacity: 0}, 50);
    $("#an_a").css('color', '#FF3765');
    $('#sign_up').scrollTop('0');

  });
  $(window).scroll(function(){ 
  if ($(this).scrollTop() > 10){  
    $('nav').addClass("short_nav");
    $('.nav-links').addClass("links_up");
    $('#take').addClass("take_down");
    $('.create-campaign').addClass("cam_op");
  } 
  else{
    $('nav').removeClass("short_nav");
    $('.nav-links').removeClass("links_up");
    $('#take').removeClass("take_down");
    $('#stance').removeClass("stance_up");
    $('.create-campaign').removeClass('cam_op');
  }
  });

});  

