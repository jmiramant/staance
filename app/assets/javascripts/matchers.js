$(document).ready(function(){
    $('.match_button').on('click', function(e){
    e.preventDefault();
    $.ajax({
      url: '/matchers/new',
      method: 'get', 
    }).done(function(e){
      $('.lessfancybox').html(e);
      $('.lessfancybox').click();
    });
  });
});
