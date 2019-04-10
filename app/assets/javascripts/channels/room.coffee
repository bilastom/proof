window.App.Channels ||= {}
window.App.Channels.Room ||= {}

App.Channels.Room.subscribe = (roomId) ->
  App.room = App.cable.subscriptions.create { channel: 'RoomChannel', room_id: roomId },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('ul.messages').prepend('<li>' + data.message + '</li>')
      $('#messages-count').html(data.count)

    speak: (message) ->
      @perform 'speak', { message: message.value }
