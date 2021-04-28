class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :indicate, :seek]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  
  def index
    if sort_params.present?
      @items = Item.sort_items(sort_params)
    else  
      @items = Item.includes(:user).order("created_at DESC")
    end
    
    @sort_list = Item.sort_list
  end
  
  def search
      @items = Item.search(params[:keyword])
  end

  def indicate
    if sort_params.present?
      @items = Item.where(user_id: current_user.id).sort_items(sort_params)
    else  
      @items = Item.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    end

    @sort_list = Item.where(user_id: current_user.id).sort_list
  end

  def seek
    @items = current_user.items.seek(params[:keyword])
  end  

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
       redirect_to root_path
    else
       render :new  
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity, :purchase_date, :expiration_date, :memo, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def sort_params
    params.permit(:sort)
  end 
end