$(document).ready(function(){
  $('#sign_in_link').on('ajax:success', function(e, data){
    var left = $('#sign_in_link').position().left - 90;
    $('#home_log_in').css("left",left);
    $('#home_sign_up').fadeOut();
    $('#home_log_in').fadeIn();
    $('#sign_up_link').css("display", "none");
  });
  
  $('#home_log_in').mouseleave(function(){
    $('#home_log_in').fadeOut();
    $('#sign_up_link').show();
  });

  $('#sign_up_link').on('ajax:success', function(e, data){
    var left = $('#sign_in_link').position().left - 90;
    $('#home_sign_up').css("left",left);
    $('#home_log_in').fadeOut();
    $('#home_sign_up').fadeIn();
    $('#sign_in_link').css("visibility", "hidden");
  });

  $('#home_sign_up').mouseleave(function(){
    $('#home_sign_up').fadeOut();
    $('#sign_in_link').css("visibility", "visible");
  });
});
