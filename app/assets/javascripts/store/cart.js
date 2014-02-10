(function() {

  Spree.ready(function($) {
    if (($('form#update-cart')).is('*')) {
      $('body#cart').on('click', 'form#update-cart a.delete', function() {
        $(this).parents('.line-item').first().find('input.line_item_quantity').val(0);
        $(this).parents('form').first().submit();
        $(this).parents('.line-item').fadeOut();
        return false;
      });
      
      var timr

      $("body#cart").on( "change", "form#update-cart input.line_item_quantity", function() {
        
        window.clearTimeout(timr)
        timr = setTimeout(function(){
          $('#update-cart').trigger('submit.rails')
        },700)

        return false; 
      })

      $("body#cart").on( "blur", "#order_coupon_code", function() {
        window.clearTimeout(timr)
        timr = setTimeout(function(){
          $('#update-cart').trigger('submit.rails')
        },700)
        return false; 
      })
    }
    
    $('#top_nav_content').children().hide()

    return $('form#update-cart').submit(function() {
      return $('form#update-cart #update-button').attr('disabled', true);
    });
  });

}).call(this);
