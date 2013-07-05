$(document).ready(function(){
  $('.donate_payment').on('ajax:success', function(e, data){
    $('.donate').append(data);
    setTimeout(function() {  $('.stripe-button-el').click() }, 100);
    setTimeout(function() {  $('.stripe_payment').remove() }, 200);
  });
});
