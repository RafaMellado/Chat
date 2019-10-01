class RoomChannel < ApplicationCable::Channel
    def subscribed
        stream_for "room_#{params[:room]}"
    end
end