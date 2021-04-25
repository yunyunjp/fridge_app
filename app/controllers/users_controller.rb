class UsersController < ApplicationController
  @items = Item.where(user_id: current_user.id).order("created_at DESC")
  @user = User.find(params[:id])
end