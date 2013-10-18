
  $('#cancel_link').click(function(event) {
    event.preventDefault();
    $('.no-objects-found').show();
    $('#new_image_link').show();
    return $('#images').html('');
  });


  var fileUploadErrors = {
  maxFileSize: 'File is too big',
  minFileSize: 'File is too small',
  acceptFileTypes: 'Filetype not allowed',
  maxNumberOfFiles: 'Max number of files exceeded',
  uploadedBytes: 'Uploaded bytes exceed file size',
  emptyResult: 'Empty file upload result'
  };



 $(function () {
      // Initialize the jQuery File Upload widget:

      $('#new_image').fileupload();
      // Load existing files:
      $.getJSON($('#new_image').prop('action'), function (files) {
        var fu = $('#new_image').data('blueimpFileupload'), 
        template;
        fu._adjustMaxNumberOfFiles(-files.length);
        console.log(files);
        template = fu._renderDownload(files)
          .appendTo($('#new_image .files'));
        // Force reflow:
        fu._reflow = fu._transition && template.length &&
          template[0].offsetWidth;
        template.addClass('in');
        $('#loading').remove();
      });

  });