$(document).ready(function() {
  $('#message-form .submitBtn').click(function(event) {
    var inputMessage = $('#message')
    var value = inputMessage.val()
    inputMessage.val('')
    App.room.speak(value)
  })
})