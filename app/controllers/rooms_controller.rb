class RoomsController < ApplicationController
  def show
    @messages = Message.order('id DESC')
  end
end