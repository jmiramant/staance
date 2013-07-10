var updateTab = {
  activateYourStatus: function() {
    removeId();
    hidePartial();
    restoreHeight()
    $('.campaign_status').removeClass('hidden').attr('id', 'active');
    $('#fundraise').removeClass('hidden').addClass('unhidden');
    
  },
  activateComments: function() {
    removeId();
    hidePartial();
    $('.comments').removeClass('hidden').attr('id', 'active');
    $('#disqus_thread').removeClass('hidden').addClass('unhidden');
    determineDisqusHeight();
  },

  activateOpposition: function() {
    removeId();
    hidePartial();
    restoreHeight()
    $('.opposition_status').removeClass('hidden').attr('id', 'active');
    $('#opp_status').removeClass('hidden').addClass('unhidden');
  }

};

function determineDisqusHeight() {
  $('.status_tabs').css('height', "505px");
  var height = parseInt($('#disqus_thread').css('height'));
  $('.status_tabs').css('height', height + 35 + "px");
}

function removeId() {
  var id = $('.tabs_fundraiser').find('#active');
  id.removeAttr('id');
}

function hidePartial(){
  var klass = $('.status_tabs').find('.unhidden');
  klass.removeClass('unhidden');
  klass.addClass('hidden');
}

function restoreHeight() {
  $('.status_tabs').css('height', "405px");
}


$(document).ready(function() {
  $('.campaign_status').on("click", updateTab.activateYourStatus);
  $('.opposition_status').on("click", updateTab.activateOpposition);
  $('.comments').on("click", updateTab.activateComments);
});
