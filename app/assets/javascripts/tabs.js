var updateTab = {
  activateYourStatus: function() {
    this.removeId();
    this.hidePartial();
    $('.campaign_status').removeClass('hidden').attr('id', 'active');
    $('#fundraise').removeClass('hidden').addClass('unhidden');
    
  },
  activateComments: function() {
    this.removeId();
    this.hidePartial();
    $('.comments').removeClass('hidden').attr('id', 'active');
    $('#disqus_thread').removeClass('hidden').addClass('unhidden');
  },

  activateOpposition: function() {
    this.removeId();
    this.hidePartial();
    $('.opposition_status').removeClass('hidden').attr('id', 'active');
    $('#opp_status').removeClass('hidden').addClass('unhidden');
  },

  removeId: function() {
    var id = $('.tabs_fundraiser').find('#active');
    id.removeAttr('id');
  },

  hidePartial: function() {
    var klass = $('.status_tabs').find('.unhidden');
    klass.removeClass('unhidden');
    klass.addClass('hidden');
  }
};

$(document).ready(function() {
  $('.campaign_status').on("click", function(){
    updateTab.activateYourStatus();
  });
  $('.opposition_status').on("click", function(){
    updateTab.activateOpposition();
  });
  $('.comments').on("click", function(){
    updateTab.activateComments();
  });
});
