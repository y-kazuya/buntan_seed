class Public::MessagesController < Public::ApplicationController

  before_action :check_user

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to item_chat_path(params[:item_id], params[:chat_id])
    else
      redirect_to :back
    end
  end

  def update
  end

  private
  def message_params
    params.require(:message).permit(
      :text,
      :image
      ).merge(user_id: current_user.id, item_contact_id: params[:chat_id])
  end

  def check_user
    redirect_to root_path if current_user.id != Item.find(params[:item_id]).user_id && !ItemContact.find(params[:chat_id]) && current_user.id != ItemContact.find(params[:chat_id]).user_id
  end
end
