$(document).ready(function() {
  var roomId = $('body').data('room-id')
  App.Channels.Room.subscribe(roomId)
  $('#message-form .submitBtn').click(function(event) {
    var inputMessage = $('#message')
    var value = inputMessage.val()
    inputMessage.val('')
    App.room.speak({ value: value })
  })
})
