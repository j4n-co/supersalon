(function() {
  var add_prev_next_handlers;

  add_prev_next_handlers = function() {
    var thumbnails;
    var next = $('#next')
    var prev = $('#prev')

    thumbnails = $('#product-images ul.thumbnails');
    
    next.on('click', function(event){
      var thumbs = $('a.tmb-all')
      var main_image = $('#product-image').attr('src')
      var next_thumb_index = $('a.tmb-all[href="'+main_image+'"]').index('a.tmb-all')+1
      var next_thumb_url = $(thumbs.get(next_thumb_index)).attr('href')
      if (!next_thumb_url){
        next_thumb_url = $(thumbs.get(0)).attr('href')
      }
      $('#product-image').attr('src', next_thumb_url) 
    })

    prev.on('click', function(event){
      var thumbs = $('a.tmb-all')
      var main_image = $('#product-image').attr('src')
      var next_thumb_index = $('a.tmb-all[href="'+main_image+'"]').index('a.tmb-all')-1
      var next_thumb_url = $(thumbs.get(next_thumb_index)).attr('href')
      if (!next_thumb_url){
        next_thumb_url = thumbs.last().attr('href')
      }
      $('#product-image').attr('src', next_thumb_url) 
    })
  };

  $(function() {
    add_prev_next_handlers();
  });

}).call(this);