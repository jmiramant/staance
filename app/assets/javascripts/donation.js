function makePayment() {
  setTimeout(function() { $('.stripe-button-el').click(); }, 100);
  setTimeout(function() { $('.stripe_payment').remove(); }, 200);
}

$(document).ready(function() {
  $('.donate_payment').on('ajax:success', function(e, data) {
    $('.donate').append(data);
    makePayment();
  });

  $('.donate_payment').on('ajax:error', function() {
    alert("Please log in to make a donation");
  });
});
