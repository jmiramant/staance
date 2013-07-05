$(document).ready(function(){
	$('.fb-like').attr("data-href", window.location.href);
  $('.fb-send').attr("data-href", window.location.href);
});
window.fbAsyncInit = function() {
  FB.init({
    appId      : 622874237732350,
    channelUrl : '//WWW.LOCALHOST:3000/',
    status     : true,
    xfbml      : true
    });
  };
(function(d, s, id){
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=622874237732350";
  fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
