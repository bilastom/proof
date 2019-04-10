class RoomChannel < ApplicationCable::Channel
  def subscribed
    room_channel = "room_channel_#{params[:room_id]}"

    stream_from room_channel
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    Rails.logger.debug('-----debug')
    Rails.logger.debug(current_user)
    Attendee.find_by(user_id: current_user)
    ActionCable.server.broadcast "room_channel_#{params[:room_id]}", { removeAttendee: current_user }
  end

  def speak(data)
    Message.create! content: data['message'], room: Room.find(params[:room_id])
  end

  def add_attendee(data)
    attendee = Attendee.create! user_id: current_user.id, room_id: params[:room_id]

    ActionCable.server.broadcast "room_channel_#{params[:room_id]}", { addAttendee: attendee.user }
  end
end
