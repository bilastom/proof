class Message < ApplicationRecord
  after_create do
    ActionCable.server.broadcast "room_channel_#{self.room_id}", { message: content }
  end

  belongs_to :room
end
