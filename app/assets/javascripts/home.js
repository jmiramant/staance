$(document).ready(function(){
  $('.select-bar a').on('click', function(e) {
    e.preventDefault();
    var klass = $(this).attr('id');
    $('.select-bar a').removeClass("selected");
    $(this).addClass("selected");
    $('.campaign-snapshot').hide();
    $('.' + klass).fadeIn('slow');
  })
});
