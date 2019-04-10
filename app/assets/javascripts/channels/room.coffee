App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('ul.messages').prepend('<li>' + data.message + '</li>')
    $('#messages-count').html(data.count)

  speak: (message) ->
    @perform 'speak', message: message
