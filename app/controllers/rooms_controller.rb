class RoomsController < ApplicationController
  before_action :authorize_request
  before_action :set_room, only: [:show, :update, :destroy]

  # GET /rooms
  def index
    @rooms = Room.all

    render json: @rooms
  end

  # GET /rooms/1
  def show
    render :json => [@room, Message.all.where(:room => @room).order('created_at desc').limit(20).only([:text, :user])]
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if Room.where(:name => @room.name).first
      render status: 409
      return
    end

    if @room.save
      render json: @room, status: :created, location: @room
      RoomsChannel.broadcast_to("rooms", @room)
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def room_params
      params.require(:room).permit(:name)
    end
end
