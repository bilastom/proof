class Message < ApplicationRecord
  after_create do
    ActionCable.server.broadcast 'room_channel', { message: content, count: Message.count }
  end
end
