$(function() {
  $('#payment form').submit(function() {
    $('#payment form input[type="submit"]').attr('disabled', true);
    if ($('#card_number').length) {
      card = {
        number: $('#card_number').val(),
        cvc: $('#cvv').val(),
        expMonth: $('#date_month').val(),
        expYear: $('#date_year').val()
      }
      Stripe.createToken(card, function(status, response) {
        if (status == 200) {
          $('#stripe_token').val(response.id);
          $('#payment form')[0].submit();
        } else {
          alert(response.error.message);
          $('#payment form input[type="submit"]').attr('disabled', false);
        }
      });
    }
    return(false);
  });
});