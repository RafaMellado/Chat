class RoomsChannel < ApplicationCable::Channel
    def subscribed
        stream_for "rooms"
    end
end