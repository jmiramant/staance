function makePayment() {
  setTimeout(function() { $('.stripe-button-el').click(); }, 200);
  setTimeout(function() { $('.stripe_payment').remove(); }, 200);
}

$(document).ready(function() {
  $('.donate_payment').on('ajax:success', function(e, data) {
    $('.donate').append(data);
    makePayment();
  });

  // this is not working properly --> is appending multiauth form on success (i.e. not erroring)
  $('.donate_payment').on('ajax:error', function() {
    alert("Please log in to make a donation");
  });
});
