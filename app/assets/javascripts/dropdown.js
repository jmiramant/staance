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
    $('#featured-campaigns').slideUp('slow');
    $('#topic_title').text(topic).show();
    if (description) { $('#topic_description').text(description).show(); }
    $('.campaign-grid').html(data);
  });
});
