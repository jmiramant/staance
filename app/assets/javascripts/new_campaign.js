$(document).ready(function() {
  $('#head').on('click', 'a.select-opposing', function(e) {
    e.preventDefault();
    $('.form_half input[type=hidden]').val($(this).data('id'));
    $('.opp-camp').removeClass('border-highlight');
    $(this).parent('.opp-camp').addClass('border-highlight');
  });

  $('#form_one form').on("ajax:success", function(e, data) {
    successPath(data);
    sizeBox();
  });

  $('#form_one form').on("ajax:error", function(e, data) {
    errorHandling(e, data);
  });

  $('#form_two #cont_button').on('click', function(e) {
    $('body').scrollTop(0);
    e.preventDefault();
    var form = copyContent();
    var id = $('#campaign_id').html();
    formTwo(id, form);
  });

  $('#head').on("ajax:success", '#form_three form', function(e, data) {
    if (data == " ") {
      finalizeCreate();
    }
    else{
      errorHandling_form3(e, data);
    }
  });

  $('#head').on("ajax:error", '#form_three form', function(e, data) {
    errorHandling(e, data);
  });

  $('#editable').focus(function() {
    $(this).attr('contenteditable', 'true');
  });

  $("div#editable").keyup(function() {
    sizeBox();
  });

  $("#head").on('click', '.opp_arrow.left', function(e){
    e.preventDefault();
    moveLeft();
  });

  $("#head").on('click', '.opp_arrow.right', function(e){
    e.preventDefault();
    moveRight();
  });

  setTimeout(function() { $('#welcome_msg').slideUp(); }, 5000);
});

function moveRight() {
  var num_divs = $('.opp-camp').length - 4;
  var max_right = -(num_divs * 255 + 45);
  var current_position = parseInt($('.opp_container').css('left'));
  if (current_position > max_right) {
    var new_position = current_position - 100;
    $('.opp_container').css("left", new_position+"px").animate('easing');
  }
}

function moveLeft() {
  var current_position = parseInt($('.opp_container').css('left'));
  if ( current_position < 0 ) {
    var new_position = current_position + 100;
    $('.opp_container').css("left", new_position+"px").animate('easing');
  }
}

function errorHandling(e, data) {
  var errors = $.parseJSON(data.responseText).error;
  var px = 30 * errors.length;
  $('.form_head').animate({ height: '+='+px+'px' }, 500);
  for (e in errors) {
    $('.form_head').append('<div style=" font-size: 21px; text-align: center; color: #545454;">'+errors[e]+'<div>');
  }
  setTimeout(function() {
    $('.form_head').html('');
    $('.form_head').animate({ height: '-='+px+'px' }, 500);
  }, 3000);
}

function errorHandling_form2(error) {
  var px = 40;
  $('.form_head').animate({ height: '+='+px+'px' }, 500);
  $('.form_head').append('<div style=" font-size: 21px; text-align: center; color: #545454;">'+error+'<div>');
  setTimeout(function() {
    $('.form_head').html('');
    $('.form_head').animate({ height: '-='+px+'px' }, 500);
  }, 3000);
}

function errorHandling_form3(e, errors) {
  var px = 30 * errors.length;
  $('.form_head').animate({ height: '+='+px+'px' }, 500);
  for (e in errors) {
    $('.form_head').append('<div style=" font-size: 21px; text-align: center; color: #545454;">'+errors[e]+'<div>');
  }
  setTimeout(function() {
    $('.form_head').html('');
    $('.form_head').animate({ height: '-='+px+'px' }, 500);
  }, 3000);
}

function successPath(data) {
  $('#campaign_id').html(data.campaign_id);
  $('#editable').html(data.campaign_pitch);
  $('#form_one').slideUp('slow');
  $('#form_one').fadeOut();
  $('#form_two').fadeIn();
}

function copyContent() {
  return document.getElementById("editable").innerHTML;
}

function sizeBox() {
  var px = String((parseInt($('#form_two .form_full').height())+100));
  $('#form_two h2').css('height', px +'px');
}

function formTwo(camp_id, form_string) {
  $.ajax({
    url: '/campaigns/editable_form/',
    type: "post",
    data: { id: camp_id, form: form_string }
  }).done(function(returnedPartial) {
    if (returnedPartial == "Pitch must be a minimum length of 520 characters"){
      errorHandling_form2(returnedPartial);
    }
    else {
      returnedPartial;
      formThree();
    }
  });
}

function formThree() {
  $('#form_two').fadeOut();
  $('#body').css('height', '900px');
  $('#form_three').fadeIn();
  $('.datePicker').datepicker();
}

function finalizeCreate(id) {
  var camp_id = String(parseInt($('#form_three form').attr('id').replace(/[^\d,]+/g, '')));
  console.log(camp_id);
  window.location.replace('/campaigns/'+ camp_id);
}
