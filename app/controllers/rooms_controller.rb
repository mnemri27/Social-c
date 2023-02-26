class RoomsController < ApplicationController
  before_action :authenticate_account!
  def index
    @room = Room.new

    @rooms = Room.public_rooms

    @accounts = current_account.following
    render 'index'
  end

  def show
    @single_room = Room.find(params[:id])

    @room = Room.new
    @rooms = Room.public_rooms

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    @accounts = current_account.following
    render 'index'
  end

  def create
    @room = Room.create(name: params['room']['name'])
    if @room.save
      redirect_to 
    else
      render 'new'
    end
  end
end
 