var SupportLink = {
	init: function() {
		$('#support').on('ajax:success', this.appendNotice);
		$('#support').on('ajax:errors', this.appendAlert);
	},
	appendNotice: function(){
		console.log('goood');
		$('.supporter').append("Thanks for supporting this campaign!");
		$('#support').fadeOut();
	},
	appendAlert: function(){
		$('.supporter').append("I'm sorry, there was an error logging your support");
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

	function countdown(){
		now = new Date();
		deadline = $('.countdown').html();
	  parsed = Date.parse(deadline);
	  diff = parsed - now;
	  days  = Math.floor( diff / (1000*60*60*24) );
	  hours = Math.floor( diff / (1000*60*60) );
	  mins  = Math.floor( diff / (1000*60) );
	  secs  = Math.floor( diff / 1000 );
	  dd = days;
	  hh = hours - days  * 24;
	  mm = mins  - hours * 60;
   	ss = secs  - mins  * 60;
	  $('.countdown_value').html(dd+" Days, "+hh+" Hours, "+mm+" Minutes, "+ss+" Seconds")
	}

$(document).ready(function(){
		$("#form_one").fadeIn('slow');
		SupportLink.init();
		UpdateOpposingCampaign.init()
		countdown();
		setInterval(function(){countdown()},1000);
});
