App.activity = App.cable.subscriptions.create "ActivityChannel",
  connected: ->
    console.log "hola"
    # Called when the subscription is ready for use on the server

  disconnected: ->
    console.log "chao"
    # Called when the subscription has been terminated by the server

  received: (data) ->
    total_notification = $('#total_notification').html()
    console.log total_notification
    html = '<li class="new-notification">' + '<a href="' + data.comment_url + '">' + data.messagge + '</a>' + '<a href="' + data.notification_url + '" id="read_notification"> Marcar como leido </a>' + '</li>'
    $(html).prependTo('#notifications')
    $('#total_notification').html(parseInt(total_notification)+1)
    # Called when there's incoming data on the websocket for this channel
