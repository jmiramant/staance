var SupportLink = {
	init: function() {
		$('#support').on('ajax:success', this.appendNotice);
		$('#support').on('ajax:errors', this.appendAlert);
	},
	appendNotice: function(){
		console.log('goood');
		$('.notice').append("You are supporting this campaign");
		$('#support').fadeOut();
	},
	appendAlert: function(){
		$('.alert').append("I'm sorry, there was an error logging your support");
	}
};

var UpdateOpposingCampaign = {
	init: function() {
	  $('#topic_input').on('change', function(){
	  	topic = $('#topic_input :selected').text();
	  	createDropDown(topic);
		});
	}
}

function createDropDown(topic){
    console.log(topic);
    if (topic === ""){
    	$('#opposing_campaigns').html("");
    }
    else {
	    $.post('/filter_topic/'+topic, function(data){
	      $('#opposing_campaigns').html(data)
	    });
	  }
	}

$(document).ready(function(){
		SupportLink.init();

		UpdateOpposingCampaign.init()
});
