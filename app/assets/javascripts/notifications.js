$(document).on('turbolinks:load', function() {
  function notificaciones_html(data) {
    var html = '<li>' +
    '<a href="'+data.comment_url+'">'+
      data.messagge +
    '</a>'+
    '</li>';
    console.log(html);
    return html
  }

  $.ajax({
    url: '/notifications.json'
  })
  .done(function(data) {
    console.log(data);
    $('#total_notification').html(data.length);
    var notificacion = $('#notifications');

    for (var i = data.length - 1; i >= 0; i--) {
     $(notificaciones_html(data[i])).prependTo('#notifications');
    };

  })
  .fail(function(data) {
    console.log("error" + data);
  })
  .always(function(data) {
    console.log("complete"+ data);
  });


})
