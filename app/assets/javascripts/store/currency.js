(function() {
  $(function() {
    return $('#currency-select input[type=radio]').change(function() {
      return $.ajax({
        type: 'GET',
        url: $(this).data('href'),
        data: {
          currency: $(this).val()
        }
      }).done(function() {
        return window.location.reload();
      });
    });
  });

}).call(this);