$(document).ready(function(){
  $('#form_one #new_campaign').on("ajax:success", function(e, data){
    successPath(data.campaign_id);
  });
  $('#form_one #new_campaign').on("ajax:error", function(e, data){
    errorHandling(e, data);
  });
  $('#form_two #cont_button').on('click', function(e){
    e.preventDefault();
    var form = copyContent();
    var id = form_string
    formTwo(id, form);
  });
});
  function errorHandling(e, data, status, xhr){
    var errors = $.parseJSON(data.responseText).error
    var px = 30 * errors.length
    console.log(errors);
    $('.form_head').animate({height: '+='+px+'px'},500);
    for (e in errors)
      {
      $('.form_head').append('<div style=" font-size: 21px; text-align: center; color: #545454;">'+errors[e]+'<div>');
      }
      setTimeout(function(){
        $('.form_head').html('');
        $('.form_head').animate({height: '-='+px+'px'},500);
      },3000);
  };

  function successPath(id){
    $('#campaign_id').html(id);    
    $('.edit_magic').css('height', 0);    
    $('#form_one').slideUp('slow');
    $('#form_one').fadeOut();
    $('#form_two').fadeIn();
  };

  function copyContent() { 
    document.getElementById("awesome_campaign").innerHTML;
   };

  function formTwo(camp_id, form_string){
    console.log(camp_id);
    console.log(form_string);
    $.post({
      url: '/editable_form',
      data: {id: camp_id,form: form_string}
    }).done(function(e){
      console.log(e.status);
      console.log('hello');

    });
  };

  function formThree(campaign){
    $('.edit_magic').css('height', 0);    
    $('#form_two').slideUp('slow');
    $('#form_two').fadeOut();
    $('#from_three').fadeIn();
  };
