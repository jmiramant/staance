$(document).ready(function() {
  $('#topics, #topic_list').on('mouseenter', function() {
    $('#topic_list').show();
  }).mouseleave(function() {
    $('#topic_list').hide();
  });

  $('.topic_list_title').on('ajax:success', function(e, data) {
    var topic = $(this).text();
    var description = $(this).attr('id');
    $('body').scrollTop();
    $('#topic_list').hide();
    $('#arrow i').addClass('disappear');
    $('#featured-campaigns').addClass('disappear').slideUp('slow');
    $('#featured-details-box').addClass('disappear').slideUp('slow');
    $('#topic_title_box').show();
    $('#topic_title').text(topic).fadeIn('slow');
    if (description) { $('#topic_description').text(description).show(); }
    $('.campaign-grid').html(data);
  });
});
