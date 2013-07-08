$(document).ready(function(){
  $('#form_one #new_campaign').on("ajax:success", function(e, data){
    successPath(data.campaign_id);
  });
  $('#form_one #new_campaign').on("ajax:error", function(e, data){
    errorHandling(e, data);
  });
  $('#form_two #cont_button').on('click', function(e){
    $('body').scrollTop(0);
    e.preventDefault();
    var form = copyContent();
    var id = $('#campaign_id').html();
    formTwo(id, form);
  });
  $('#head').on("ajax:success", '#form_three form', function(){
    console.log('yipee');
    finalizeCreate();
  });
  $('#head').on("ajax:error", '#form_three form', function(e, data){
    console.log('not so yipee');
    errorHandling(e, data);
  });
});
  function errorHandling(e, data){
    var errors = $.parseJSON(data.responseText).error
    var px = 30 * errors.length
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
    return document.getElementById("awesome_campaign").innerHTML;
   };

  function formTwo(camp_id, form_string){
    $.ajax({
      url: '/campaigns/editable_form/',
      type: "post",
      data: {id: camp_id, form: form_string}
    }).done(function(e){
      e
      formThree(); 
    });
  };

  function formThree(){
    $('#form_two').fadeOut();
    $('#body').css('height', '900px')
    $('#form_three').fadeIn();
  };

  function finalizeCreate(id){
    console.log('dsadadsadsda');
    var id = String(parseInt($('#form_three form').attr('id').replace(/[^\d,]+/g, ''))-1);
    window.location.replace('http://localhost:3000/campaigns/'+ id);
  };
