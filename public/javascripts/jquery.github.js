(function( $ ) {
  $.fn.insertGithubRepositories = function() {
    var container = this;

    // Hide the container first.
    container.hide();

    // Then update it with loading message.
    container.html('<p class="loading"><img src="/images/ajax-loader.gif" alt=""> ' + container.attr('data-message-loading') + '</p>');

    // Let's show it! But start loading after the container is done fading in.
    container.fadeIn(function() {

      $.ajax({
        url: '/github-repositories',
        dataType: 'html',
        success: function(data)
        {
          // Hide the container and update it when it's hidden, then show it.
          container.fadeOut(function() {
            container.html(data);
            container.fadeIn();
          });
        },
        error: function()
        {
          // Hide the container and update it when it's hidden, then show it.
          container.fadeOut(function() {
            container.html('<p>' + container.attr('data-message-error') + '</p>');
            container.fadeIn();
          });
        }
      });

    });
  };
})( jQuery );