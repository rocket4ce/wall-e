$(document).on('turbolinks:load', function() {
  function notificaciones_html(data) {
    var html = '<li class="new-notification">' +
    '<a href="'+data.comment_url+'">'+
      data.messagge +
    '</a>'+
    '<a href="'+data.notification_url+'" id="read_notification"> Marcar como leido </a>'+
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

  $('body').on('click', '#read_notification',function(event) {
    event.preventDefault();
    var item = $(this).parent('li');
    var total_notification = $('#total_notification')
    var val_total_notification = total_notification.html();

    $.ajax({
      url: $(this).attr("href"),
      type: 'PUT'
    })
    .done(function(data) {
      $(item).toggleClass('new-notification');
      total_notification.html(val_total_notification-1);
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

  });


})
