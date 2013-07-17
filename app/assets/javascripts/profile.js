$(document).ready(function() {
   $('.profile-nav-link').on('click', function(e) {
    e.preventDefault();
    $('.profile-nav-link').removeClass("selected");
    $(this).addClass("selected");
    var tab = $(this).attr('id');
    var $newItems = $('.' + tab + ' #tester');
    $('.source').quicksand($newItems);
  });
});
