var SupportLink = {
	init: function() {
		$('#support').on('ajax:success', this.appendNotice);
		$('#support').on('ajax:errors', this.appendAlert);
		$('#support').on('ajax:complete', this.appendAlert);
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

$(document).ready(function(){
		SupportLink.init();
});