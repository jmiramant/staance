$(document).ready(function(){

  $('.filter-options li').on('click', function() {
    var $this = $(this),
        $grid = $('#grid');
    $('.filter-options .active').removeClass('active');
    $this.addClass('active');
    $grid.shuffle($this.data('group'));
  });
  $('#grid').shuffle({
      group : 'all',
      speed : 800,
      easing : 'ease-out'
  });

$('.sort-options li').on('click', function() {
    var $this = $(this),
        $grid = $('#grid'),
        sort = $this.data('sort'),
        opts = {};
    $('.sort-options .active').removeClass('active');
    $this.addClass('active');
    if (sort === 'date-created') {
        opts = {
            by: function($el) {
                return $el.data('date-created');
            }
        };
    } else if (sort === 'title') {
        opts = {
            by: function($el) {
                return $el.data('title').toLowerCase();
            }
        };
    }
    $grid.shuffle('sort', opts);
});
});
