$(function() {
  $('td.hacker').hover(
    function() { $(this).children('.hacker-popup').slideDown(); },
    function() { $(this).children('.hacker-popup').slideUp(); }
  );
});
