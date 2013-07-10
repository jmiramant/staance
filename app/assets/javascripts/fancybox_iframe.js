$(document).ready(function() {
  $('.fancybox').fancybox({
    closeBtn: true,
    helpers: {
      media: true
    }
  });
  $('.lessfancybox').fancybox({
   closeBtn: true,
    helpers: {
      media: false
    }
  });
});
