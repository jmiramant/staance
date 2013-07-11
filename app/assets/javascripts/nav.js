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

  });
  $(window).scroll(function(){ 
  if ($(this).scrollTop() > 10){  
    $('nav').addClass("short_nav");
    $('.nav-links').addClass("links_up");
    $('#take').addClass("take_down");
    $('#stance').addClass("stance_up");
    $('#camp').addClass("be_gone");
    $('.create-campaign').addClass('smr_button');
  } 
  else{
    $('nav').removeClass("short_nav");
    $('.nav-links').removeClass("links_up");
    $('#take').removeClass("take_down");
    $('#stance').removeClass("stance_up");
    $('.create-campaign').removeClass('smr_button');
    $('#camp').removeClass("be_gone");
  }
  });

});  

