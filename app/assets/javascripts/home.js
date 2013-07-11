var Carousel = {
  current: 0,

  init: function() {
    $('#arrow.left').on('click', function() { Carousel.changeVideo(-1); });
    $('#arrow.right').on('click', function() { Carousel.changeVideo(1); });
    $('.icon-circle').on('click', function(e) {
        Carousel.changeVideo(e.currentTarget.classList[1], true);
    });
  },

  changeVideo: function(num, abs) {
    $('#featured-video-image.' + this.current).hide();
    $('#featured-video-details.' + this.current).hide();
    $('.icon-circle.' + this.current).removeClass('selected');
    if (abs == null) { this.current = (this.current + num + 3) % 3; }
    else { this.current = num; }
    $('#featured-video-image.' + this.current).fadeIn(1000);
    $('#featured-video-details.' + this.current).fadeIn(1000);
    $('.icon-circle.' + this.current).addClass('selected');
  },
};

$(document).ready(function() {
  // featured video click & carousel
  Carousel.init();
  var autoRotate = setInterval(function() { Carousel.changeVideo(1); }, 8000);
  $('#arrow, .icon-circle').on('click', function() { clearInterval(autoRotate); });

  // campaign grid
  $('.select-bar .categories').on('click', function(e) {
    e.preventDefault();
    $('.select-bar a').removeClass("selected");
    $(this).addClass("selected");
    var category = $(this).attr('id');
    var $newItems = $('.' + category + ' li');
    $('.source').quicksand($newItems);
  });
});
