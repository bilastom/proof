window.App.Channels ||= {}
window.App.Channels.Room ||= {}

App.Channels.Room.subscribe = (roomId) ->
  App.room = App.cable.subscriptions.create { channel: 'RoomChannel', room_id: roomId },
    connected: ->
      # Called when the subscription is ready for use on the server
      @addAttendee()
    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      if data.message
        $('ul.messages').prepend('<li>' + data.message + '</li>')
        attendees = data['attendees']
      userAdd = data['addAttendee']
      removeAttendee = data['removeAttendee']
      list = $('ul#attendees')
      if userAdd
        debugger
        userNotExists = $('#user_' + userAdd.id).length == 0
        if userNotExists then list.append('<li id="user_' + userAdd.id + '">' + userAdd.email + '</li>')
      if removeAttendee
        $('li#user_' + removeAttendee.id ).remove()

    speak: (message) ->
      @perform 'speak', { message: message.value }

    addAttendee: ->
      @perform 'add_attendee'


