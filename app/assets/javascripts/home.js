$(document).on('ready page:load', function(){
  var toggleShowTitle = function() {
        $('.pet-thumbnail').on({
          'mouseenter': function() {
            $(this).find('p').stop(true, true).slideDown();
          },
          'mouseleave': function() {
            $(this).find('p').stop(true, true).slideUp();
          }
        })
      };

  toggleShowTitle();
});
