$(document).ready(function(){
    $('.match_button').on('click', function(e){
    e.preventDefault();
    var campId = $(this).closest('.campaign-snapshot').attr('data-id');
    $.ajax({
      url: '/matchers/new',
      data: {id: campId},
      method: 'get'
    }).done(function(e){
      $('.lessfancybox').html(e);
      $('.lessfancybox').click();
    });
  });

  $('.lessfancybox form').on("ajax:success", function(e, data) {
    console.log(e);
  });

  $('.lessfancybox form').on("ajax:error", function(e, data) {
    console.log(e);
  });


});
