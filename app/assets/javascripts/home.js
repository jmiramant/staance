var Carousel = {
  current: 0,

  init: function() {
    $('.arrow.left').on('click', function() { Carousel.changeVideo(-1); });
    $('.arrow.right').on('click', function() { Carousel.changeVideo(1); });
  },

  changeVideo: function(num) {
    $('.featured-video.' + this.current).hide();
    $('.icon-circle.' + this.current).css('color', '#545454');
    this.current = (this.current + num + 3) % 3;
    $('.featured-video.' + this.current).fadeIn();
    $('.icon-circle.' + this.current).css('color', '#fece12');
  }
};

$(document).ready(function(){
  // featured video click & carousel
  Carousel.init();





  // campaign grid
  $('.select-bar a').on('click', function(e) {
    e.preventDefault();
    var klass = $(this).attr('id');
    $('.select-bar a').removeClass("selected");
    $(this).addClass("selected");
    $('.campaign-snapshot').hide();
    $('.' + klass).fadeIn('slow');
  });




});
