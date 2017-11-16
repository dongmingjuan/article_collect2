class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end
  def show
     @message.update(active: true)
  end

  private
  def set_user
    @message = Message.find(params[:id])
  end
  def message_params
    params.require(:message).permit(:title, :content)
  end

end
