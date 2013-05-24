$(function() {
  $('form#new_payment').submit(function() {
    $('form#new_payment input[type="submit"]').attr('disabled', true);
    if ($('#card_number').length) {
      card = {
        number: $('#card_number').val(),
        cvc: $('#cvv').val(),
        expMonth: $('#date_month').val(),
        expYear: $('#date_year').val()
      }
      console.log(['card', card])
      Stripe.createToken(card, function(status, response) {
        console.log(['status', status])
        if (status == 200) {
          $('#payment_stripe_token').val(response.id);
          $('form#new_payment')[0].submit();
        } else {
          alert(response.error.message);
          $('form#new_payment input[type="submit"]').attr('disabled', false);
        }
      });
    }
    return(false);
  });
});


