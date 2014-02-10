//= require store/jquery.hoverintent

(function($){
  $(document).ready(function(){
    var config = {
      over: function(){
        //$("#minicart").slideDown();
      },
      timeout: 250, // number = milliseconds delay before onMouseOut
      out: function(){
        //$("#minicart").slideUp();
      }
    };

    //$("#link-to-cart").hoverIntent( config )
    
    //$("#link-to-cart").on('click', function(){
    //  $("#minicart").slideToggle()
    //  return false;
    //})

    // hoverintent items created by js http://rndnext.blogspot.com/2009/02/jquery-live-and-plugins.html
    $(document).on('mouseover', "ul#minicart-items li", function(e)
    {
      if (!$(this).data('init'))
      {
        $(this).data('init', true);
        $(this).hoverIntent
        ({
          over: function(){
            $(this).find("[data-hook='minicart_item_description']").hide()
            $(this).find("[data-hook='minicart_item_actions']").show()
          },
          timeout: 100, // number = milliseconds delay before onMouseOut
          out: function(){
            $(this).find("[data-hook='minicart_item_description']").show()
            $(this).find("[data-hook='minicart_item_actions']").hide()
          }
        });
        $(this).trigger(e);
      }
    });

    $('body').not('#cart').on('click', 'form#update-minicart a.delete', function(e){
      $(this).parent().siblings('div[data-hook="minicart_item_quantity"]').find("input.line_item_quantity").val(0);
      $(this).parents('form').first().submit();
      e.preventDefault();
    });

    $('body').not('#cart').on("ajax:beforeSend", ".add_to_cart_form", function(){
      $("#progress").slideDown();
    })

    $('body').not('#cart').on("ajax:complete", ".add_to_cart_form", function(){
      $("#progress").slideUp();
    })
  });
})(jQuery);