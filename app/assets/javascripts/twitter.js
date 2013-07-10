var Twitter = {
  createTweetText: function() {
    $().ready(function() {
      var via = 'staance';
      var url = document.URL
      var txt = "I'm supporting <%= @campaign.title %>. Join Me: "+ url;
      var a = window.location.href,b="http://urls.api.twitter.com/1/urls/count.json?url="+encodeURIComponent(a),c="http://twitter.com/intent/tweet?related=&text="+encodeURIComponent(txt)+"&url="+a+"&via="+via;
      $("#tweet-btn, #tweet-cnt").click(function(d){d.preventDefault();window.open(c,"","width=550,height=420,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=1,left=100,top=100");return!0});
      $.ajax({url:b,dataType:"json",success:function(d){console.log("Tweet count for "+a+": "+d.count);$("#tweet-cnt").text(d.count.toString())},error:function(d){console.log("Can not get tweet count from "+b);}});
    });
  }
}
