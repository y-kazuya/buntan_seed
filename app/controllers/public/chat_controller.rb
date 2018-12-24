class Public::ChatController < Public::ApplicationController
  before_action :logged_in_user
  before_action :manager_or_redirect, only: [:new]

  def new
    chat_room = ItemContact.find_or_create_by(item_id: params[:item_id],user_id: current_user.id)
    redirect_to item_chat_path(params[:item_id], chat_room)
  end

  def show
    @message = Message.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id != @item.user_id && !ItemContact.find(params[:id]) && current_user.id != ItemContact.find(params[:id]).user_id
    @messages = Message.where(item_contact_id: params[:id])
    @messages.update_all(looked: true) if owner?(@item)

  end


  private
  def manager_or_redirect
    redirect_to root_path if Item.find(params[:item_id]).user_id == current_user.id
  end
end
