$(document).on('ready page:load', function(){

  var count = $('.fields').length;

  $(document).click(function(event){
    var target = event.target;
    if(target.id == 'file') {
      target.id = 'file' + count;
      var label = $('#file' + count).parent('label')
      label.prop('for', 'file' + count)
      label.find('img').prop('id', 'preview-file' + count);
      count++;
    }
  });
  $('input[type=file]').change(
    function(){
      if( !this.files.length) {
        return;
      }
      var file = $(this).prop('files')[0];
      var id = $(this).prop('id');
      var fr = new FileReader();
      fr.onload = function() {
        $('#preview-' + id).attr('src', fr.result).css('display', 'inline');
      }
      fr.readAsDataURL(file);
    }
  )
});
