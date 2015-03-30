(function() {
  
  Spree.ready(function($) {

    var delivery_form = $('#checkout_form_delivery')
    
    if (delivery_form.is('*')) {

      delivery_form.find('input').change(function(){
        
        $.ajax({
               type: delivery_form.attr('method'),
               url: delivery_form.attr('action'),
               data: delivery_form.serialize()+"&remote=true", 
               success: function(data)
               {
                  
                   $('#delivery_order_summary').html($(data));
               }
             });

        return false;

      })

    }
  })

}).call(this);